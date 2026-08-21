import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/repositories/firestore_repository.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/models/verification_document_model.dart';
import '../../../verification/providers/verification_providers.dart';
import 'widgets/document_viewer_dialog.dart';

class AdminVerificationDetailScreen extends ConsumerStatefulWidget {
  final String userId;

  const AdminVerificationDetailScreen({super.key, required this.userId});

  @override
  ConsumerState<AdminVerificationDetailScreen> createState() => _AdminVerificationDetailScreenState();
}

class _AdminVerificationDetailScreenState extends ConsumerState<AdminVerificationDetailScreen> {
  final Map<String, bool> _checklist = {};
  bool _isApproving = false;

  Future<void> _updateDocumentStatus(VerificationDocumentModel doc, String newStatus, {String? reason}) async {
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.verificationDocuments,
        documentId: doc.documentId,
        data: {
          'status': newStatus,
          if (reason != null) 'rejection_reason': reason,
        },
      );
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Document marked as $newStatus')));
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  void _showRejectDialog(VerificationDocumentModel doc) {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reject Document'),
        content: TextField(
          controller: ctrl,
          decoration: const InputDecoration(labelText: 'Reason for rejection', border: OutlineInputBorder()),
          maxLines: 3,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (ctrl.text.trim().isEmpty) return;
              Navigator.pop(context);
              _updateDocumentStatus(doc, 'REJECTED', reason: ctrl.text.trim());
              
              // Set user status to REQUIRES_CORRECTION
              ref.read(firestoreRepositoryProvider).updateDocument(
                collection: FirestoreCollections.users,
                documentId: widget.userId,
                data: {'verification_status': 'REQUIRES_CORRECTION'},
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text('Reject'),
          )
        ],
      ),
    );
  }

  Future<void> _approveEntity(UserModel user, List<VerificationDocumentModel> docs) async {
    // 1. All submitted docs must be VERIFIED
    final pendingDocs = docs.where((d) => d.status != 'VERIFIED').toList();
    if (pendingDocs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cannot approve. All documents must be verified.')));
      return;
    }

    // 2. Checklist must be complete
    if (_checklist.values.any((v) => !v) || _checklist.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cannot approve. Complete the checklist first.')));
      return;
    }

    setState(() => _isApproving = true);
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      
      final batch = <BatchOperation>[];
      
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.users,
        documentId: user.uid,
        data: {
          'verification_status': 'APPROVED',
          'is_verified': true,
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));
      
      final adminUser = ref.read(currentUserProvider);
      final auditId = const Uuid().v4();
      batch.add(BatchOperation.set(
        collection: FirestoreCollections.verificationAuditLogs,
        documentId: auditId,
        data: {
          'audit_id': auditId,
          'admin_id': adminUser?.uid ?? 'unknown_admin',
          'entity_id': user.uid,
          'entity_type': user.role,
          'action': 'ENTITY_APPROVED',
          'previous_status': user.verificationStatus,
          'new_status': 'APPROVED',
          'timestamp': FieldValue.serverTimestamp(),
        }
      ));

      await firestoreRepo.batchWrite(batch);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Entity Approved successfully!')));
        context.pop();
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _isApproving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // We need to fetch the user and their documents
    final firestore = ref.watch(firestoreRepositoryProvider).firestore;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Detail'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: firestore.collection(FirestoreCollections.users).doc(widget.userId).snapshots(),
        builder: (context, userSnap) {
          if (!userSnap.hasData) return const Center(child: CircularProgressIndicator());
          if (!userSnap.data!.exists) return const Center(child: Text('User not found.'));
          
          final user = UserModel.fromJson(userSnap.data!.data() as Map<String, dynamic>);
          
          if (_checklist.isEmpty) {
            _checklist['Identity verified'] = false;
            _checklist['Profile information verified'] = false;
            if (user.role == 'farmer') _checklist['Farm information reviewed'] = false;
            if (user.role == 'logistics') _checklist['Vehicle RC/Insurance verified'] = false;
            _checklist['No unresolved issues'] = false;
          }

          return StreamBuilder<QuerySnapshot>(
            stream: firestore.collection(FirestoreCollections.verificationDocuments).where('user_id', isEqualTo: user.uid).snapshots(),
            builder: (context, docsSnap) {
              if (!docsSnap.hasData) return const Center(child: CircularProgressIndicator());
              
              final docs = docsSnap.data!.docs.map((d) {
                final data = d.data() as Map<String, dynamic>;
                if (!data.containsKey('document_id')) data['document_id'] = d.id;
                return VerificationDocumentModel.fromJson(data);
              }).toList();

              final bool allDocsVerified = docs.isNotEmpty && docs.every((d) => d.status == 'VERIFIED');
              final bool checklistComplete = _checklist.values.every((v) => v);
              final bool canApprove = allDocsVerified && checklistComplete && user.verificationStatus != 'APPROVED';

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LEFT PANE: Profile
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: AppColors.outlineVariant.withOpacity(0.5))),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.all(24),
                        children: [
                          const Text('Entity Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 24),
                          CircleAvatar(
                            radius: 40,
                            child: Text(user.displayName.isNotEmpty ? user.displayName[0].toUpperCase() : '?', style: const TextStyle(fontSize: 32)),
                          ),
                          const SizedBox(height: 16),
                          _buildDetailRow('Name', user.displayName),
                          _buildDetailRow('Role', user.role.toUpperCase()),
                          _buildDetailRow('Status', user.verificationStatus),
                          _buildDetailRow('Phone', user.phone ?? 'N/A'),
                          _buildDetailRow('Email', user.email ?? 'N/A'),
                          const Divider(height: 32),
                          if (user.role == 'farmer' && user.farmerProfile != null) ...[
                            const Text('Farm Information', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            _buildDetailRow('Farm Name', user.farmerProfile!.farmName),
                            _buildDetailRow('Address', user.farmerProfile!.farmAddress),
                            _buildDetailRow('Acres', user.farmerProfile!.farmSizeAcres.toString()),
                          ],
                          if (user.role == 'logistics' && user.logisticsProfile != null) ...[
                            const Text('Vehicle Information', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            _buildDetailRow('Vehicle Type', user.logisticsProfile!.vehicleType),
                            _buildDetailRow('Vehicle Number', user.logisticsProfile!.vehicleNumber),
                            _buildDetailRow('License Number', user.logisticsProfile!.licenseNumber),
                          ],
                        ],
                      ),
                    ),
                  ),

                  // RIGHT PANE: Documents & Checklist
                  Expanded(
                    flex: 2,
                    child: ListView(
                      padding: const EdgeInsets.all(24),
                      children: [
                        const Text('Verification Checklist', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        ..._checklist.keys.map((key) {
                          return CheckboxListTile(
                            title: Text(key),
                            value: _checklist[key],
                            onChanged: (val) {
                              setState(() => _checklist[key] = val ?? false);
                            },
                          );
                        }),
                        const Divider(height: 48),
                        const Text('Documents', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        if (docs.isEmpty)
                          const Text('No documents uploaded.')
                        else
                          ...docs.map((doc) => _buildDocumentCard(doc)),
                        const SizedBox(height: 48),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: canApprove && !_isApproving ? () => _approveEntity(user, docs) : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor: Colors.grey.shade300,
                            ),
                            child: _isApproving
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text('APPROVE ENTITY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          );
        }
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 120, child: Text(label, style: const TextStyle(color: Colors.grey))),
          Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  Widget _buildDocumentCard(VerificationDocumentModel doc) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(doc.documentName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: doc.status == 'VERIFIED' ? Colors.green.withOpacity(0.1) : (doc.status == 'REJECTED' ? Colors.red.withOpacity(0.1) : Colors.orange.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text(doc.status, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: doc.status == 'VERIFIED' ? Colors.green : (doc.status == 'REJECTED' ? Colors.red : Colors.orange))),
                )
              ],
            ),
            if (doc.rejectionReason != null) ...[
              const SizedBox(height: 8),
              Text('Rejection Reason: ${doc.rejectionReason}', style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    showDialog(context: context, builder: (_) => DocumentViewerDialog(document: doc));
                  },
                  icon: const Icon(Icons.visibility),
                  label: const Text('View Document'),
                ),
                const Spacer(),
                if (doc.status != 'VERIFIED') ...[
                  TextButton(
                    onPressed: () => _showRejectDialog(doc),
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    child: const Text('REJECT'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _updateDocumentStatus(doc, 'VERIFIED'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                    child: const Text('VERIFY'),
                  ),
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
