import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class InventoryStockManagementScreen extends StatelessWidget {
  const InventoryStockManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Text('Inventory & Stock', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: AppColors.onSurfaceVariant), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActionButtons(),
            const SizedBox(height: 24),
            _buildStatGrid(),
            const SizedBox(height: 24),
            Text('Inventory Batches', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
            const SizedBox(height: 16),
            _buildInventoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, size: 18),
            label: const Text('Export Report'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.onSurface,
              side: const BorderSide(color: AppColors.outlineVariant),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.swap_horiz, size: 18),
            label: const Text('Move Stock'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.1,
      children: [
        _buildStatCard('Total Volume', '42,500', 'Tons', Icons.warehouse, AppColors.secondary),
        _buildStatCard('Expiring Soon', '1,240', 'Tons', Icons.event_busy, AppColors.error),
        _buildStatCard('Low Alerts', '12', 'Batches', Icons.warning, AppColors.tertiary),
        _buildStorageCard(),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String unit, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title, style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant), maxLines: 1)),
              Icon(icon, size: 16, color: color),
            ],
          ),
          RichText(
            text: TextSpan(
              text: '$value\n',
              style: AppTypography.headlineMedium.copyWith(color: color == AppColors.error ? AppColors.error : AppColors.onSurface),
              children: [
                TextSpan(text: unit, style: AppTypography.titleSmall.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStorageCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Storage Cap', style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
              const Icon(Icons.inventory_2, size: 16, color: AppColors.onSurfaceVariant),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('84%', style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface)),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: 0.84,
                backgroundColor: AppColors.surfaceContainerHighest,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryList() {
    final items = [
      {'name': 'Organic Wheat', 'batch': '#WH-092', 'qty': '850', 'status': 'Available', 'color': AppColors.primary},
      {'name': 'Premium Soybeans', 'batch': '#SB-114', 'qty': '45', 'status': 'Expiring Soon', 'color': AppColors.error},
      {'name': 'Irrigation Corn', 'batch': '#CR-002', 'qty': '1,200', 'status': 'Reserved', 'color': AppColors.onSurfaceVariant},
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
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(height: 1, color: AppColors.outlineVariant.withOpacity(0.3)),
        itemBuilder: (context, index) {
          final item = items[index];
          final color = item['color'] as Color;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name'] as String, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                      const SizedBox(height: 4),
                      Text(item['batch'] as String, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: color.withOpacity(0.2)),
                        ),
                        child: Text(item['status'] as String, style: AppTypography.labelSmall.copyWith(color: color)),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${item['qty']} Tons', style: AppTypography.titleMedium.copyWith(color: color == AppColors.error ? AppColors.error : AppColors.onSurface)),
                    const SizedBox(height: 4),
                    const Icon(Icons.more_vert, size: 20, color: AppColors.onSurfaceVariant),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
