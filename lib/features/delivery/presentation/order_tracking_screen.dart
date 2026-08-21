import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/trip_model.dart';
import '../../../core/repositories/firestore_repository.dart';
import '../../../core/widgets/farm_bridge_map.dart';
import '../../../app/theme/app_colors.dart';

class OrderTrackingScreen extends ConsumerWidget {
  final String orderId;
  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestore = ref.watch(firestoreRepositoryProvider).firestore;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Tracking'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestore
            .collection(FirestoreCollections.trips)
            .where('order_id', isEqualTo: orderId)
            .where('status', isEqualTo: 'active')
            .limit(1)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('Live tracking is currently not available for this order.'),
              ),
            );
          }

          final tripData = snapshot.data!.docs.first.data();
          if (!tripData.containsKey('trip_id')) {
            tripData['trip_id'] = snapshot.data!.docs.first.id;
          }
          final trip = TripModel.fromJson(tripData);

          LatLng currentLoc = LatLng(trip.currentLatitude, trip.currentLongitude);
          
          final markers = <Marker>[
            Marker(
              point: currentLoc,
              width: 40,
              height: 40,
              child: const FarmBridgeMapMarker(icon: Icons.local_shipping, color: Colors.blue),
            ),
          ];

          if (trip.destinationLatitude != null && trip.destinationLongitude != null) {
            markers.add(
              Marker(
                point: LatLng(trip.destinationLatitude!, trip.destinationLongitude!),
                width: 40,
                height: 40,
                child: const FarmBridgeMapMarker(icon: Icons.flag, color: Colors.red),
              )
            );
          }

          return Stack(
            children: [
              FarmBridgeMap(
                initialCenter: currentLoc,
                initialZoom: 14.0,
                markers: markers,
                onMapReady: (controller) {},
              ),
              Positioned(
                bottom: 32,
                left: 16,
                right: 16,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Driver is on the way', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 8),
                        Text('Driver: ${trip.driverName}', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 4),
                        Text('Phone: ${trip.driverPhone}', style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.call),
                              label: const Text('Call Driver'),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
