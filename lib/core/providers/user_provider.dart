import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

/// StreamProvider that listens to the current user's profile document in Firestore.
/// It depends on the [authStateProvider] to know the current UID.
final userProfileStreamProvider = StreamProvider<UserModel?>((ref) {
  final authUser = ref.watch(authStateProvider).value;
  if (authUser == null) {
    return Stream.value(null);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getDocumentStream(
        collection: FirestoreCollections.users,
        documentId: authUser.uid,
      )
      .map((snapshot) {
    if (snapshot.exists && snapshot.data() != null) {
      return UserModel.fromJson(snapshot.data()!);
    }
    return null;
  });
});

/// A Provider that exposes the current [UserModel] synchronously,
/// updating whenever the [userProfileStreamProvider] emits a new value.
/// If the stream is loading or has an error, it returns null.
final currentUserProvider = Provider<UserModel?>((ref) {
  final asyncValue = ref.watch(userProfileStreamProvider);
  return asyncValue.value;
});

/// A Provider that exposes the current user's role synchronously.
final currentUserRoleProvider = Provider<String?>((ref) {
  return ref.watch(currentUserProvider)?.role;
});
