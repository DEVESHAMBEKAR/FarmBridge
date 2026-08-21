import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/providers/providers.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/logistics_provider_model.dart';
import '../../../core/repositories/firestore_repository.dart';
import '../../../app/theme/app_colors.dart';

class AdminThirdPartyScreen extends ConsumerStatefulWidget {
  final String transportRequestId;
  const AdminThirdPartyScreen({super.key, required this.transportRequestId});
  @override
  ConsumerState<AdminThirdPartyScreen> createState() => _AdminThirdPartyScreenState();
}

class _AdminThirdPartyScreenState extends ConsumerState<AdminThirdPartyScreen> {
  bool _isSubmitting = false;

  Future<void> _seedDemoProviders() async {
    final firestore = ref.read(firestoreRepositoryProvider);
    final providers = [
      {'provider_id': 'porter', 'name': 'Porter', 'provider_type': 'THIRD_PARTY', 'api_enabled': false, 'booking_enabled': true, 'tracking_enabled': false, 'pricing_enabled': false, 'vehicle_types': ['BIKE_CARGO', 'TATA_ACE', 'MINI_TRUCK'], 'status': 'ACTIVE'},
      {'provider_id': 'shadowfax', 'name': 'Shadowfax', 'provider_type': 'THIRD_PARTY', 'api_enabled': false, 'booking_enabled': true, 'tracking_enabled': false, 'pricing_enabled': false, 'vehicle_types': ['BIKE_CARGO', 'AUTO_CARGO'], 'status': 'ACTIVE'},
      {'provider_id': 'rapido', 'name': 'Rapido', 'provider_type': 'THIRD_PARTY', 'api_enabled': false, 'booking_enabled': true, 'tracking_enabled': false, 'pricing_enabled': false, 'vehicle_types': ['BIKE_CARGO', 'AUTO_CARGO', 'THREE_WHEELER'], 'status': 'ACTIVE'},
    ];
    for (final p in providers) {
      await firestore.setDocument(collection: FirestoreCollections.logisticsProviders, documentId: p['provider_id'] as String, data: p, merge: true);
    }
    if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Demo providers seeded!')));
  }

  Future<void> _bookWithProvider(LogisticsProviderModel provider) async {
    final extBookingCtrl = TextEditingController();
    final driverNameCtrl = TextEditingController();
    final driverPhoneCtrl = TextEditingController();
    final vehicleNumCtrl = TextEditingController();
    final trackingUrlCtrl = TextEditingController();
    final priceCtrl = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Book via ${provider.name}'),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(controller: extBookingCtrl, decoration: const InputDecoration(labelText: 'External Booking ID', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: driverNameCtrl, decoration: const InputDecoration(labelText: 'Driver Name', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: driverPhoneCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Driver Phone', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: vehicleNumCtrl, decoration: const InputDecoration(labelText: 'Vehicle Number', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: trackingUrlCtrl, decoration: const InputDecoration(labelText: 'Tracking URL (optional)', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: priceCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Agreed Price (Rs.)', border: OutlineInputBorder(), prefixText: 'Rs. ')),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Book')),
        ],
      ),
    );

    if (confirmed != true) return;
    setState(() => _isSubmitting = true);

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
          'provider_type': 'THIRD_PARTY',
          'provider_id': provider.providerId,
          'external_booking_id': extBookingCtrl.text.trim(),
          'driver_name': driverNameCtrl.text.trim(),
          'driver_phone': driverPhoneCtrl.text.trim(),
          'vehicle_number': vehicleNumCtrl.text.trim(),
          'tracking_url': trackingUrlCtrl.text.trim().isEmpty ? null : trackingUrlCtrl.text.trim(),
          'agreed_price': double.tryParse(priceCtrl.text.trim()) ?? 0,
          'status': 'BOOKED_EXTERNAL',
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
          'action': 'THIRD_PARTY_BOOKED',
          'entity_type': 'transport_request',
          'entity_id': widget.transportRequestId,
          'new_value': provider.providerId,
          'timestamp': FieldValue.serverTimestamp(),
        },
      ));
      await firestore.batchWrite(batch);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booked via ${provider.name}!')));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final firestoreRepo = ref.watch(firestoreRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third-Party Logistics'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [TextButton(onPressed: _seedDemoProviders, child: const Text('Seed Providers', style: TextStyle(color: Colors.white)))],
      ),
      body: _isSubmitting
          ? const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator(), SizedBox(height: 16), Text('Creating booking...')]))
          : StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: firestoreRepo.firestore.collection(FirestoreCollections.logisticsProviders).where('status', isEqualTo: 'ACTIVE').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Icon(Icons.add_business, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text('No providers configured', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      const SizedBox(height: 16),
                      ElevatedButton(onPressed: _seedDemoProviders, child: const Text('Add Demo Providers')),
                    ]),
                  );
                }

                final providers = snapshot.data!.docs.map((doc) {
                  final data = doc.data();
                  if (!data.containsKey('provider_id')) data['provider_id'] = doc.id;
                  return LogisticsProviderModel.fromJson(data);
                }).toList();

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: providers.length,
                  itemBuilder: (context, i) {
                    final p = providers[i];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor: AppColors.primaryContainer, child: Text(p.name.substring(0, 1), style: TextStyle(color: AppColors.onPrimaryContainer, fontWeight: FontWeight.bold))),
                        title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(p.vehicleTypes.join(', ')),
                        trailing: ElevatedButton(
                          onPressed: () => _bookWithProvider(p),
                          child: const Text('Book'),
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
