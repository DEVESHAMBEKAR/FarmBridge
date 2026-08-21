import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class SupplyChainLogisticsScreen extends StatelessWidget {
  const SupplyChainLogisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supply Chain Overview'),
        backgroundColor: AppColors.surface,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2, size: 80, color: AppColors.primary.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('Global Supply Chain View', style: AppTypography.headlineSmall),
            const SizedBox(height: 8),
            const Text('Map and metrics will be displayed here.'),
          ],
        ),
      ),
    );
  }
}
