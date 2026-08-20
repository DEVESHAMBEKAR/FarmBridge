import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../providers/farmer_negotiations_provider.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/models/negotiation_model.dart';
import '../../../../core/repositories/firestore_repository.dart';

class FarmerNegotiationsScreen extends ConsumerWidget {
  const FarmerNegotiationsScreen({super.key});

  Future<void> _updateNegotiationStatus(WidgetRef ref, BuildContext context, NegotiationModel neg, String status) async {
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      
      final batch = <BatchOperation>[];
      
      batch.add(
        BatchOperation.update(
          collection: FirestoreCollections.negotiations,
          documentId: neg.negotiationId,
          data: {
            'status': status,
            'updated_at': FieldValue.serverTimestamp(),
          },
        ),
      );

      if (status == DealStatus.agreed) {
        final dealId = firestoreRepo.generateDocId(FirestoreCollections.deals);
        final totalAmount = neg.currentOfferPrice * 1000; // Mock quantity for now
        
        batch.add(
          BatchOperation.set(
            collection: FirestoreCollections.deals,
            documentId: dealId,
            data: {
              'deal_id': dealId,
              'farmer_id': neg.farmerId,
              'buyer_id': neg.buyerId,
              'product_id': neg.productId,
              'product_name': 'Bulk Produce',
              'quantity': 1000,
              'agreed_price_per_unit': neg.currentOfferPrice,
              'total_amount': totalAmount,
              'pickup_address': 'Farmer Farm Location',
              'delivery_address': 'Dealer Warehouse',
              'expected_pickup_date': FieldValue.serverTimestamp(),
              'expected_delivery_date': FieldValue.serverTimestamp(),
              'payment_status': PaymentStatus.pending,
              'transport_status': 'PENDING',
              'deal_status': DealStatus.agreed,
              'created_at': FieldValue.serverTimestamp(),
              'updated_at': FieldValue.serverTimestamp(),
            },
          ),
        );

        final jobId = firestoreRepo.generateDocId(FirestoreCollections.logisticsRequests);
        batch.add(
          BatchOperation.set(
            collection: FirestoreCollections.logisticsRequests,
            documentId: jobId,
            data: {
              'job_id': jobId,
              'deal_id': dealId,
              'pickup_location': 'Farmer Farm Location',
              'drop_location': 'Dealer Warehouse',
              'distance_km': 150.0,
              'required_vehicle_type': 'Truck',
              'expected_pickup_time': FieldValue.serverTimestamp(),
              'expected_delivery_time': FieldValue.serverTimestamp(),
              'status': 'PENDING',
              'offered_freight_amount': 5000.0, // Base freight 
              'created_at': FieldValue.serverTimestamp(),
              'updated_at': FieldValue.serverTimestamp(),
            }
          )
        );
      }

      await firestoreRepo.batchWrite(batch);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Negotiation $status')));
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

    final negotiationsAsync = ref.watch(farmerNegotiationsProvider(user.uid));

    return Scaffold(
      appBar: AppBar(title: const Text('B2B Offers & Negotiations')),
      body: AsyncValueWidget(
        value: negotiationsAsync,
        data: (negotiations) {
          if (negotiations.isEmpty) {
            return const Center(child: Text('You have no incoming bulk offers yet.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: negotiations.length,
            itemBuilder: (context, index) {
              final neg = negotiations[index];
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
                          Text('Offer for your Product', style: Theme.of(context).textTheme.titleMedium),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: neg.status == DealStatus.agreed ? Colors.green.shade100 : Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              neg.status.toUpperCase(),
                              style: TextStyle(
                                color: neg.status == DealStatus.agreed ? Colors.green.shade800 : Colors.orange.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Current Offer: ₹${neg.currentOfferPrice}/unit', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Last Updated: ${neg.updatedAt?.toLocal().toString().split('.')[0] ?? "Recently"}'),
                      const Divider(height: 32),
                      if (neg.status == DealStatus.negotiating)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => _updateNegotiationStatus(ref, context, neg, DealStatus.cancelled),
                              child: const Text('Reject', style: TextStyle(color: Colors.red)),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => _updateNegotiationStatus(ref, context, neg, DealStatus.agreed),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                              child: const Text('Accept & Make Deal'),
                            ),
                          ],
                        ),
                      if (neg.status == DealStatus.agreed)
                        const SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: null,
                            child: Text('Deal Confirmed - Awaiting Logistics'),
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
    );
  }
}
