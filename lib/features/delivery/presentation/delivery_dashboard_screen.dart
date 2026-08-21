import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../../core/providers/providers.dart';
import '../providers/logistics_jobs_provider.dart';
import '../providers/live_location_provider.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/repositories/firestore_repository.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/models/transport_request_model.dart';
import '../../../../core/widgets/farm_bridge_map.dart';

class DeliveryDashboardScreen extends ConsumerStatefulWidget {
  const DeliveryDashboardScreen({super.key});

  @override
  ConsumerState<DeliveryDashboardScreen> createState() => _DeliveryDashboardScreenState();
}

class _DeliveryDashboardScreenState extends ConsumerState<DeliveryDashboardScreen> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    // Start live tracking automatically when dashboard opens if permitted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(liveLocationProvider.notifier).startTracking();
    });
  }

  Future<bool> _verifyLocation(double? targetLat, double? targetLng) async {
    if (targetLat == null || targetLng == null) return true;
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permission required.')));
          return false;
        }
      }
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final distance = Geolocator.distanceBetween(position.latitude, position.longitude, targetLat, targetLng);
      if (distance > 500) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Too far from destination (${(distance/1000).toStringAsFixed(1)} km away).'),
            backgroundColor: Colors.red,
          ));
        }
        return false;
      }
      return true;
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not verify location: $e')));
      return false;
    }
  }

  Future<void> _updateJobStatus(TransportRequestModel job, String newStatus) async {
    if (newStatus == 'PICKED_UP' && !await _verifyLocation(job.pickupLatitude, job.pickupLongitude)) return;
    if (newStatus == 'DELIVERED' && !await _verifyLocation(job.deliveryLatitude, job.deliveryLongitude)) return;

    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final batch = <BatchOperation>[];
      
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.transportRequests,
        documentId: job.requestId,
        data: {'status': newStatus, 'updated_at': FieldValue.serverTimestamp()},
      ));

      if (job.dealId != null) {
        batch.add(BatchOperation.update(
          collection: FirestoreCollections.deals,
          documentId: job.dealId!,
          data: {'transport_status': newStatus, 'updated_at': FieldValue.serverTimestamp()}
        ));
      }
      await firestoreRepo.batchWrite(batch);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status updated to: $newStatus')));
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    if (user == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final activeJobsAsync = ref.watch(activeLogisticsJobsProvider(user.uid));
    final liveLoc = ref.watch(liveLocationProvider);
    
    // Default map center
    LatLng center = const LatLng(20.5937, 78.9629);
    if (liveLoc != null) {
      center = LatLng(liveLoc.latitude, liveLoc.longitude);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Dashboard'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Map Background
          AsyncValueWidget(
            value: activeJobsAsync,
            data: (jobs) {
              final markers = <Marker>[];
              
              // Live location marker
              if (liveLoc != null) {
                markers.add(Marker(
                  point: LatLng(liveLoc.latitude, liveLoc.longitude),
                  width: 40, height: 40,
                  child: const FarmBridgeMapMarker(icon: Icons.local_shipping, color: Colors.blue),
                ));
              }

              // Active jobs markers
              for (var job in jobs) {
                if (job.pickupLatitude != null && job.pickupLongitude != null && (job.status == 'DISPATCHED' || job.status == 'ACCEPTED')) {
                  markers.add(Marker(
                    point: LatLng(job.pickupLatitude!, job.pickupLongitude!),
                    width: 40, height: 40,
                    child: const FarmBridgeMapMarker(icon: Icons.store, color: Colors.green),
                  ));
                }
                if (job.deliveryLatitude != null && job.deliveryLongitude != null && job.status == 'IN_TRANSIT') {
                  markers.add(Marker(
                    point: LatLng(job.deliveryLatitude!, job.deliveryLongitude!),
                    width: 40, height: 40,
                    child: const FarmBridgeMapMarker(icon: Icons.flag, color: Colors.red),
                  ));
                }
              }

              return FarmBridgeMap(
                initialCenter: center,
                initialZoom: 13.0,
                markers: markers,
                onMapReady: (controller) {
                  // Keep reference if needed
                },
              );
            },
          ),
          
          // Draggable Bottom Sheet for Jobs
          DraggableScrollableSheet(
            initialChildSize: 0.35,
            minChildSize: 0.1,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 0)],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(width: 40, height: 5, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2.5))),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          const Text('Active Deliveries', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          AsyncValueWidget(
                            value: activeJobsAsync,
                            data: (jobs) {
                              if (jobs.isEmpty) return const Padding(padding: EdgeInsets.all(16.0), child: Text('No active deliveries.'));
                              return Column(
                                children: jobs.map((job) => _buildActiveJobCard(job)).toList(),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          const Text('Retail Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Consumer(
                            builder: (context, ref, child) {
                              final activeOrdersAsync = ref.watch(deliveryOrdersProvider);
                              return AsyncValueWidget(
                                value: activeOrdersAsync,
                                data: (orders) {
                                  if (orders.isEmpty) return const Padding(padding: EdgeInsets.all(16.0), child: Text('No retail orders.'));
                                  return Column(
                                    children: orders.map((o) => _buildRetailOrderCard(o)).toList(),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          const Text('Available Loads', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Consumer(
                            builder: (context, ref, child) {
                              final pendingJobsAsync = ref.watch(pendingLogisticsJobsProvider);
                              return AsyncValueWidget(
                                value: pendingJobsAsync,
                                data: (jobs) {
                                  if (jobs.isEmpty) return const Padding(padding: EdgeInsets.all(16.0), child: Text('No available loads.'));
                                  return Column(
                                    children: jobs.map((job) => _buildAvailableJobCard(job)).toList(),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future<void> _acceptJob(TransportRequestModel job, String driverId) async {
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final batch = <BatchOperation>[];
      
      batch.add(BatchOperation.update(
        collection: FirestoreCollections.transportRequests,
        documentId: job.requestId,
        data: {
          'status': 'ACCEPTED',
          'transporter_id': driverId,
          'updated_at': FieldValue.serverTimestamp(),
        },
      ));

      if (job.dealId != null) {
        batch.add(BatchOperation.update(
          collection: FirestoreCollections.deals,
          documentId: job.dealId!,
          data: {
            'transport_status': 'ACCEPTED',
            'updated_at': FieldValue.serverTimestamp(),
          }
        ));
      }

      await firestoreRepo.batchWrite(batch);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Load Accepted Successfully!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Widget _buildAvailableJobCard(TransportRequestModel job) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${job.totalWeight} kg • ${job.productType}', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(job.requiredVehicleType, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.green),
                const SizedBox(width: 8),
                Expanded(child: Text(job.pickupLocation)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.red),
                const SizedBox(width: 8),
                Expanded(child: Text(job.deliveryLocation)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final user = ref.read(currentUserProvider);
                  if (user != null) {
                    _acceptJob(job, user.uid);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                child: const Text('Accept Load'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRetailOrderCard(OrderModel order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.blue.withOpacity(0.3))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order #${order.orderId.substring(0,6).toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(12)),
                  child: Text(order.status.toUpperCase(), style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                )
              ],
            ),
            const Divider(height: 24),
            Text('Buyer: ${order.buyerName}', style: const TextStyle(fontWeight: FontWeight.w500)),
            Text('Delivery: ${order.deliveryAddress} - ${order.deliveryPincode}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            if (order.status != 'delivered') ...[
              Wrap(
                spacing: 8, runSpacing: 8,
                children: [
                  if (order.status == 'confirmed')
                    ElevatedButton(onPressed: () => _updateOrderStatus(order, 'packed'), child: const Text('Mark Packed')),
                  if (order.status == 'packed')
                    ElevatedButton(onPressed: () => _updateOrderStatus(order, 'in_transit'), child: const Text('Start Transit')),
                  if (order.status == 'in_transit')
                    ElevatedButton(onPressed: () => _updateOrderStatus(order, 'delivered'), style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white), child: const Text('Mark Delivered')),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }

  Future<void> _updateOrderStatus(OrderModel order, String newStatus) async {
    if (newStatus == 'delivered' && !await _verifyLocation(order.deliveryLatitude, order.deliveryLongitude)) return;

    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.orders,
        documentId: order.orderId,
        data: {'status': newStatus, 'updated_at': FieldValue.serverTimestamp()},
      );
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order Status Updated!')));
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Widget _buildActiveJobCard(TransportRequestModel job) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order #${job.orderId?.substring(0, 8).toUpperCase() ?? "N/A"}', style: const TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: Text(job.status, style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(children: [const Icon(Icons.location_on, size: 16, color: Colors.green), const SizedBox(width: 8), Expanded(child: Text(job.pickupLocation))]),
            const SizedBox(height: 8),
            Row(children: [const Icon(Icons.flag, size: 16, color: Colors.red), const SizedBox(width: 8), Expanded(child: Text(job.deliveryLocation))]),
            const SizedBox(height: 16),
            if (job.status != 'DELIVERED') ...[
              Wrap(
                spacing: 8, runSpacing: 8,
                children: [
                  if (job.status == 'DISPATCHED' || job.status == 'ACCEPTED')
                    ElevatedButton(
                      onPressed: () => _updateJobStatus(job, 'PICKED_UP'),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                      child: const Text('Mark Picked Up'),
                    ),
                  if (job.status == 'PICKED_UP')
                    ElevatedButton(
                      onPressed: () => _updateJobStatus(job, 'IN_TRANSIT'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                      child: const Text('Start Transit'),
                    ),
                  if (job.status == 'IN_TRANSIT')
                    ElevatedButton(
                      onPressed: () => _updateJobStatus(job, 'DELIVERED'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                      child: const Text('Mark Delivered'),
                    ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
