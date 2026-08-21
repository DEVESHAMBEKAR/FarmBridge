import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/providers/providers.dart';
import '../../../core/models/order_model.dart';

class BuyerOrdersScreen extends ConsumerWidget {
  const BuyerOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(buyerOrdersProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('My Orders', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
      ),
      body: ordersAsync.when(
        data: (orders) {
          if (orders.isEmpty) {
            return const Center(child: Text('You have no orders yet.'));
          }

          final activeOrders = orders.where((o) => o.status != 'delivered' && o.status != 'cancelled').toList();
          final pastOrders = orders.where((o) => o.status == 'delivered' || o.status == 'cancelled').toList();

          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.onSurfaceVariant,
                  indicatorColor: AppColors.primary,
                  tabs: [
                    Tab(text: 'Active Orders'),
                    Tab(text: 'Past Orders'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildOrdersList(context, activeOrders, isActive: true),
                      _buildOrdersList(context, pastOrders, isActive: false),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, List<OrderModel> orders, {required bool isActive}) {
    if (orders.isEmpty) {
      return Center(
        child: Text(
          isActive ? 'No active orders' : 'No past orders',
          style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: orders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final order = orders[index];
        final dateStr = order.placedAt != null ? DateFormat('MMM dd, yyyy').format(order.placedAt!) : 'Unknown date';
        
        return _buildOrderCard(
          context: context,
          fullOrderId: order.orderId,
          orderId: order.orderId.substring(0, 8).toUpperCase(), // Short ID
          date: dateStr,
          status: order.status.toUpperCase(),
          items: '${order.farmerName} Order', // We could fetch items, but this is a summary
          total: '₹${order.totalAmount.toStringAsFixed(0)}',
          isActive: isActive,
        );
      },
    );
  }

  Widget _buildOrderCard({
    required BuildContext context,
    required String fullOrderId,
    required String orderId,
    required String date,
    required String status,
    required String items,
    required String total,
    required bool isActive,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('#$orderId', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.secondaryContainer : AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  status,
                  style: AppTypography.labelSmall.copyWith(
                    color: isActive ? AppColors.onSecondaryContainer : AppColors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(date, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),
          Text(items, style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: $total', style: AppTypography.titleMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
              if (isActive && status != 'PENDING')
                OutlinedButton(
                  onPressed: () {
                     context.push('/buyer/orders/track/$fullOrderId');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text('Track'),
                )
              else if (isActive)
                 const SizedBox()
              else
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text('Reorder'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
