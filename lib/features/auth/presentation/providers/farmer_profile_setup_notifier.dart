import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/constants/firestore_collections.dart';

class FarmerProfileSetupState {
  final bool isLoading;
  final String? error;

  const FarmerProfileSetupState({this.isLoading = false, this.error});
}

class FarmerProfileSetupNotifier extends StateNotifier<FarmerProfileSetupState> {
  final Ref ref;

  FarmerProfileSetupNotifier(this.ref) : super(const FarmerProfileSetupState());

  Future<bool> saveProfile(FarmerProfile profile) async {
    state = const FarmerProfileSetupState(isLoading: true);
    
    try {
      final user = ref.read(currentUserProvider);
      if (user == null) {
        throw Exception('User not found');
      }

      final firestoreRepo = ref.read(firestoreRepositoryProvider);

      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.users,
        documentId: user.uid,
        data: {
          'is_profile_complete': true,
          'display_name': profile.farmName,
          'farmer_profile': profile.toJson(),
        },
      );

      // Invalidate the user profile stream to trigger a UI update globally
      ref.invalidate(userProfileStreamProvider);

      state = const FarmerProfileSetupState(isLoading: false);
      return true;
    } catch (e) {
      state = FarmerProfileSetupState(isLoading: false, error: e.toString());
      return false;
    }
  }
}

final farmerProfileSetupNotifierProvider = StateNotifierProvider<FarmerProfileSetupNotifier, FarmerProfileSetupState>((ref) {
  return FarmerProfileSetupNotifier(ref);
});
