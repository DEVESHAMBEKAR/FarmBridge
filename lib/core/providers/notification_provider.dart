import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/notification_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';
import 'user_provider.dart';

// ─── Notifications Stream ───────────────────────────────────────

/// A provider that streams all notifications for the currently authenticated user.
final userNotificationsProvider = StreamProvider<List<NotificationModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value([]);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.notifications,
        field: FirestoreFields.userId,
        value: authUser.uid,
        orderByField: FirestoreFields.createdAt,
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => NotificationModel.fromJson(doc.data())).toList();
  });
});

/// A provider that streams only the unread notifications count for the user.
final unreadNotificationsCountProvider = StreamProvider<int>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value(0);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  // We can filter by both userId and isRead==false if we add a composite index, 
  // or we can just filter the stream locally if the volume is manageable. 
  // Assuming a composite index exists (userId ASC, is_read ASC).
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.notifications,
        field: FirestoreFields.userId,
        value: authUser.uid,
      )
      .map((snapshot) {
    // Local filtering for unread
    return snapshot.docs
        .where((doc) => doc.data()[FirestoreFields.isRead] == false)
        .length;
  });
});
