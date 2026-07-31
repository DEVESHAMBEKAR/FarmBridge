import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/cart_model.dart';
import '../../checkout/presentation/providers/checkout_notifier.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String _selectedSlot = 'standard';
  String _paymentMethod = 'wallet';

  Future<void> _handlePayment(CartModel cart, List<CartItemModel> items) async {
    // In a real app, we would have forms for these. For MVP, we pass dummy or user's existing values.
    final user = ref.read(currentUserProvider);
    final deliveryAddress = user?.buyerProfile?.deliveryAddress.isNotEmpty == true ? user!.buyerProfile!.deliveryAddress : '12, Green Park, South Extension, New Delhi - 110049';
    final deliveryPincode = user?.buyerProfile?.pincode.isNotEmpty == true ? user!.buyerProfile!.pincode : '110049';

    await ref.read(checkoutNotifierProvider.notifier).placeOrder(
      cart: cart,
      items: items,
      deliveryAddress: deliveryAddress,
      deliveryPincode: deliveryPincode,
      paymentMethod: _paymentMethod,
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primaryFixed,
              child: Icon(Icons.check_circle, size: 48, color: AppColors.onPrimaryFixedVariant),
            ),
            const SizedBox(height: 24),
            Text('Order Confirmed!', style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface)),
            const SizedBox(height: 8),
            Text(
              'Your fresh harvest from FarmBridge is on its way to your home.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.pop(); // Close dialog
                  context.go('/buyer/orders'); // Go to orders tab
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Track Order', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Listen to checkout state for success
    ref.listen<CheckoutState>(checkoutNotifierProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${next.error}')));
      } else if (next.success) {
        _showSuccessDialog();
      }
    });

    final cartAsync = ref.watch(cartProvider);
    final itemsAsync = ref.watch(cartItemsProvider);
    final checkoutState = ref.watch(checkoutNotifierProvider);
    
    // We expect data to be present here because we navigated from the cart
    if (cartAsync is! AsyncData || cartAsync.value == null || itemsAsync is! AsyncData || itemsAsync.value!.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    
    final cart = cartAsync.value!;
    final items = itemsAsync.value!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        title: Text('Checkout', style: AppTypography.titleLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.agriculture, color: AppColors.primary), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('DELIVERY ADDRESS', onAction: () {}),
            _buildAddressCard(),
            const SizedBox(height: 24),
            _buildSectionTitle('DELIVERY SLOT'),
            _buildDeliverySlots(),
            const SizedBox(height: 24),
            _buildSectionTitle('ORDER SUMMARY'),
            _buildOrderSummary(cart, items),
            const SizedBox(height: 24),
            _buildSectionTitle('PAYMENT METHOD'),
            _buildPaymentMethods(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: _buildBottomBar(cart, items, checkoutState.isProcessing),
    );
  }

  Widget _buildSectionTitle(String title, {VoidCallback? onAction}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1.2)),
          if (onAction != null)
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text('Change', style: AppTypography.labelMedium.copyWith(color: AppColors.primary)),
            ),
        ],
      ),
    );
  }

  Widget _buildAddressCard() {
    final user = ref.watch(currentUserProvider);
    final address = user?.buyerProfile?.deliveryAddress.isNotEmpty == true ? user!.buyerProfile!.deliveryAddress : '12, Green Park, South Extension, New Delhi - 110049';
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.home, color: AppColors.onPrimaryContainer, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Home', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(address, style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverySlots() {
    return Row(
      children: [
        Expanded(
          child: _buildSlotOption(
            id: 'standard',
            title: 'Standard',
            subtitle: 'Morning (8 AM - 11 AM)',
            price: 'Free',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSlotOption(
            id: 'express',
            title: 'Express',
            subtitle: 'Within 2 hrs',
            price: '₹25',
          ),
        ),
      ],
    );
  }

  Widget _buildSlotOption({required String id, required String title, required String subtitle, required String price}) {
    final isSelected = _selectedSlot == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedSlot = id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.05) : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primary : Colors.transparent, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: 8),
            Text(price, style: AppTypography.bodyMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(CartModel cart, List<CartItemModel> items) {
    final deliveryFee = cart.subtotal > 0 ? 25.0 : 0.0;
    final total = cart.subtotal + deliveryFee;
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildSummaryItem(
                    item.title,
                    '${item.quantity} ${item.unit} • ₹${item.pricePerUnit.toStringAsFixed(0)}/${item.unit}',
                    '₹${item.lineTotal.toStringAsFixed(0)}',
                    item.image,
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh.withOpacity(0.3),
              border: Border(top: BorderSide(color: AppColors.outlineVariant.withOpacity(0.3))),
            ),
            child: Column(
              children: [
                _buildPricingRow('Subtotal', '₹${cart.subtotal.toStringAsFixed(0)}'),
                const SizedBox(height: 8),
                _buildPricingRow('Delivery Fee', '₹${deliveryFee.toStringAsFixed(0)}', valueColor: AppColors.primary),
                const SizedBox(height: 8),
                _buildPricingRow('Total Amount', '₹${total.toStringAsFixed(0)}', isTotal: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String name, String desc, String price, String imageUrl) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200,
            image: imageUrl.isNotEmpty ? DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover) : null,
          ),
          child: imageUrl.isEmpty ? const Icon(Icons.image, color: Colors.grey) : null,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                  Text(price, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                ],
              ),
              const SizedBox(height: 4),
              Text(desc, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPricingRow(String label, String value, {Color? valueColor, bool isTotal = false}) {
    final style = isTotal
        ? AppTypography.titleLarge.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)
        : AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style.copyWith(color: valueColor)),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      children: [
        _buildPaymentOption(
          id: 'wallet',
          title: 'FarmBridge Wallet',
          subtitle: 'Balance: ₹4,850',
          icon: Icons.account_balance_wallet,
          iconBg: AppColors.secondaryContainer,
          iconColor: AppColors.onSecondaryContainer,
        ),
        const SizedBox(height: 12),
        _buildPaymentOption(
          id: 'upi',
          title: 'UPI (PhonePe/Google Pay)',
          icon: Icons.contactless,
          iconBg: AppColors.surfaceContainerHigh,
          iconColor: AppColors.primary,
        ),
        const SizedBox(height: 12),
        _buildPaymentOption(
          id: 'cards',
          title: 'Credit / Debit Cards',
          icon: Icons.credit_card,
          iconBg: AppColors.surfaceContainerHigh,
          iconColor: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required String id,
    required String title,
    String? subtitle,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
  }) {
    final isSelected = _paymentMethod == id;
    
    return GestureDetector(
      onTap: () => setState(() => _paymentMethod = id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
          boxShadow: isSelected ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 8)] : null,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(subtitle, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ],
              ),
            ),
            if (id == 'wallet')
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected ? AppColors.primary : AppColors.outlineVariant, width: 2),
                ),
                child: isSelected ? Center(child: Container(width: 10, height: 10, decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary))) : null,
              )
            else
              const Icon(Icons.chevron_right, color: AppColors.outlineVariant),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(CartModel cart, List<CartItemModel> items, bool isProcessing) {
    final deliveryFee = cart.subtotal > 0 ? 25.0 : 0.0;
    final total = cart.subtotal + deliveryFee;

    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16, top: 16, left: 24, right: 24),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        border: Border(top: BorderSide(color: AppColors.outlineVariant.withOpacity(0.2))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('TOTAL TO PAY', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
              Text('₹${total.toStringAsFixed(0)}', style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: ElevatedButton(
              onPressed: isProcessing ? null : () => _handlePayment(cart, items),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
              ),
              child: isProcessing
                  ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: AppColors.onPrimary, strokeWidth: 2))
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pay & Confirm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
