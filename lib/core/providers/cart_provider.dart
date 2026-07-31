import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';
import 'user_provider.dart';

// ─── Cart Stream ──────────────────────────────────────────────

/// A provider that streams the current user's cart summary.
final cartProvider = StreamProvider<CartModel?>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value(null);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getDocumentStream(
        collection: FirestoreCollections.carts,
        documentId: authUser.uid,
      )
      .map((snapshot) {
    if (snapshot.exists && snapshot.data() != null) {
      return CartModel.fromJson(snapshot.data()!);
    }
    return null;
  });
});

/// A provider that streams the items within the current user's cart.
final cartItemsProvider = StreamProvider<List<CartItemModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value([]);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getSubCollectionStream(
        parentCollection: FirestoreCollections.carts,
        parentDocId: authUser.uid,
        subCollection: FirestoreCollections.cartItems,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => CartItemModel.fromJson(doc.data())).toList();
  });
});
