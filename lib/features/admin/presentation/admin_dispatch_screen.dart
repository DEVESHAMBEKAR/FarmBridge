import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/transport_request_model.dart';
import '../../../app/theme/app_colors.dart';

class AdminDispatchScreen extends ConsumerWidget {
  const AdminDispatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreRepo = ref.watch(firestoreRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispatch Center'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestoreRepo.firestore
            .collection(FirestoreCollections.transportRequests)
            .where('status', isEqualTo: 'PENDING')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.local_shipping_outlined, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No pending transport requests', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 8),
                  const Text('When farmers mark orders ready for pickup,\nthey will appear here.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          final requests = snapshot.data!.docs.map((doc) {
            final data = doc.data();
            data['request_id'] = doc.id;
            return TransportRequestModel.fromJson(data);
          }).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final req = requests[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order #${req.orderId?.substring(0, 8).toUpperCase() ?? "N/A"}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(8)),
                            child: const Text('PENDING DISPATCH', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 11)),
                          ),
                        ],
                      ),
                      const Divider(height: 20),
                      _infoRow(Icons.location_on_outlined, 'Pickup', req.pickupLocation),
                      const SizedBox(height: 8),
                      _infoRow(Icons.flag_outlined, 'Delivery', req.deliveryLocation),
                      const SizedBox(height: 8),
                      _infoRow(Icons.scale, 'Weight / Packages', '${req.totalWeight} KG / ${req.packageCount} pkg(s)'),
                      const SizedBox(height: 8),
                      _infoRow(Icons.local_shipping, 'Vehicle Required', req.requiredVehicleType),
                      if (req.refrigerationRequired)
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(children: [Icon(Icons.ac_unit, size: 16, color: Colors.blue), SizedBox(width: 4), Text('Refrigeration Required', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500))]),
                        ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => context.push('/admin/dispatch/assign-partner/${req.requestId}'),
                              icon: const Icon(Icons.person_pin, size: 18),
                              label: const Text('FarmBridge Partner'),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => context.push('/admin/dispatch/third-party/${req.requestId}'),
                              icon: const Icon(Icons.local_taxi, size: 18),
                              label: const Text('Third-Party'),
                              style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary, side: const BorderSide(color: AppColors.primary)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(child: RichText(text: TextSpan(text: '$label: ', style: const TextStyle(color: Colors.grey, fontSize: 13), children: [TextSpan(text: value, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500))]))),
      ],
    );
  }
}
