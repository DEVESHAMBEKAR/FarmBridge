import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/constants/firestore_collections.dart';

class BuyerProfileSetupState {
  final bool isLoading;
  final String? error;

  const BuyerProfileSetupState({this.isLoading = false, this.error});
}

class BuyerProfileSetupNotifier extends StateNotifier<BuyerProfileSetupState> {
  final Ref ref;

  BuyerProfileSetupNotifier(this.ref) : super(const BuyerProfileSetupState());

  Future<bool> saveProfile(BuyerProfile profile, String displayName) async {
    state = const BuyerProfileSetupState(isLoading: true);
    
    try {
      final user = ref.read(authRepositoryProvider).currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final firestoreRepo = ref.read(firestoreRepositoryProvider);

      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.users,
        documentId: user.uid,
        data: {
          'is_profile_complete': true,
          'display_name': displayName,
          'buyer_profile': profile.toJson(),
        },
      );

      ref.invalidate(userProfileStreamProvider);

      state = const BuyerProfileSetupState(isLoading: false);
      return true;
    } catch (e) {
      state = BuyerProfileSetupState(isLoading: false, error: e.toString());
      return false;
    }
  }
}

final buyerProfileSetupNotifierProvider = StateNotifierProvider<BuyerProfileSetupNotifier, BuyerProfileSetupState>((ref) {
  return BuyerProfileSetupNotifier(ref);
});
