import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Platform Overview', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.onSurfaceVariant),
            onPressed: () => context.push('/notifications'),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Real-time metrics and system health', style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: 24),
            _buildKPIs(),
            const SizedBox(height: 32),
            _buildActionRequired(),
            const SizedBox(height: 32),
            _buildRecentActivity(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surfaceContainerLow,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.outlineVariant, width: 0.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.surfaceVariant,
                  backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDBhRy5tQJF5UfZ8cvluW6w6is2DWGr8QJS4nSPaxuirHH0k19Bcs4aDDvF4fX1FbX8eBbDBvBJeeQ0UH2K1oPWNJvjjgounJqxP2kZiN5qKgfbvbDBxFGV_Fa7CE6SbOqeVOruZ3-gTWR2VlaLrVg5gS9UMCp8Cc9Fmh6wZPbr-wyZG7BZjqmDQJQbasEXz4KFcQoVOXqAiGoilXMyfkovLxOgJ1eKtX7-K0kwj23L86yfRwErtOvYl3bLGoUNGReSWZQrYQdfHX8'),
                ),
                const SizedBox(height: 12),
                Text('Admin Panel', style: AppTypography.headlineSmall.copyWith(color: AppColors.primary)),
                Text('FarmBridge Management', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: AppColors.onSecondaryContainer),
            title: const Text('Dashboard', style: TextStyle(color: AppColors.onSecondaryContainer)),
            tileColor: AppColors.secondaryContainer,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            onTap: () => context.pop(),
          ),
          ListTile(leading: const Icon(Icons.agriculture), title: const Text('Farmers'), onTap: () {
            context.pop();
            context.push('/admin/farmers');
          }),
          ListTile(leading: const Icon(Icons.analytics), title: const Text('Analytics'), onTap: () {}),
          ListTile(leading: const Icon(Icons.inventory_2), title: const Text('Inventory'), onTap: () {}),
          ListTile(leading: const Icon(Icons.local_shipping), title: const Text('Supply Chain'), onTap: () {}),
          const Divider(),
          ListTile(leading: const Icon(Icons.settings), title: const Text('Settings'), onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildKPIs() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildKPICard('Revenue', '\$84,200', Icons.account_balance, AppColors.primaryContainer, '+12.5%', AppColors.secondary)),
            const SizedBox(width: 16),
            Expanded(child: _buildKPICard('Active Orders', '1,248', Icons.shopping_cart, AppColors.surfaceVariant, '+4.2%', AppColors.secondary)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildKPICard('New Farmers', '42', Icons.group_add, AppColors.tertiaryContainer, '0.0%', AppColors.onSurfaceVariant)),
            const SizedBox(width: 16),
            Expanded(child: _buildKPICard('Deliveries', '94.8%', Icons.local_shipping, AppColors.errorContainer, '-2.1%', AppColors.error)),
          ],
        ),
      ],
    );
  }

  Widget _buildKPICard(String title, String value, IconData icon, Color iconBgColor, String trend, Color trendColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
                child: Icon(icon, size: 20),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: trendColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                child: Text(trend, style: AppTypography.labelSmall.copyWith(color: trendColor)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text(value, style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildActionRequired() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Action Required', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: AppColors.error, borderRadius: BorderRadius.circular(12)),
              child: Text('3 Pending', style: AppTypography.labelSmall.copyWith(color: AppColors.onError)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildApprovalCard(
          'Elias Thorne',
          'New Farmer Application',
          'Midwest region, 500 acres. Organic certification documents attached for review.',
          AppColors.tertiary,
        ),
        const SizedBox(height: 16),
        _buildApprovalCard(
          'Organic Soybeans',
          'High-Volume Listing',
          '200 tons listed by Coop #442. Price point is 15% below market average.',
          AppColors.secondary,
        ),
      ],
    );
  }

  Widget _buildApprovalCard(String title, String subtitle, String desc, Color accentColor) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(width: 4, decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                    Text(subtitle, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    Text(desc, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.onSurface,
                              side: const BorderSide(color: AppColors.outline),
                            ),
                            child: const Text('Review'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.onPrimary,
                            ),
                            child: const Text('Approve'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Activity', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
            TextButton(
              onPressed: () {},
              child: Text('View All', style: AppTypography.labelMedium.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
          ),
          child: Column(
            children: [
              _buildActivityItem('New listing added in Grains', 'Farmer ID #8492 listed 500 tons...', '2m ago', Icons.add_box, AppColors.primary, false),
              const Divider(height: 1),
              _buildActivityItem('Delivery delayed on Route RT-842', 'Weather disruption reported.', '15m ago', Icons.warning, AppColors.error, true),
              const Divider(height: 1),
              _buildActivityItem('Payment clearing completed', 'Batch processing #9921 finished.', '1h ago', Icons.check_circle, AppColors.secondary, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String title, String desc, String time, IconData icon, Color color, bool isError) {
    return Container(
      color: isError ? AppColors.errorContainer.withOpacity(0.2) : Colors.transparent,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isError ? AppColors.errorContainer : AppColors.primaryContainer.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(title, style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold))),
                    Text(time, style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(desc, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
