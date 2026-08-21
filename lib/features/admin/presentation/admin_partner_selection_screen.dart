import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/providers/providers.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/user_model.dart';
import '../../../core/repositories/firestore_repository.dart';
import '../../../app/theme/app_colors.dart';

class AdminPartnerSelectionScreen extends ConsumerStatefulWidget {
  final String transportRequestId;
  const AdminPartnerSelectionScreen({super.key, required this.transportRequestId});
  @override
  ConsumerState<AdminPartnerSelectionScreen> createState() => _AdminPartnerSelectionScreenState();
}

class _AdminPartnerSelectionScreenState extends ConsumerState<AdminPartnerSelectionScreen> {
  bool _isAssigning = false;

  Future<void> _assignPartner(UserModel partner) async {
    final priceCtrl = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Assign to ${partner.displayName}'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Vehicle: ${partner.logisticsProfile?.vehicleType ?? "N/A"} - ${partner.logisticsProfile?.vehicleNumber ?? ""}'),
          const SizedBox(height: 16),
          TextField(controller: priceCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Agreed Price (Rs.)', border: OutlineInputBorder(), prefixText: 'Rs. ')),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Assign')),
        ],
      ),
    );

    if (confirmed != true) return;
    setState(() => _isAssigning = true);

    try {
      final firestore = ref.read(firestoreRepositoryProvider);
      final adminUser = ref.read(currentUserProvider);
      final bookingId = firestore.generateDocId(FirestoreCollections.transportBookings);

      final batch = <BatchOperation>[];
      batch.add(BatchOperation.set(
        collection: FirestoreCollections.transportBookings,
        documentId: bookingId,
        data: {
          'booking_id': bookingId,
          'transport_request_id': widget.transportRequestId,
          'provider_type': 'FARM_BRIDGE',
          'partner_id': partner.uid,
          'driver_name': partner.displayName,
          'driver_phone': partner.phone ?? '',
          'vehicle_number': partner.logisticsProfile?.vehicleNumber ?? '',
          'agreed_price': double.tryParse(priceCtrl.text.trim()) ?? 0,
          'status': 'ASSIGNED',
          'created_at': FieldValue.serverTimestamp(),
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.transportRequests,
        documentId: widget.transportRequestId,
        data: {'status': 'DISPATCHED', 'updated_at': FieldValue.serverTimestamp()},
      ));
      batch.add(BatchOperation.set(
        collection: FirestoreCollections.auditLogs,
        documentId: firestore.generateDocId(FirestoreCollections.auditLogs),
        data: {
          'admin_id': adminUser?.uid ?? 'unknown',
          'action': 'PARTNER_ASSIGNED',
          'entity_type': 'transport_request',
          'entity_id': widget.transportRequestId,
          'new_value': partner.uid,
          'timestamp': FieldValue.serverTimestamp(),
        },
      ));

      await firestore.batchWrite(batch);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Partner Assigned Successfully!')));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _isAssigning = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final firestoreRepo = ref.watch(firestoreRepositoryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Select Logistics Partner'), backgroundColor: AppColors.primary, foregroundColor: Colors.white),
      body: _isAssigning
          ? const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator(), SizedBox(height: 16), Text('Assigning partner...')]))
          : StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: firestoreRepo.firestore.collection(FirestoreCollections.users).where('role', isEqualTo: 'logistics').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                final partners = snapshot.data!.docs.map((doc) {
                  final data = doc.data();
                  if (!data.containsKey('uid')) data['uid'] = doc.id;
                  return UserModel.fromJson(data);
                }).where((u) => u.isVerified || u.verificationStatus == 'APPROVED').toList();

                if (partners.isEmpty) {
                  return const Center(child: Text('No verified logistics partners available.'));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: partners.length,
                  itemBuilder: (context, i) {
                    final p = partners[i];
                    final profile = p.logisticsProfile;
                    final isAvailable = profile?.isAvailable ?? true;
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor: isAvailable ? Colors.green : Colors.grey, child: Icon(Icons.local_shipping, color: Colors.white)),
                        title: Text(p.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${profile?.vehicleType ?? "Unknown"} | ${profile?.vehicleNumber ?? "N/A"}\n${isAvailable ? "Available" : "Busy"}'),
                        isThreeLine: true,
                        trailing: ElevatedButton(
                          onPressed: isAvailable ? () => _assignPartner(p) : null,
                          child: const Text('Assign'),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
