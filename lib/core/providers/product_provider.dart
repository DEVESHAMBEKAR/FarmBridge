import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';

// ─── Products Stream ──────────────────────────────────────────

/// A provider that streams all active retail products for the Consumer Marketplace.
final consumerProductsProvider = StreamProvider<List<ProductModel>>((ref) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.products)
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['product_id'] = doc.id;
      return ProductModel.fromJson(data);
    }).where((p) => 
      p.status.toUpperCase() == ProductStatus.active.toUpperCase() && 
      p.listingType.toLowerCase() == 'retail'
    ).toList();
    
    // Sort locally to avoid needing a Firestore composite index immediately
    docs.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));
    return docs;
  });
});

/// A provider that streams all active bulk products for the Dealer Marketplace.
final dealerProductsProvider = StreamProvider<List<ProductModel>>((ref) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.products)
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['product_id'] = doc.id;
      return ProductModel.fromJson(data);
    }).where((p) => 
      p.status.toUpperCase() == ProductStatus.active.toUpperCase() && 
      p.listingType.toLowerCase() == 'bulk'
    ).toList();
    
    docs.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));
    return docs;
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
