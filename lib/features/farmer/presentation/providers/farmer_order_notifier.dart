import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/repositories/firestore_repository.dart';

class FarmerOrderState {
  final bool isLoading;
  final String? error;
  const FarmerOrderState({this.isLoading = false, this.error});
}

class FarmerOrderNotifier extends StateNotifier<FarmerOrderState> {
  final Ref ref;
  FarmerOrderNotifier(this.ref) : super(const FarmerOrderState());

  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    state = const FarmerOrderState(isLoading: true);
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      await firestoreRepo.setDocument(
        collection: FirestoreCollections.orders,
        documentId: orderId,
        data: {
          'status': newStatus,
          'updated_at': FieldValue.serverTimestamp(),
        },
        merge: true,
      );
      state = const FarmerOrderState(isLoading: false);
    } catch (e) {
      state = FarmerOrderState(isLoading: false, error: e.toString());
    }
  }

  Future<void> markReadyForPickup({
    required String orderId,
    required String farmerId,
    required String buyerId,
    required String pickupLocation,
    required String deliveryLocation,
    required String productType,
    required double totalWeight,
    required int packageCount,
    String? packageDimensions,
    bool refrigerationRequired = false,
    String? specialInstructions,
  }) async {
    state = const FarmerOrderState(isLoading: true);
    try {
      // 1. Get real geo locations
      double? pickupLat, pickupLng, deliveryLat, deliveryLng;
      
      try {
        // Request location permission for pickup coordinates
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }
        
        if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
          final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          pickupLat = position.latitude;
          pickupLng = position.longitude;
        }
      } catch (e) {
        print('Error getting pickup GPS: $e');
      }

      try {
        // Attempt to geocode delivery address
        final locations = await Geocoding().locationFromAddress(deliveryLocation);
        if (locations.isNotEmpty) {
          deliveryLat = locations.first.latitude;
          deliveryLng = locations.first.longitude;
        }
      } catch (e) {
        print('Error geocoding delivery location: $e');
      }

      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final requestId = firestoreRepo.generateDocId(FirestoreCollections.transportRequests);

      // Determine vehicle type from weight
      String vehicleType;
      if (totalWeight <= 50) vehicleType = 'BIKE_CARGO';
      else if (totalWeight <= 200) vehicleType = 'AUTO_CARGO';
      else if (totalWeight <= 500) vehicleType = 'THREE_WHEELER';
      else if (totalWeight <= 1500) vehicleType = 'TATA_ACE';
      else if (totalWeight <= 5000) vehicleType = 'MINI_TRUCK';
      else vehicleType = 'MEDIUM_TRUCK';

      final batch = <BatchOperation>[];

      batch.add(BatchOperation.update(
        collection: FirestoreCollections.orders,
        documentId: orderId,
        data: {
          'status': 'ready_for_pickup',
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));

      batch.add(BatchOperation.set(
        collection: FirestoreCollections.transportRequests,
        documentId: requestId,
        data: {
          'request_id': requestId,
          'order_id': orderId,
          'farmer_id': farmerId,
          'buyer_id': buyerId,
          'pickup_location': pickupLocation,
          'pickup_latitude': pickupLat,
          'pickup_longitude': pickupLng,
          'delivery_location': deliveryLocation,
          'delivery_latitude': deliveryLat,
          'delivery_longitude': deliveryLng,
          'product_type': productType,
          'total_weight': totalWeight,
          'package_count': packageCount,
          'package_dimensions': packageDimensions,
          'required_vehicle_type': vehicleType,
          'refrigeration_required': refrigerationRequired,
          'special_instructions': specialInstructions,
          'pickup_ready_at': FieldValue.serverTimestamp(),
          'status': 'PENDING',
          'created_at': FieldValue.serverTimestamp(),
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));

      await firestoreRepo.batchWrite(batch);
      state = const FarmerOrderState(isLoading: false);
    } catch (e) {
      state = FarmerOrderState(isLoading: false, error: e.toString());
    }
  }
}

final farmerOrderNotifierProvider = StateNotifierProvider<FarmerOrderNotifier, FarmerOrderState>((ref) {
  return FarmerOrderNotifier(ref);
});

