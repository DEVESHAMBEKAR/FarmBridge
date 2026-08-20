import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/constants/firestore_collections.dart';

// Stream of all users in the system
final adminAllUsersProvider = StreamProvider<List<UserModel>>((ref) {
  final firestore = ref.watch(firestoreRepositoryProvider);
  return firestore.getCollectionStream(collection: FirestoreCollections.users).map(
        (snapshot) => snapshot.docs.map((doc) {
          final data = doc.data();
          data['uid'] = doc.id;
          return UserModel.fromJson(data);
        }).toList(),
      );
});

// Stream of all products in the system
final adminAllProductsProvider = StreamProvider<List<ProductModel>>((ref) {
  final firestore = ref.watch(firestoreRepositoryProvider);
  return firestore.getCollectionStream(collection: FirestoreCollections.products).map(
        (snapshot) => snapshot.docs.map((doc) {
          final data = doc.data();
          data['product_id'] = doc.id;
          return ProductModel.fromJson(data);
        }).toList(),
      );
});

// Stream of all orders in the system
final adminAllOrdersProvider = StreamProvider<List<OrderModel>>((ref) {
  final firestore = ref.watch(firestoreRepositoryProvider);
  return firestore.getCollectionStream(collection: FirestoreCollections.orders).map(
        (snapshot) => snapshot.docs.map((doc) {
          final data = doc.data();
          data['order_id'] = doc.id;
          return OrderModel.fromJson(data);
        }).toList(),
      );
});

// Derived Providers for filtering specific roles
final adminFarmersListProvider = Provider<AsyncValue<List<UserModel>>>((ref) {
  final usersAsync = ref.watch(adminAllUsersProvider);
  return usersAsync.whenData((users) => users.where((u) => u.role == UserRoles.farmer).toList());
});

final adminBuyersListProvider = Provider<AsyncValue<List<UserModel>>>((ref) {
  final usersAsync = ref.watch(adminAllUsersProvider);
  return usersAsync.whenData((users) => users.where((u) => u.role == UserRoles.buyer).toList());
});

final adminRegularUsersListProvider = Provider<AsyncValue<List<UserModel>>>((ref) {
  final usersAsync = ref.watch(adminAllUsersProvider);
  return usersAsync.whenData((users) => users.where((u) => u.role != UserRoles.farmer && u.role != UserRoles.logistics).toList());
});

final adminLogisticsListProvider = Provider<AsyncValue<List<UserModel>>>((ref) {
  final usersAsync = ref.watch(adminAllUsersProvider);
  return usersAsync.whenData((users) => users.where((u) => u.role == UserRoles.logistics).toList());
});

// Stream of Audit Logs
final adminAuditLogsProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final firestore = ref.watch(firestoreRepositoryProvider);
  return firestore.getCollectionStream(collection: FirestoreCollections.auditLogs).map(
        (snapshot) => snapshot.docs.map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>}).toList(),
      );
});
