import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/providers/providers.dart';
import '../providers/logistics_jobs_provider.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/repositories/firestore_repository.dart';

class DeliveryDashboardScreen extends ConsumerWidget {
  const DeliveryDashboardScreen({super.key});

  Future<void> _acceptJob(WidgetRef ref, BuildContext context, String jobId, String driverId, String dealId) async {
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final batch = <BatchOperation>[];
      
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.logisticsRequests,
        documentId: jobId,
        data: {
          'status': 'ACCEPTED',
          'transporter_id': driverId,
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));

      batch.add(BatchOperation.update(
        collection: FirestoreCollections.deals,
        documentId: dealId,
        data: {
          'transport_status': 'ACCEPTED',
          'updated_at': FieldValue.serverTimestamp(),
        }
      ));

      await firestoreRepo.batchWrite(batch);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job Accepted Successfully!')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _updateJobStatus(WidgetRef ref, BuildContext context, String jobId, String dealId, String newStatus) async {
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final batch = <BatchOperation>[];
      
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.logisticsRequests,
        documentId: jobId,
        data: {
          'status': newStatus,
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));

      // Also update the underlying deal tracking status
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.deals,
        documentId: dealId,
        data: {
          'transport_status': newStatus,
          'updated_at': FieldValue.serverTimestamp(),
        }
      ));

      await firestoreRepo.batchWrite(batch);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status updated to: $newStatus')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  Future<void> _updateOrderStatus(WidgetRef ref, BuildContext context, String orderId, String newStatus) async {
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.orders,
        documentId: orderId,
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
                                Text('Job #${job.jobId.substring(0,6).toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(12)),
                                  child: Text(job.status, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                                )
                              ],
                            ),
                            const Divider(height: 24),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.green, size: 20),
                                const SizedBox(width: 8),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Pickup', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    Text(job.pickupLocation, style: const TextStyle(fontWeight: FontWeight.w500)),
                                  ],
                                )),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.red, size: 20),
                                const SizedBox(width: 8),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Drop-off', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    Text(job.dropLocation, style: const TextStyle(fontWeight: FontWeight.w500)),
                                  ],
                                )),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Distance: ${job.distanceKm} KM', style: const TextStyle(color: Colors.grey)),
                                Text('Freight: ₹${job.offeredFreightAmount}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Tracking Actions
                            if (job.status != 'DELIVERED') ...[
                              const Text('Update Tracking Status:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  if (job.status == 'ACCEPTED')
                                    ElevatedButton(
                                      onPressed: () => _updateJobStatus(ref, context, job.jobId, job.dealId, 'PICKED_UP'),
                                      child: const Text('Mark as Picked Up'),
                                    ),
                                  if (job.status == 'PICKED_UP')
                                    ElevatedButton(
                                      onPressed: () => _updateJobStatus(ref, context, job.jobId, job.dealId, 'IN_TRANSIT'),
                                      child: const Text('Mark as In Transit'),
                                    ),
                                  if (job.status == 'IN_TRANSIT')
                                    ElevatedButton(
                                      onPressed: () => _updateJobStatus(ref, context, job.jobId, job.dealId, 'DELIVERED'),
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
                                      onPressed: () => _updateOrderStatus(ref, context, order.orderId, 'packed'),
                                      child: const Text('Mark as Packed'),
                                    ),
                                  if (order.status == 'packed')
                                    ElevatedButton(
                                      onPressed: () => _updateOrderStatus(ref, context, order.orderId, 'in_transit'),
                                      child: const Text('Mark as In Transit'),
                                    ),
                                  if (order.status == 'in_transit')
                                    ElevatedButton(
                                      onPressed: () => _updateOrderStatus(ref, context, order.orderId, 'delivered'),
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
                                Text('${job.distanceKm} KM', style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text('₹${job.offeredFreightAmount}', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 18)),
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
                                Expanded(child: Text(job.dropLocation)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => _acceptJob(ref, context, job.jobId, user.uid, job.dealId),
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
