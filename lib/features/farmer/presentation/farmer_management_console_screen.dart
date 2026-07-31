import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class FarmerManagementConsoleScreen extends StatelessWidget {
  const FarmerManagementConsoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Text('Farmer Directory', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: AppColors.onSurfaceVariant), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list, color: AppColors.onSurfaceVariant), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatCards(),
            const SizedBox(height: 24),
            _buildFarmerList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCards() {
    return Row(
      children: [
        Expanded(child: _buildStatCard('Active Farmers', '2,458', Icons.group, AppColors.primary)),
        const SizedBox(width: 16),
        Expanded(child: _buildStatCard('Pending', '142', Icons.pending_actions, AppColors.tertiary)),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(title, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant), maxLines: 1, overflow: TextOverflow.ellipsis)),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: AppTypography.headlineLarge.copyWith(color: AppColors.onSurface)),
        ],
      ),
    );
  }

  Widget _buildFarmerList() {
    final farmers = [
      {'name': 'Elias Thorne', 'type': 'Grain & Cereal', 'status': 'Verified', 'color': AppColors.primary},
      {'name': 'Sarah Jenkins', 'type': 'Organic Veg', 'status': 'Pending', 'color': AppColors.tertiary},
      {'name': 'Marcus Reed', 'type': 'Dairy', 'status': 'Flagged', 'color': AppColors.error},
      {'name': 'Alicia Perez', 'type': 'Mixed Crop', 'status': 'Verified', 'color': AppColors.primary},
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: farmers.length,
        separatorBuilder: (context, index) => Divider(height: 1, color: AppColors.outlineVariant.withOpacity(0.3)),
        itemBuilder: (context, index) {
          final f = farmers[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: (f['color'] as Color).withOpacity(0.2),
              child: Text((f['name'] as String)[0], style: TextStyle(color: f['color'] as Color, fontWeight: FontWeight.bold)),
            ),
            title: Text(f['name'] as String, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
            subtitle: Text(f['type'] as String, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: (f['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(f['status'] as String, style: AppTypography.labelSmall.copyWith(color: f['color'] as Color)),
            ),
          );
        },
      ),
    );
  }
}
