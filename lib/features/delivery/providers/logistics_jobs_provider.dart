import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/logistics_job_model.dart';

final pendingLogisticsJobsProvider = StreamProvider<List<LogisticsJobModel>>((ref) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.logisticsRequests)
      .where('status', isEqualTo: 'PENDING')
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['job_id'] = doc.id;
      return LogisticsJobModel.fromJson(data);
    }).toList();
    docs.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));
    return docs;
  });
});

final activeLogisticsJobsProvider = StreamProvider.family<List<LogisticsJobModel>, String>((ref, driverId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo.firestore
      .collection(FirestoreCollections.logisticsRequests)
      .where('transporter_id', isEqualTo: driverId)
      .snapshots()
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) {
      final data = doc.data();
      data['job_id'] = doc.id;
      return LogisticsJobModel.fromJson(data);
    }).toList();
    docs.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));
    return docs;
  });
});
