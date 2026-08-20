import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/requirement_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final dealerRequirementsProvider = StreamProvider<List<RequirementModel>>((ref) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.requirements)
      .where(FirestoreFields.status, isEqualTo: UserStatus.active)
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['requirement_id'] = doc.id;
      return RequirementModel.fromJson(data);
    }).toList();
    docs.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));
    return docs;
  });
});

final userRequirementsProvider = StreamProvider.family<List<RequirementModel>, String>((ref, userId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.requirements)
      .where('dealer_id', isEqualTo: userId)
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['requirement_id'] = doc.id;
      return RequirementModel.fromJson(data);
    }).toList();
    docs.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));
    return docs;
  });
});
