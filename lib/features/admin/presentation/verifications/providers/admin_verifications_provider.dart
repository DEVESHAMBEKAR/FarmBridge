import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/providers/providers.dart';

final adminVerificationsListProvider = StreamProvider.autoDispose<List<UserModel>>((ref) {
  final firestore = ref.watch(firestoreRepositoryProvider).firestore;
  
  return firestore
      .collection(FirestoreCollections.users)
      .where('verification_status', whereIn: ['UNDER_REVIEW', 'REQUIRES_CORRECTION', 'APPROVED'])
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return UserModel.fromJson(data);
        }).toList();
      });
});
