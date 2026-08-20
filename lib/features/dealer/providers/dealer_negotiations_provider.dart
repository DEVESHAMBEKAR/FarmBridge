import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/negotiation_model.dart';

final dealerNegotiationsProvider = StreamProvider.family<List<NegotiationModel>, String>((ref, dealerId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.negotiations)
      .where('buyer_id', isEqualTo: dealerId)
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['negotiation_id'] = doc.id;
      return NegotiationModel.fromJson(data);
    }).toList();
    docs.sort((a, b) => (b.updatedAt ?? DateTime.now()).compareTo(a.updatedAt ?? DateTime.now()));
    return docs;
  });
});
