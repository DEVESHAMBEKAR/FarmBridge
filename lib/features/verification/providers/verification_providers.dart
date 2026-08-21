import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/verification_document_model.dart';
import '../../../core/providers/providers.dart';

final verificationDocumentsProvider = StreamProvider.autoDispose.family<List<VerificationDocumentModel>, String>((ref, userId) {
  final firestore = ref.watch(firestoreRepositoryProvider).firestore;
  return firestore
      .collection(FirestoreCollections.verificationDocuments)
      .where('user_id', isEqualTo: userId)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            if (!data.containsKey('document_id')) data['document_id'] = doc.id;
            return VerificationDocumentModel.fromJson(data);
          }).toList());
});

final userVerificationStatusProvider = StreamProvider.autoDispose<String>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return Stream.value('PENDING');

  final firestore = ref.watch(firestoreRepositoryProvider).firestore;
  return firestore
      .collection(FirestoreCollections.users)
      .doc(user.uid)
      .snapshots()
      .map((doc) {
        if (!doc.exists) return 'PENDING';
        return doc.data()?['verification_status'] as String? ?? 'PENDING';
      });
});
