import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/providers/providers.dart';
import '../../../core/models/order_model.dart';
import 'providers/farmer_order_notifier.dart';

class FarmerOrdersScreen extends ConsumerWidget {
  const FarmerOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(farmerOrdersProvider);
    final orderState = ref.watch(farmerOrderNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('My Orders', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
      ),
      body: Stack(
        children: [
          ordersAsync.when(
            data: (orders) {
              if (orders.isEmpty) {
                return const Center(child: Text('No orders received yet.'));
              }

              final newOrders = orders.where((o) => o.status == 'placed').toList();
              final inProgressOrders = orders.where((o) => o.status == 'packed' || o.status == 'shipped').toList();
              final completedOrders = orders.where((o) => o.status == 'delivered' || o.status == 'cancelled').toList();

              return DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.onSurfaceVariant,
                      indicatorColor: AppColors.primary,
                      isScrollable: true,
                      tabs: [
                        Tab(text: 'New Requests'),
                        Tab(text: 'In Progress'),
                        Tab(text: 'Completed'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildOrdersList(newOrders, ref),
                          _buildOrdersList(inProgressOrders, ref),
                          _buildOrdersList(completedOrders, ref, isCompleted: true),
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
          if (orderState.isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<OrderModel> orders, WidgetRef ref, {bool isCompleted = false}) {
    if (orders.isEmpty) {
      return Center(
        child: Text(
          'No orders here',
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
        
        return _buildOrderCard(order, dateStr, ref, isCompleted);
      },
    );
  }

  Widget _buildOrderCard(OrderModel order, String date, WidgetRef ref, bool isCompleted) {
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
              Text('#${order.orderId.substring(0, 8).toUpperCase()}', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isCompleted ? AppColors.surfaceContainerHigh : AppColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  order.status.toUpperCase(),
                  style: AppTypography.labelSmall.copyWith(
                    color: isCompleted ? AppColors.onSurfaceVariant : AppColors.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(date, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text('Buyer: ${order.buyerName}', style: AppTypography.bodySmall.copyWith(color: AppColors.onSurface)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),
          // Normally we'd fetch items here. We just show total for now.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Earnings', style: AppTypography.bodyMedium),
              Text('₹${order.subtotal.toStringAsFixed(0)}', style: AppTypography.titleMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
            ],
          ),
          if (!isCompleted) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                if (order.status == 'placed') ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => ref.read(farmerOrderNotifierProvider.notifier).updateOrderStatus(order.orderId, 'cancelled'),
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
                      child: const Text('Reject'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => ref.read(farmerOrderNotifierProvider.notifier).updateOrderStatus(order.orderId, 'packed'),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.onPrimary),
                      child: const Text('Accept & Pack'),
                    ),
                  ),
                ] else if (order.status == 'packed') ...[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => ref.read(farmerOrderNotifierProvider.notifier).updateOrderStatus(order.orderId, 'shipped'),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.onPrimary),
                      child: const Text('Hand to Delivery'),
                    ),
                  ),
                ]
              ],
            ),
          ]
        ],
      ),
    );
  }
}
