import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/constants/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FarmerOrderState {
  final bool isLoading;
  final String? error;

  const FarmerOrderState({this.isLoading = false, this.error});
}

class FarmerOrderNotifier extends StateNotifier<FarmerOrderState> {
  final Ref ref;

  FarmerOrderNotifier(this.ref) : super(const FarmerOrderState());

  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    state = const FarmerOrderState(isLoading: true);
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      
      await firestoreRepo.setDocument(
        collection: FirestoreCollections.orders,
        documentId: orderId,
        data: {
          'status': newStatus,
          'updated_at': FieldValue.serverTimestamp(),
        },
        merge: true,
      );

      state = const FarmerOrderState(isLoading: false);
    } catch (e) {
      state = FarmerOrderState(isLoading: false, error: e.toString());
    }
  }
}

final farmerOrderNotifierProvider = StateNotifierProvider<FarmerOrderNotifier, FarmerOrderState>((ref) {
  return FarmerOrderNotifier(ref);
});
