import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/product_model.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../cart/presentation/providers/cart_notifier.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  int _quantity = 1;

  void _increment(double available) {
    if (_quantity < available) {
      setState(() => _quantity++);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cannot exceed available stock of $available')),
      );
    }
  }

  void _decrement() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  Future<void> _addToCart(ProductModel product) async {
    final notifier = ref.read(cartNotifierProvider.notifier);
    await notifier.addToCart(product, _quantity.toDouble());

    if (mounted) {
      final state = ref.read(cartNotifierProvider);
      if (state.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error!)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Added to cart successfully')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productStreamProvider(widget.productId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: productAsync.when(
        data: (product) {
          if (product == null) {
            return const Center(child: Text('Product not found'));
          }
          return CustomScrollView(
            slivers: [
              _buildSliverAppBar(context, product),
              SliverToBoxAdapter(
                child: _buildContent(context, product),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
      ),
      bottomNavigationBar: productAsync.whenOrNull(
        data: (product) => product != null ? _buildBottomActions(product) : null,
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, ProductModel product) {
    return SliverAppBar(
      expandedHeight: 350,
      pinned: true,
      backgroundColor: AppColors.surface.withOpacity(0.9),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        onPressed: () => context.pop(),
        style: IconButton.styleFrom(backgroundColor: AppColors.surfaceContainerLow),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: AppColors.onSurfaceVariant),
          onPressed: () {
            context.go('/buyer/marketplace/cart');
          },
          style: IconButton.styleFrom(backgroundColor: AppColors.surfaceContainerLow),
        ),
        const SizedBox(width: 8),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (product.images.isNotEmpty)
              Image.network(product.images.first, fit: BoxFit.cover)
            else
              Container(color: Colors.grey.shade300, child: const Icon(Icons.image, size: 64, color: Colors.grey)),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.background.withOpacity(1.0)],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 24,
              child: Row(
                children: [
                  if (product.isOrganic)
                    _buildBadge(Icons.eco, 'Organic', AppColors.secondaryContainer, AppColors.onSecondaryContainer),
                  if (product.isOrganic) const SizedBox(width: 8),
                  _buildBadge(Icons.category, product.category.toUpperCase(), AppColors.primaryContainer, AppColors.onPrimaryContainer),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(IconData icon, String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 4),
          Text(text, style: AppTypography.labelSmall.copyWith(color: textColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface)),
                    Text(
                      product.status == 'active' && product.availableQuantity > 0 ? 'In Stock' : 'Sold Out',
                      style: AppTypography.bodyMedium.copyWith(
                          color: product.availableQuantity > 0 ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('₹${product.pricePerUnit.toStringAsFixed(0)}', style: AppTypography.headlineMedium.copyWith(color: AppColors.primary)),
                  Text('Per ${product.unit}', style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1.2)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildQuantitySelector(product.availableQuantity),
          const SizedBox(height: 24),
          _buildSourcedFrom(product),
          const SizedBox(height: 24),
          _buildDescription(product.description),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(double maxAvailable) {
    final bool isOutOfStock = maxAvailable <= 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isOutOfStock ? 'Currently Unavailable' : 'Select Quantity',
            style: AppTypography.labelMedium.copyWith(color: isOutOfStock ? Colors.red : AppColors.onSurfaceVariant),
          ),
          if (!isOutOfStock)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, size: 20),
                    color: AppColors.primary,
                    onPressed: _decrement,
                    visualDensity: VisualDensity.compact,
                  ),
                  SizedBox(
                    width: 40,
                    child: Text('$_quantity', textAlign: TextAlign.center, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, size: 20),
                    color: AppColors.onPrimary,
                    style: IconButton.styleFrom(backgroundColor: AppColors.primary),
                    onPressed: () => _increment(maxAvailable),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSourcedFrom(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SOURCED FROM', style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1.5)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.surfaceVariant),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryFixed, width: 2),
                  image: product.farmerPhotoUrl != null && product.farmerPhotoUrl!.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(product.farmerPhotoUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: product.farmerPhotoUrl == null || product.farmerPhotoUrl!.isEmpty
                    ? const Icon(Icons.person, color: Colors.grey)
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(product.farmerName, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                        const SizedBox(width: 4),
                        const Icon(Icons.verified, size: 16, color: AppColors.primary),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: AppColors.onSurfaceVariant),
                        const SizedBox(width: 2),
                        Text(product.locationName.isNotEmpty ? product.locationName : 'Local Farm', style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('DESCRIPTION', style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1.5)),
        const SizedBox(height: 8),
        Text(
          description.isNotEmpty ? description : 'No description provided.',
          style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildBottomActions(ProductModel product) {
    final cartState = ref.watch(cartNotifierProvider);
    final isOutOfStock = product.availableQuantity <= 0;
    
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16, top: 16, left: 24, right: 24),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.95),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 16, offset: const Offset(0, -4))],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: isOutOfStock || cartState.isLoading ? null : () => _addToCart(product),
              icon: cartState.isLoading 
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Icon(Icons.shopping_cart),
              label: Text(isOutOfStock ? 'Out of Stock' : 'Add to Cart - ₹${(product.pricePerUnit * _quantity).toStringAsFixed(0)}'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
