import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/repositories/trip_repository.dart';
import '../../../core/models/trip_model.dart';

final activeTripIdProvider = StateProvider<String?>((ref) => null);

final activeTripStreamProvider = StreamProvider<TripModel?>((ref) {
  final tripId = ref.watch(activeTripIdProvider);
  if (tripId == null) return Stream.value(null);
  
  final tripRepo = ref.watch(tripRepositoryProvider);
  return tripRepo.watchTrip(tripId);
});

final liveLocationProvider = StateNotifierProvider<LiveLocationNotifier, Position?>((ref) {
  return LiveLocationNotifier(ref);
});

class LiveLocationNotifier extends StateNotifier<Position?> {
  final Ref _ref;
  StreamSubscription<Position>? _positionStream;

  LiveLocationNotifier(this._ref) : super(null);

  void startTracking() {
    _positionStream?.cancel();
    
    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Update every 10 meters
      )
    ).listen((Position position) {
      state = position;
      
      final activeTripId = _ref.read(activeTripIdProvider);
      if (activeTripId != null) {
        _ref.read(tripRepositoryProvider).updateLiveLocation(
          activeTripId,
          position.latitude,
          position.longitude,
          position.heading,
        );
      }
    });
  }

  void stopTracking() {
    _positionStream?.cancel();
    _positionStream = null;
  }
  
  @override
  void dispose() {
    stopTracking();
    super.dispose();
  }
}
