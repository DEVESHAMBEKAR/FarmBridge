import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';
import 'user_provider.dart';

// ─── Orders Stream ──────────────────────────────────────────

/// A provider that streams all orders for the currently authenticated buyer.
final buyerOrdersProvider = StreamProvider<List<OrderModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value([]);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.orders,
        field: FirestoreFields.buyerId,
        value: authUser.uid,
        orderByField: FirestoreFields.placedAt,
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
  });
});

/// A provider that streams all orders for the currently authenticated farmer.
final farmerOrdersProvider = StreamProvider<List<OrderModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value([]);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.orders,
        field: FirestoreFields.farmerId,
        value: authUser.uid,
        orderByField: FirestoreFields.placedAt,
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
  });
});

/// A provider that streams all orders assigned to the currently authenticated logistics partner.
final deliveryOrdersProvider = StreamProvider<List<OrderModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value([]);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.orders,
        field: FirestoreFields.deliveryPartnerId,
        value: authUser.uid,
        orderByField: FirestoreFields.placedAt,
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
  });
});

/// A provider that streams a single order by ID.
final orderStreamProvider = StreamProvider.family<OrderModel?, String>((ref, orderId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getDocumentStream(
        collection: FirestoreCollections.orders,
        documentId: orderId,
      )
      .map((snapshot) {
    if (snapshot.exists && snapshot.data() != null) {
      return OrderModel.fromJson(snapshot.data()!);
    }
    return null;
  });
});

/// A provider that streams the items for a specific order ID.
final orderItemsProvider = StreamProvider.family<List<OrderItemModel>, String>((ref, orderId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getSubCollectionStream(
        parentCollection: FirestoreCollections.orders,
        parentDocId: orderId,
        subCollection: FirestoreCollections.orderItems,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => OrderItemModel.fromJson(doc.data())).toList();
  });
});

/// A provider that streams all 'shipped' orders that have no delivery partner yet.
final availableOrdersProvider = StreamProvider<List<OrderModel>>((ref) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.orders,
        field: 'status',
        value: 'shipped',
        orderByField: FirestoreFields.placedAt,
        descending: true,
      )
      .map((snapshot) {
    // Filter out orders that already have a delivery partner assigned
    return snapshot.docs
        .map((doc) => OrderModel.fromJson(doc.data()))
        .where((order) => order.deliveryPartnerId == null || order.deliveryPartnerId!.isEmpty)
        .toList();
  });
});
