import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/transport_request_model.dart';

final pendingLogisticsJobsProvider = StreamProvider<List<TransportRequestModel>>((ref) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.transportRequests)
      .where('status', isEqualTo: 'PENDING')
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['request_id'] = doc.id;
      return TransportRequestModel.fromJson(data);
    }).toList();
    docs.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));
    return docs;
  });
});

final activeLogisticsJobsProvider = StreamProvider.family<List<TransportRequestModel>, String>((ref, driverId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.transportRequests)
      .where('transporter_id', isEqualTo: driverId)
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['request_id'] = doc.id;
      return TransportRequestModel.fromJson(data);
    }).toList();
    docs.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));
    return docs;
  });
});
