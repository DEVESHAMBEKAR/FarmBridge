import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/constants/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryOrderState {
  final bool isLoading;
  final String? error;

  const DeliveryOrderState({this.isLoading = false, this.error});
}

class DeliveryOrderNotifier extends StateNotifier<DeliveryOrderState> {
  final Ref ref;

  DeliveryOrderNotifier(this.ref) : super(const DeliveryOrderState());

  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    state = const DeliveryOrderState(isLoading: true);
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      
      await firestoreRepo.setDocument(
        collection: FirestoreCollections.orders,
        documentId: orderId,
        data: {
          'status': newStatus,
          'updated_at': FieldValue.serverTimestamp(),
          if (newStatus == 'delivered') 'delivered_at': FieldValue.serverTimestamp(),
        },
        merge: true,
      );

      state = const DeliveryOrderState(isLoading: false);
    } catch (e) {
      state = DeliveryOrderState(isLoading: false, error: e.toString());
    }
  }

  Future<void> claimOrder(String orderId) async {
    state = const DeliveryOrderState(isLoading: true);
    try {
      final user = ref.read(currentUserProvider);
      if (user == null) throw Exception('User not logged in');

      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      
      await firestoreRepo.setDocument(
        collection: FirestoreCollections.orders,
        documentId: orderId,
        data: {
          'status': 'out_for_delivery',
          'delivery_partner_id': user.uid,
          'updated_at': FieldValue.serverTimestamp(),
        },
        merge: true,
      );

      state = const DeliveryOrderState(isLoading: false);
    } catch (e) {
      state = DeliveryOrderState(isLoading: false, error: e.toString());
    }
  }
}

final deliveryOrderNotifierProvider = StateNotifierProvider<DeliveryOrderNotifier, DeliveryOrderState>((ref) {
  return DeliveryOrderNotifier(ref);
});
