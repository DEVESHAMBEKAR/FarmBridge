import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/constants/firestore_collections.dart';

class LogisticsProfileSetupState {
  final bool isLoading;
  final String? error;

  const LogisticsProfileSetupState({this.isLoading = false, this.error});
}

class LogisticsProfileSetupNotifier extends StateNotifier<LogisticsProfileSetupState> {
  final Ref ref;

  LogisticsProfileSetupNotifier(this.ref) : super(const LogisticsProfileSetupState());

  Future<bool> saveProfile(LogisticsProfile profile, String displayName) async {
    state = const LogisticsProfileSetupState(isLoading: true);
    
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
          'display_name': displayName,
          'logistics_profile': profile.toJson(),
        },
      );

      ref.invalidate(userProfileStreamProvider);

      state = const LogisticsProfileSetupState(isLoading: false);
      return true;
    } catch (e) {
      state = LogisticsProfileSetupState(isLoading: false, error: e.toString());
      return false;
    }
  }
}

final logisticsProfileSetupNotifierProvider = StateNotifierProvider<LogisticsProfileSetupNotifier, LogisticsProfileSetupState>((ref) {
  return LogisticsProfileSetupNotifier(ref);
});
