import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/notification_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';
import 'user_provider.dart';

// --- Notifications Stream ---

/// Streams all notifications for the authenticated user.
final userNotificationsProvider = StreamProvider<List<NotificationModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) return Stream.value([]);

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.notifications,
        field: FirestoreFields.userId,
        value: authUser.uid,
      )
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) => NotificationModel.fromJson(doc.data())).toList();
    docs.sort((a, b) => (b.createdAt ?? DateTime(0)).compareTo(a.createdAt ?? DateTime(0)));
    return docs;
  });
});

/// Streams the count of unread notifications for the user.
final unreadNotificationsCountProvider = StreamProvider<int>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) return Stream.value(0);

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.notifications,
        field: FirestoreFields.userId,
        value: authUser.uid,
      )
      .map((snapshot) {
    return snapshot.docs
        .where((doc) => doc.data()[FirestoreFields.isRead] == false)
        .length;
  });
});
