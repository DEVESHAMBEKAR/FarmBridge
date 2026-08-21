import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../app/theme/app_colors.dart';

class LiveOrderTrackingScreen extends StatelessWidget {
  const LiveOrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Tracking'), backgroundColor: AppColors.surface),
      body: FlutterMap(
        options: const MapOptions(initialCenter: LatLng(18.5204, 73.8567), initialZoom: 13.0),
        children: [
          TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.farmbridge.app'),
          const MarkerLayer(
            markers: [
              Marker(point: LatLng(18.5204, 73.8567), child: Icon(Icons.local_shipping, color: AppColors.primary, size: 40)),
            ],
          ),
        ],
      ),
    );
  }
}
