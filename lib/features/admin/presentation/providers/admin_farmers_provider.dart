import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/constants/firestore_collections.dart';

final pendingFarmersProvider = StreamProvider.autoDispose<List<UserModel>>((ref) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);

  return firestoreRepo.firestore
      .collection(FirestoreCollections.users)
      .where('role', isEqualTo: 'farmer')
      .where('is_profile_complete', isEqualTo: true)
      .where('is_verified', isEqualTo: false)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      // Ensure the ID is set correctly if it's not in the data map
      if (!data.containsKey('uid')) {
        data['uid'] = doc.id;
      }
      return UserModel.fromJson(data);
    }).toList();
  });
});

final farmerVerificationProvider = FutureProvider.family<bool, String>((ref, userId) async {
  final firestoreRepo = ref.read(firestoreRepositoryProvider);
  try {
    await firestoreRepo.updateDocument(
      collection: FirestoreCollections.users,
      documentId: userId,
      data: {'is_verified': true},
    );
    return true;
  } catch (e) {
    return false;
  }
});
