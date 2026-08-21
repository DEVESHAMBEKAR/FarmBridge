import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/models/order_model.dart';
import 'providers/admin_providers.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(adminAllUsersProvider);
    final productsAsync = ref.watch(adminAllProductsProvider);
    final ordersAsync = ref.watch(adminAllOrdersProvider);
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Platform Overview', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Real-time metrics and system health', style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: 32),
            
            // Stats Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 1200 ? 4 : (constraints.maxWidth > 800 ? 3 : (constraints.maxWidth > 500 ? 2 : 1));
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: crossAxisCount == 1 ? 2.5 : 1.5,
                  children: [
                    _buildStatCard(
                      'Total Users', 
                      usersAsync.when(
                        data: (u) => u.length.toString(),
                        loading: () => '...',
                        error: (_, __) => 'Error'
                      ), 
                      Icons.people, 
                      AppColors.primary
                    ),
                    _buildStatCard(
                      'Total Products', 
                      productsAsync.when(
                        data: (p) => p.length.toString(),
                        loading: () => '...',
                        error: (_, __) => 'Error'
                      ), 
                      Icons.inventory_2, 
                      AppColors.secondary
                    ),
                    _buildStatCard(
                      'Total Orders', 
                      ordersAsync.when(
                        data: (o) => o.length.toString(),
                        loading: () => '...',
                        error: (_, __) => 'Error'
                      ), 
                      Icons.shopping_cart, 
                      const Color(0xFF2E7D32)
                    ),
                    _buildStatCard(
                      'Total Revenue', 
                      ordersAsync.when(
                        data: (o) {
                          final revenue = o.fold<double>(0, (sum, item) => sum + item.totalAmount);
                          return '₹${revenue.toStringAsFixed(0)}';
                        },
                        loading: () => '...',
                        error: (_, __) => 'Error'
                      ), 
                      Icons.attach_money, 
                      const Color(0xFFF57F17)
                    ),
                  ],
                );
              },
            ),
            
            const SizedBox(height: 48),

            // Quick Actions
            Text('Quick Actions', style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildActionButton(context, 'Dispatch Center', Icons.local_shipping, Colors.green, '/admin/dashboard/dispatch'),
                _buildActionButton(context, 'Verification Center', Icons.verified_user, Colors.blue, '/admin/dashboard/verifications'),
                _buildActionButton(context, 'Audit Logs', Icons.history, Colors.indigo, '/admin/audit-logs'),
              ],
            ),

            const SizedBox(height: 48),

            // Detailed Sections
            if (isMobile)
              Column(
                children: [
                  _buildSectionCard(
                    title: 'Recent Orders',
                    child: _buildRecentOrdersList(ordersAsync),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionCard(
                    title: 'Platform Health',
                    child: _buildHealthList(),
                  ),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildSectionCard(
                      title: 'Recent Orders',
                      child: _buildRecentOrdersList(ordersAsync),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 1,
                    child: _buildSectionCard(
                      title: 'Platform Health',
                      child: _buildHealthList(),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _buildRecentOrdersList(AsyncValue<List<OrderModel>> ordersAsync) {
    return ordersAsync.when(
      data: (orders) {
        if (orders.isEmpty) return const Center(child: Text('No orders yet.'));
        // Sort by placedAt descending and take top 5
        final recentOrders = List.of(orders)
          ..sort((a, b) => (b.placedAt ?? DateTime.now()).compareTo(a.placedAt ?? DateTime.now()));
        final top5 = recentOrders.take(5).toList();
        
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: top5.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final o = top5[index];
            return ListTile(
              title: Text('Order #${o.orderId.substring(0, 8).toUpperCase()}'),
              subtitle: Text(o.buyerName.isNotEmpty ? o.buyerName : 'Unknown Buyer'),
              trailing: Text('₹${o.totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
    );
  }

  Widget _buildHealthList() {
    return Column(
      children: [
        _buildHealthRow('Database', true),
        _buildHealthRow('Authentication', true),
        _buildHealthRow('Storage', true),
        _buildHealthRow('Cloud Functions', false),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.outlineVariant.withOpacity(0.5)),
      ),
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurfaceVariant)),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
              ],
            ),
            Text(value, style: AppTypography.headlineLarge.copyWith(fontWeight: FontWeight.bold, color: AppColors.onSurface)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.outlineVariant.withOpacity(0.5)),
      ),
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildHealthRow(String service, bool isHealthy) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(service, style: AppTypography.bodyLarge),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isHealthy ? AppColors.primary.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              isHealthy ? 'Operational' : 'Offline',
              style: TextStyle(
                color: isHealthy ? AppColors.primary : AppColors.error,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildActionButton(BuildContext context, String label, IconData icon, Color color, String route) {
    return ElevatedButton.icon(
      onPressed: () => context.push(route),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
