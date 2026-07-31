import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/cart_model.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'providers/cart_notifier.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartProvider);
    final cartItemsAsync = ref.watch(cartItemsProvider);
    final cartState = ref.watch(cartNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Text('Your Cart', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          cartItemsAsync.when(
            data: (items) {
              if (items.isEmpty) {
                return Center(
                  child: Text('Your cart is empty', style: AppTypography.titleMedium),
                );
              }
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...items.map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _CartItemWidget(item: item),
                        )),
                    const SizedBox(height: 16),
                    _buildOrderSummary(cartAsync.value),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
          ),
          if (cartState.isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context, cartAsync.value),
    );
  }

  Widget _buildOrderSummary(CartModel? cart) {
    if (cart == null || cart.itemCount == 0) return const SizedBox.shrink();

    final deliveryFee = cart.subtotal > 0 ? 25.0 : 0.0;
    final total = cart.subtotal + deliveryFee;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: AppTypography.bodyMedium),
              Text('₹${cart.subtotal.toStringAsFixed(0)}', style: AppTypography.titleMedium),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery', style: AppTypography.bodyMedium),
              Text('₹${deliveryFee.toStringAsFixed(0)}', style: AppTypography.titleMedium.copyWith(color: AppColors.primary)),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppTypography.titleLarge),
              Text('₹${total.toStringAsFixed(0)}', style: AppTypography.headlineMedium.copyWith(color: AppColors.primary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, CartModel? cart) {
    if (cart == null || cart.itemCount == 0) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      child: ElevatedButton(
        onPressed: () => context.push('/buyer/marketplace/checkout'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text('Proceed to Checkout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _CartItemWidget extends ConsumerWidget {
  final CartItemModel item;

  const _CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
              image: item.image.isNotEmpty
                  ? DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover)
                  : null,
            ),
            child: item.image.isEmpty ? const Icon(Icons.image, color: Colors.grey) : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                Text('${item.quantity} ${item.unit}', style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
                const SizedBox(height: 8),
                Text('₹${item.lineTotal.toStringAsFixed(0)}', style: AppTypography.titleMedium.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 20),
                  onPressed: () {
                    ref.read(cartNotifierProvider.notifier).updateQuantity(item, item.quantity - 1);
                  },
                  visualDensity: VisualDensity.compact,
                ),
                Text('${item.quantity.toInt()}', style: AppTypography.titleMedium),
                IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: () {
                    ref.read(cartNotifierProvider.notifier).updateQuantity(item, item.quantity + 1);
                  },
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
