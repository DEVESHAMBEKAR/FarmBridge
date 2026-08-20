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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    if (user == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final pendingJobsAsync = ref.watch(pendingLogisticsJobsProvider);
    final activeJobsAsync = ref.watch(activeLogisticsJobsProvider(user.uid));

    return Scaffold(
      appBar: AppBar(title: const Text('Logistics Load Board')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Active Loads', style: Theme.of(context).textTheme.titleLarge),
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
                      color: AppColors.primaryContainer,
                      child: ListTile(
                        leading: const Icon(Icons.local_shipping),
                        title: Text('${job.pickupLocation} -> ${job.dropLocation}'),
                        subtitle: Text('Status: ${job.status}\nFreight: ₹${job.offeredFreightAmount}'),
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(height: 48),
            Text('Available Loads', style: Theme.of(context).textTheme.titleLarge),
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
