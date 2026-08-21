import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trip_model.dart';
import '../constants/firestore_collections.dart';
import 'firestore_repository.dart';
import '../providers/providers.dart';

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final firestore = ref.watch(firestoreRepositoryProvider).firestore;
  return TripRepository(firestore);
});

class TripRepository {
  final FirebaseFirestore _firestore;

  TripRepository(this._firestore);

  CollectionReference get _tripsCollection =>
      _firestore.collection(FirestoreCollections.trips);

  Stream<TripModel?> watchTrip(String tripId) {
    return _tripsCollection.doc(tripId).snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return TripModel.fromJson(snapshot.data() as Map<String, dynamic>);
      }
      return null;
    });
  }

  Future<void> updateLiveLocation(String tripId, double latitude, double longitude, double? heading) async {
    await _tripsCollection.doc(tripId).set({
      'current_latitude': latitude,
      'current_longitude': longitude,
      if (heading != null) 'heading': heading,
      'updated_at': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> updateTripStatus(String tripId, String status) async {
    await _tripsCollection.doc(tripId).update({
      'status': status,
      'updated_at': FieldValue.serverTimestamp(),
      if (status == 'PICKED_UP') 'picked_up_at': FieldValue.serverTimestamp(),
      if (status == 'DELIVERED') 'delivered_at': FieldValue.serverTimestamp(),
    });
  }

  Future<void> startTrip(TripModel trip) async {
    await _tripsCollection.doc(trip.tripId).set(trip.toJson());
  }
}
