import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/providers/providers.dart';
import '../../../core/models/order_model.dart';
import 'providers/delivery_order_notifier.dart';

class LogisticsDashboardScreen extends ConsumerWidget {
  const LogisticsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableOrdersAsync = ref.watch(availableOrdersProvider);
    final myOrdersAsync = ref.watch(deliveryOrdersProvider);
    final notifierState = ref.watch(deliveryOrderNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Delivery Portal', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
      ),
      body: Stack(
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.onSurfaceVariant,
                  indicatorColor: AppColors.primary,
                  tabs: [
                    Tab(text: 'Available for Pickup'),
                    Tab(text: 'My Deliveries'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Available Orders
                      availableOrdersAsync.when(
                        data: (orders) => _buildOrdersList(orders, ref, isAvailableTab: true),
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (err, _) => Center(child: Text('Error: $err')),
                      ),
                      // My Deliveries
                      myOrdersAsync.when(
                        data: (orders) => _buildOrdersList(orders, ref, isAvailableTab: false),
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (err, _) => Center(child: Text('Error: $err')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (notifierState.isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<OrderModel> orders, WidgetRef ref, {required bool isAvailableTab}) {
    if (orders.isEmpty) {
      return Center(
        child: Text(
          isAvailableTab ? 'No orders ready for pickup.' : 'You have no active deliveries.',
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
        
        return _buildOrderCard(order, dateStr, ref, isAvailableTab);
      },
    );
  }

  Widget _buildOrderCard(OrderModel order, String date, WidgetRef ref, bool isAvailableTab) {
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
                  color: order.status == 'delivered' ? AppColors.surfaceContainerHigh : AppColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  order.status.replaceAll('_', ' ').toUpperCase(),
                  style: AppTypography.labelSmall.copyWith(
                    color: order.status == 'delivered' ? AppColors.onSurfaceVariant : AppColors.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(date, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.store, size: 16, color: AppColors.onSurfaceVariant),
              const SizedBox(width: 8),
              Text('From: ${order.farmerName}', style: AppTypography.bodyMedium),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.home, size: 16, color: AppColors.onSurfaceVariant),
              const SizedBox(width: 8),
              Expanded(child: Text('To: ${order.deliveryAddress}', style: AppTypography.bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee', style: AppTypography.bodyMedium),
              Text('₹${order.deliveryFee.toStringAsFixed(0)}', style: AppTypography.titleMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          if (isAvailableTab)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => ref.read(deliveryOrderNotifierProvider.notifier).claimOrder(order.orderId),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.onPrimary),
                child: const Text('Claim Order'),
              ),
            )
          else if (order.status == 'out_for_delivery')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => ref.read(deliveryOrderNotifierProvider.notifier).updateOrderStatus(order.orderId, 'delivered'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.onPrimary),
                child: const Text('Mark as Delivered'),
              ),
            ),
        ],
      ),
    );
  }
}
