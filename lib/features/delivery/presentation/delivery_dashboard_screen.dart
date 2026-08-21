import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/providers/providers.dart';
import '../providers/logistics_jobs_provider.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/repositories/firestore_repository.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/models/transport_request_model.dart';

class DeliveryDashboardScreen extends ConsumerWidget {
  const DeliveryDashboardScreen({super.key});

  Future<bool> _verifyLocation(BuildContext context, double? targetLat, double? targetLng) async {
    if (targetLat == null || targetLng == null) {
      return true;
    }
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permission required for delivery verification.')));
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are permanently denied.')));
        return false;
      }

      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      
      final distance = Geolocator.distanceBetween(
        position.latitude, position.longitude,
        targetLat, targetLng
      );

      if (distance > 500) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('You are too far from the destination (${(distance/1000).toStringAsFixed(1)} km away). You must be at the location.'),
          backgroundColor: Colors.red,
        ));
        return false;
      }
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not verify location: $e')));
      return false;
    }
  }

  Future<void> _acceptJob(WidgetRef ref, BuildContext context, TransportRequestModel job, String driverId) async {
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final batch = <BatchOperation>[];
      
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.transportRequests,
        documentId: job.requestId,
        data: {
          'status': 'ACCEPTED',
          'transporter_id': driverId,
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));

      if (job.dealId != null) {
        batch.add(BatchOperation.update(
          collection: FirestoreCollections.deals,
          documentId: job.dealId!,
          data: {
            'transport_status': 'ACCEPTED',
            'updated_at': FieldValue.serverTimestamp(),
          }
        ));
      }

      await firestoreRepo.batchWrite(batch);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Load Accepted Successfully!')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _updateJobStatus(WidgetRef ref, BuildContext context, TransportRequestModel job, String newStatus) async {
    if (newStatus == 'PICKED_UP') {
      final isAtLocation = await _verifyLocation(context, job.pickupLatitude, job.pickupLongitude);
      if (!isAtLocation) return;
    }
    if (newStatus == 'DELIVERED') {
      final isAtLocation = await _verifyLocation(context, job.deliveryLatitude, job.deliveryLongitude);
      if (!isAtLocation) return;
    }

    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final batch = <BatchOperation>[];
      
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.transportRequests,
        documentId: job.requestId,
        data: {
          'status': newStatus,
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));

      if (job.dealId != null) {
        batch.add(BatchOperation.update(
          collection: FirestoreCollections.deals,
          documentId: job.dealId!,
          data: {
            'transport_status': newStatus,
            'updated_at': FieldValue.serverTimestamp(),
          }
        ));
      }

      await firestoreRepo.batchWrite(batch);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status updated to: $newStatus')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _updateOrderStatus(WidgetRef ref, BuildContext context, OrderModel order, String newStatus) async {
    if (newStatus == 'delivered') {
      final isAtLocation = await _verifyLocation(context, order.deliveryLatitude, order.deliveryLongitude);
      if (!isAtLocation) return;
    }

    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.orders,
        documentId: order.orderId,
        data: {
          'status': newStatus,
          'updated_at': FieldValue.serverTimestamp(),
        },
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Status Updated!')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    if (user == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final pendingJobsAsync = ref.watch(pendingLogisticsJobsProvider);
    final activeJobsAsync = ref.watch(activeLogisticsJobsProvider(user.uid));
    final activeOrdersAsync = ref.watch(deliveryOrdersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Logistics Load Board')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Active Loads (Tracking)', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AsyncValueWidget(
              value: activeJobsAsync,
              data: (jobs) {
                if (jobs.isEmpty) return const Text('No active loads.');
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${job.totalWeight} kg • ${job.productType}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                                  child: Text(job.status, style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                                )
                              ],
                            ),
                            const Divider(height: 24),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.green),
                                const SizedBox(width: 8),
                                Expanded(child: Text(job.pickupLocation)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.red),
                                const SizedBox(width: 8),
                                Expanded(child: Text(job.deliveryLocation)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if (job.status != 'DELIVERED') ...[
                              const Text('Update Tracking Status:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  if (job.status == 'ACCEPTED')
                                    ElevatedButton(
                                      onPressed: () => _updateJobStatus(ref, context, job, 'PICKED_UP'),
                                      child: const Text('Mark Picked Up'),
                                    ),
                                  if (job.status == 'PICKED_UP')
                                    ElevatedButton(
                                      onPressed: () => _updateJobStatus(ref, context, job, 'IN_TRANSIT'),
                                      child: const Text('Mark In Transit'),
                                    ),
                                  if (job.status == 'IN_TRANSIT')
                                    ElevatedButton(
                                      onPressed: () => _updateJobStatus(ref, context, job, 'DELIVERED'),
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                                      child: const Text('Mark Delivered'),
                                    ),
                                ],
                              ),
                            ]
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            Text('Assigned Retail Orders', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AsyncValueWidget(
              value: activeOrdersAsync,
              data: (orders) {
                if (orders.isEmpty) return const Text('No assigned retail orders.');
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.blue.withOpacity(0.3)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Order #${order.orderId.substring(0,6).toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(12)),
                                  child: Text(order.status.toUpperCase(), style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                                )
                              ],
                            ),
                            const Divider(height: 24),
                            Text('Buyer: ${order.buyerName}', style: const TextStyle(fontWeight: FontWeight.w500)),
                            Text('Delivery: ${order.deliveryAddress} - ${order.deliveryPincode}', style: const TextStyle(color: Colors.grey)),
                            const SizedBox(height: 16),
                            if (order.status != 'delivered') ...[
                              const Text('Update Tracking Status:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  if (order.status == 'confirmed')
                                    ElevatedButton(
                                      onPressed: () => _updateOrderStatus(ref, context, order, 'packed'),
                                      child: const Text('Mark as Packed'),
                                    ),
                                  if (order.status == 'packed')
                                    ElevatedButton(
                                      onPressed: () => _updateOrderStatus(ref, context, order, 'in_transit'),
                                      child: const Text('Mark as In Transit'),
                                    ),
                                  if (order.status == 'in_transit')
                                    ElevatedButton(
                                      onPressed: () => _updateOrderStatus(ref, context, order, 'delivered'),
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                                      child: const Text('Mark as Delivered'),
                                    ),
                                ],
                              ),
                            ]
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(height: 48),
            Text('Available Loads', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AsyncValueWidget(
              value: pendingJobsAsync,
              data: (jobs) {
                if (jobs.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text('No available loads on the board.'),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${job.totalWeight} kg • ${job.productType}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text(job.requiredVehicleType, style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.green),
                                const SizedBox(width: 8),
                                Expanded(child: Text(job.pickupLocation)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.red),
                                const SizedBox(width: 8),
                                Expanded(child: Text(job.deliveryLocation)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => _acceptJob(ref, context, job, user.uid),
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                                child: const Text('Accept Load'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
