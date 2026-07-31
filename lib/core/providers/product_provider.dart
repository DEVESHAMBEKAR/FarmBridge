import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';

// ─── Products Stream ──────────────────────────────────────────

/// A provider that streams all active products.
final allActiveProductsProvider = StreamProvider<List<ProductModel>>((ref) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.products,
        field: FirestoreFields.status,
        value: ProductStatus.active,
        orderByField: FirestoreFields.createdAt,
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList();
  });
});

/// A provider that streams products for a specific farmer.
final farmerProductsProvider = StreamProvider.family<List<ProductModel>, String>((ref, farmerId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.products,
        field: FirestoreFields.farmerId,
        value: farmerId,
        orderByField: FirestoreFields.createdAt,
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList();
  });
});

/// A provider that streams a single product by ID.
final productStreamProvider = StreamProvider.family<ProductModel?, String>((ref, productId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getDocumentStream(
        collection: FirestoreCollections.products,
        documentId: productId,
      )
      .map((snapshot) {
    if (snapshot.exists && snapshot.data() != null) {
      return ProductModel.fromJson(snapshot.data()!);
    }
    return null;
  });
});
