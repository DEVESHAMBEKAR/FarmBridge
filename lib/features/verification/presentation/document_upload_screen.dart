import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/verification_document_model.dart';
import '../../../core/providers/providers.dart';
import '../../../app/theme/app_colors.dart';
import '../providers/verification_providers.dart';

class DocumentRequirement {
  final String type;
  final String name;

  const DocumentRequirement(this.type, this.name);
}

class DocumentUploadScreen extends ConsumerStatefulWidget {
  final String entityType; // e.g., 'farmer', 'logistics', 'dealer'

  const DocumentUploadScreen({super.key, required this.entityType});

  @override
  ConsumerState<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends ConsumerState<DocumentUploadScreen> {
  bool _isSubmitting = false;
  final ImagePicker _picker = ImagePicker();

  List<DocumentRequirement> get _requiredDocuments {
    switch (widget.entityType) {
      case 'farmer':
        return const [
          DocumentRequirement('identity_proof', 'Identity Proof (Aadhaar/PAN)'),
          DocumentRequirement('address_proof', 'Address Proof'),
          DocumentRequirement('farm_proof', 'Farm Ownership/Lease Proof'),
          DocumentRequirement('bank_proof', 'Bank Passbook/Cancelled Cheque'),
        ];
      case 'logistics':
        return const [
          DocumentRequirement('identity_proof', 'Identity Proof'),
          DocumentRequirement('driving_license', 'Driving License'),
          DocumentRequirement('vehicle_rc', 'Vehicle RC'),
          DocumentRequirement('insurance', 'Vehicle Insurance'),
          DocumentRequirement('puc', 'PUC Certificate'),
        ];
      case 'dealer':
      case 'wholesaler':
      case 'retailer':
        return const [
          DocumentRequirement('identity_proof', 'Identity Proof'),
          DocumentRequirement('business_proof', 'Business Registration Proof'),
          DocumentRequirement('gst_certificate', 'GST Certificate (If applicable)'),
          DocumentRequirement('address_proof', 'Business Address Proof'),
        ];
      default:
        return const [
          DocumentRequirement('identity_proof', 'Identity Proof'),
        ];
    }
  }

  Future<void> _uploadDocument(String docType, String docName) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (image == null) return;

    setState(() => _isSubmitting = true);
    try {
      final file = File(image.path);
      final docId = const Uuid().v4();
      final storagePath = 'verification-documents/${user.uid}/$docId.jpg';
      
      final storageRepo = ref.read(storageRepositoryProvider);
      final downloadUrl = await storageRepo.uploadVerificationDoc(
        uid: user.uid,
        docType: docType,
        file: file,
      );

      final newDoc = VerificationDocumentModel(
        documentId: docId,
        userId: user.uid,
        entityType: widget.entityType,
        documentType: docType,
        documentName: docName,
        storagePath: storagePath,
        downloadUrl: downloadUrl ?? '',
        status: 'SUBMITTED',
        uploadedAt: DateTime.now(),
        version: 1,
      );

      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      await firestoreRepo.setDocument(
        collection: FirestoreCollections.verificationDocuments,
        data: newDoc.toJson(),
        documentId: docId,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Document uploaded successfully')));
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error uploading document: $e')));
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  Future<void> _submitForReview(List<VerificationDocumentModel> uploadedDocs) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    // Optional: Validate that all required docs are present
    final uploadedTypes = uploadedDocs.map((d) => d.documentType).toSet();
    final missing = _requiredDocuments.where((r) => !uploadedTypes.contains(r.type)).toList();
    if (missing.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please upload all required documents.')));
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.users,
        documentId: user.uid,
        data: {
          'verification_status': 'UNDER_REVIEW',
          'updated_at': FieldValue.serverTimestamp(),
        },
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Application submitted for review!')));
        context.go('/verification/status');
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error submitting: $e')));
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    if (user == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final docsAsync = ref.watch(verificationDocumentsProvider(user.uid));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Upload'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: docsAsync.when(
        data: (uploadedDocs) {
          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  const Text('Please upload the following required documents to verify your account.', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 24),
                  ..._requiredDocuments.map((req) {
                    final matchingDocs = uploadedDocs.where((d) => d.documentType == req.type).toList();
                    matchingDocs.sort((a, b) => (b.uploadedAt ?? DateTime.now()).compareTo(a.uploadedAt ?? DateTime.now()));
                    final currentDoc = matchingDocs.isNotEmpty ? matchingDocs.first : null;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        title: Text(req.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(currentDoc != null ? 'Status: ${currentDoc.status}' : 'Not uploaded'),
                        trailing: currentDoc != null && (currentDoc.status == 'SUBMITTED' || currentDoc.status == 'VERIFIED' || currentDoc.status == 'UNDER_REVIEW')
                            ? const Icon(Icons.check_circle, color: Colors.green)
                            : OutlinedButton(
                                onPressed: _isSubmitting ? null : () => _uploadDocument(req.type, req.name),
                                child: const Text('Upload'),
                              ),
                        isThreeLine: currentDoc?.rejectionReason != null,
                        subtitleTextStyle: TextStyle(color: currentDoc?.status == 'REJECTED' ? Colors.red : null),
                      ),
                    );
                  }),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _isSubmitting ? null : () => _submitForReview(uploadedDocs),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      minimumSize: const Size(double.infinity, 50)
                    ),
                    child: _isSubmitting ? const CircularProgressIndicator(color: Colors.white) : const Text('Submit Application', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              if (_isSubmitting)
                Container(
                  color: Colors.black26,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
