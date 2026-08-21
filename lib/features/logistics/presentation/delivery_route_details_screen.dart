import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class DeliveryRouteDetailsScreen extends StatelessWidget {
  const DeliveryRouteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Details'),
        backgroundColor: AppColors.surface,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStep('Pickup', 'Green Valley Farms, Pune', '10:00 AM', isCompleted: true),
          _buildStep('Checkpoint 1', 'Lonavala Toll Plaza', '11:30 AM', isCompleted: true),
          _buildStep('Dropoff', 'APMC Market, Vashi', 'Expected 2:00 PM', isCompleted: false, isLast: true),
        ],
      ),
    );
  }

  Widget _buildStep(String title, String subtitle, String time, {bool isCompleted = false, bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: isCompleted ? AppColors.primary : Colors.grey.shade300,
              child: isCompleted ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 50,
                color: isCompleted ? AppColors.primary : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.bold)),
              Text(subtitle, style: AppTypography.bodyMedium),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Text(time, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
      ],
    );
  }
}
