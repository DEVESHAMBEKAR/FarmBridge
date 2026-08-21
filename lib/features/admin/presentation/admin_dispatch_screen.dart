import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../core/models/transport_request_model.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/farm_bridge_map.dart';

class AdminDispatchScreen extends ConsumerStatefulWidget {
  const AdminDispatchScreen({super.key});

  @override
  ConsumerState<AdminDispatchScreen> createState() => _AdminDispatchScreenState();
}

class _AdminDispatchScreenState extends ConsumerState<AdminDispatchScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firestoreRepo = ref.watch(firestoreRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispatch Center'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'List View', icon: Icon(Icons.list)),
            Tab(text: 'Map View', icon: Icon(Icons.map)),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestoreRepo.firestore
            .collection(FirestoreCollections.transportRequests)
            .where('status', isEqualTo: 'PENDING')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          final requests = snapshot.hasData ? snapshot.data!.docs.map((doc) {
            final data = doc.data();
            data['request_id'] = doc.id;
            return TransportRequestModel.fromJson(data);
          }).toList() : <TransportRequestModel>[];

          if (requests.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.local_shipping_outlined, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No pending transport requests', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 8),
                  const Text('When farmers mark orders ready for pickup,\nthey will appear here.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          return TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildListView(requests),
              _buildMapView(requests),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListView(List<TransportRequestModel> requests) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final req = requests[index];
        return _buildRequestCard(req);
      },
    );
  }

  Widget _buildMapView(List<TransportRequestModel> requests) {
    // Collect markers for all pickups
    final markers = requests
        .where((r) => r.pickupLatitude != null && r.pickupLongitude != null)
        .map((r) {
      return Marker(
        point: LatLng(r.pickupLatitude!, r.pickupLongitude!),
        width: 40,
        height: 40,
        child: GestureDetector(
          onTap: () {
            // Show bottom sheet with details
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (ctx) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildRequestCard(r),
              ),
            );
          },
          child: const FarmBridgeMapMarker(icon: Icons.store, color: AppColors.primary),
        ),
      );
    }).toList();

    // Default center (India roughly) or first marker
    LatLng center = const LatLng(20.5937, 78.9629);
    if (markers.isNotEmpty) {
      center = markers.first.point;
    }

    return FarmBridgeMap(
      initialCenter: center,
      initialZoom: markers.isNotEmpty ? 10.0 : 4.0,
      markers: markers,
    );
  }

  Widget _buildRequestCard(TransportRequestModel req) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order #${req.orderId?.substring(0, 8).toUpperCase() ?? "N/A"}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(8)),
                  child: const Text('PENDING DISPATCH', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 11)),
                ),
              ],
            ),
            const Divider(height: 20),
            _infoRow(Icons.location_on_outlined, 'Pickup', req.pickupLocation),
            const SizedBox(height: 8),
            _infoRow(Icons.flag_outlined, 'Delivery', req.deliveryLocation),
            const SizedBox(height: 8),
            _infoRow(Icons.scale, 'Weight / Packages', '${req.totalWeight} KG / ${req.packageCount} pkg(s)'),
            const SizedBox(height: 8),
            _infoRow(Icons.local_shipping, 'Vehicle Required', req.requiredVehicleType),
            if (req.refrigerationRequired)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(children: [Icon(Icons.ac_unit, size: 16, color: Colors.blue), SizedBox(width: 4), Text('Refrigeration Required', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500))]),
              ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (Navigator.canPop(context)) Navigator.pop(context); // Close bottom sheet if open
                      context.push('/admin/dispatch/assign-partner/${req.requestId}');
                    },
                    icon: const Icon(Icons.person_pin, size: 18),
                    label: const Text('FarmBridge Partner'),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      if (Navigator.canPop(context)) Navigator.pop(context); // Close bottom sheet if open
                      context.push('/admin/dispatch/third-party/${req.requestId}');
                    },
                    icon: const Icon(Icons.local_taxi, size: 18),
                    label: const Text('Third-Party'),
                    style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary, side: const BorderSide(color: AppColors.primary)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(child: RichText(text: TextSpan(text: '$label: ', style: const TextStyle(color: Colors.grey, fontSize: 13), children: [TextSpan(text: value, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500))]))),
      ],
    );
  }
}
