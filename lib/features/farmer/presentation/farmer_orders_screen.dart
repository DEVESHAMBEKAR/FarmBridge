import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/providers/providers.dart';
import '../../../core/models/order_model.dart';
import 'providers/farmer_order_notifier.dart';

class FarmerOrdersScreen extends ConsumerWidget {
  const FarmerOrdersScreen({super.key});

  void _showReadyForPickupSheet(BuildContext context, WidgetRef ref, OrderModel order) {
    final packageCountCtrl = TextEditingController(text: '1');
    final weightCtrl = TextEditingController();
    final dimensionsCtrl = TextEditingController();
    final specialInstructionsCtrl = TextEditingController();
    bool refrigerationRequired = false;
    final user = ref.read(currentUserProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: MediaQuery.of(context).viewInsets.bottom + 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Package Details', style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('This will notify admin to arrange pickup', style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
                const SizedBox(height: 24),
                Row(children: [
                  Expanded(child: TextField(controller: packageCountCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Package Count', border: OutlineInputBorder()))),
                  const SizedBox(width: 16),
                  Expanded(child: TextField(controller: weightCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Total Weight (KG)', border: OutlineInputBorder()))),
                ]),
                const SizedBox(height: 16),
                TextField(controller: dimensionsCtrl, decoration: const InputDecoration(labelText: 'Dimensions (e.g. 30x20x20 cm)', border: OutlineInputBorder())),
                const SizedBox(height: 16),
                TextField(controller: specialInstructionsCtrl, maxLines: 2, decoration: const InputDecoration(labelText: 'Special Instructions (optional)', border: OutlineInputBorder())),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Refrigeration Required'),
                  value: refrigerationRequired,
                  onChanged: (v) => setState(() => refrigerationRequired = v),
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      final weight = double.tryParse(weightCtrl.text.trim()) ?? 1.0;
                      final count = int.tryParse(packageCountCtrl.text.trim()) ?? 1;
                      Navigator.pop(context);
                      ref.read(farmerOrderNotifierProvider.notifier).markReadyForPickup(
                        orderId: order.orderId,
                        farmerId: order.farmerId,
                        buyerId: order.buyerId,
                        pickupLocation: user?.farmerProfile?.farmAddress ?? 'Farmer Location',
                        deliveryLocation: '${order.deliveryAddress}, ${order.deliveryPincode}',
                        productType: order.farmerName.isNotEmpty ? order.farmerName : 'Agricultural Produce',
                        totalWeight: weight,
                        packageCount: count,
                        packageDimensions: dimensionsCtrl.text.trim().isEmpty ? null : dimensionsCtrl.text.trim(),
                        refrigerationRequired: refrigerationRequired,
                        specialInstructions: specialInstructionsCtrl.text.trim().isEmpty ? null : specialInstructionsCtrl.text.trim(),
                      );
                    },
                    child: const Text('Confirm Ready for Pickup', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
              final inProgressOrders = orders.where((o) => ['packed', 'shipped', 'ready_for_pickup', 'in_transit'].contains(o.status)).toList();
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
                          _buildOrdersList(context, newOrders, ref),
                          _buildOrdersList(context, inProgressOrders, ref),
                          _buildOrdersList(context, completedOrders, ref, isCompleted: true),
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
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, List<OrderModel> orders, WidgetRef ref, {bool isCompleted = false}) {
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
        return _buildOrderCard(context, order, dateStr, ref, isCompleted);
      },
    );
  }

  Widget _buildOrderCard(BuildContext context, OrderModel order, String date, WidgetRef ref, bool isCompleted) {
    final statusColors = {
      'placed': Colors.orange,
      'packed': Colors.blue,
      'ready_for_pickup': Colors.green,
      'in_transit': Colors.purple,
      'delivered': Colors.green,
      'cancelled': Colors.red,
    };
    final statusColor = statusColors[order.status] ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4, offset: const Offset(0, 2))],
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
                decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(16)),
                child: Text(order.status.toUpperCase().replaceAll('_', ' '), style: AppTypography.labelSmall.copyWith(color: statusColor, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(date, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text('Buyer: ${order.buyerName}', style: AppTypography.bodySmall.copyWith(color: AppColors.onSurface)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(height: 1)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Earnings', style: AppTypography.bodyMedium),
              Text('Rs.${order.subtotal.toStringAsFixed(0)}', style: AppTypography.titleMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
            ],
          ),
          if (!isCompleted) ...[
            const SizedBox(height: 16),
            if (order.status == 'placed')
              Row(children: [
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
              ])
            else if (order.status == 'packed')
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _showReadyForPickupSheet(context, ref, order),
                  icon: const Icon(Icons.local_shipping_outlined),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                  label: const Text('Mark Ready for Pickup'),
                ),
              )
            else if (order.status == 'ready_for_pickup')
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                child: const Row(children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 16),
                  SizedBox(width: 8),
                  Text('Admin notified — awaiting pickup dispatch', style: TextStyle(color: Colors.green, fontSize: 13)),
                ]),
              )
            else if (order.status == 'in_transit')
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    context.push('/farmer/orders/track/${order.orderId}');
                  },
                  icon: const Icon(Icons.location_on),
                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary, side: const BorderSide(color: AppColors.primary)),
                  label: const Text('Live Track Package'),
                ),
              ),
          ]
        ],
      ),
    );
  }
}
