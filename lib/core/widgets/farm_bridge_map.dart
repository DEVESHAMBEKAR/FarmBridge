import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../app/theme/app_colors.dart';

class FarmBridgeMap extends StatelessWidget {
  final MapController? mapController;
  final LatLng initialCenter;
  final double initialZoom;
  final List<Marker> markers;
  final List<Polyline> polylines;
  final bool interactive;
  final Function(TapPosition, LatLng)? onTap;
  final Widget? bottomSheet;

  const FarmBridgeMap({
    super.key,
    this.mapController,
    required this.initialCenter,
    this.initialZoom = 13.0,
    this.markers = const [],
    this.polylines = const [],
    this.interactive = true,
    this.onTap,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: initialCenter,
            initialZoom: initialZoom,
            interactionOptions: InteractionOptions(
              flags: interactive ? InteractiveFlag.all : InteractiveFlag.none,
            ),
            onTap: onTap,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.farmbridge.app',
            ),
            if (polylines.isNotEmpty) PolylineLayer(polylines: polylines),
            if (markers.isNotEmpty) MarkerLayer(markers: markers),
          ],
        ),
        if (bottomSheet != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: bottomSheet!,
          ),
      ],
    );
  }
}

class FarmBridgeMapMarker extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const FarmBridgeMapMarker({
    super.key,
    required this.icon,
    this.color = AppColors.primary,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }
}
