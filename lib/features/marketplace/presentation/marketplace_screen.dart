import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/product_model.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class MarketplaceScreen extends ConsumerStatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  ConsumerState<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends ConsumerState<MarketplaceScreen> {
  String _selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final productsAsync = ref.watch(consumerProductsProvider);
    final cartAsync = ref.watch(cartProvider);

    int cartItemCount = 0;
    if (cartAsync is AsyncData && cartAsync.value != null) {
      cartItemCount = cartAsync.value!.itemCount;
    }

    return Scaffold(
      appBar: _buildAppBar(context, user?.photoUrl, cartItemCount),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: _buildSearchBar(context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 8, top: 8),
            child: _buildCategories(context),
          ),
          Expanded(
            child: productsAsync.when(
              data: (products) {
                // Filter products
                final filtered = products.where((p) {
                  final matchesCat = _selectedCategory == 'All' || 
                                     _selectedCategory.toLowerCase() == p.category.toLowerCase();
                  final matchesSearch = p.title.toLowerCase().contains(_searchQuery.toLowerCase());
                  return matchesCat && matchesSearch;
                }).toList();

                if (filtered.isEmpty) {
                  return const Center(
                    child: Text('No products found.'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    // ignore: unused_result
                    ref.refresh(consumerProductsProvider);
                  },
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final product = filtered[index];
                      return _ProductCard(
                        product: product,
                        onTap: () {
                          context.go('/buyer/marketplace/product/${product.productId}');
                        },
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                child: Text('Error loading products: $err', style: const TextStyle(color: Colors.red)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, String? photoUrl, int cartCount) {
    return AppBar(
      backgroundColor: AppColors.surface.withOpacity(0.9),
      elevation: 0,
      scrolledUnderElevation: 4,
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceContainerHigh,
              border: Border.all(color: AppColors.outlineVariant),
              image: photoUrl != null && photoUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(photoUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: photoUrl == null || photoUrl.isEmpty
                ? const Icon(Icons.person, color: Colors.grey)
                : null,
          ),
          const SizedBox(width: 16),
          Text(
            'Marketplace',
            style: AppTypography.headlineMedium.copyWith(color: AppColors.primary),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: AppColors.onSurfaceVariant),
          onPressed: () {
            context.push('/notifications');
          },
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: AppColors.onSurfaceVariant),
              onPressed: () {
                context.go('/buyer/marketplace/cart');
              },
            ),
            if (cartCount > 0)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.tertiary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$cartCount',
                    style: const TextStyle(
                      color: AppColors.onTertiary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (val) {
          setState(() {
            _searchQuery = val;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search fresh produce...',
          hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant.withOpacity(0.6)),
          prefixIcon: const Icon(Icons.search, color: AppColors.onSurfaceVariant),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    final categories = ['All', 'Vegetables', 'Fruits', 'Grains', 'Dairy', 'Spices', 'Other'];
    
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = _selectedCategory == cat;
          return ActionChip(
            label: Text(
              cat,
              style: AppTypography.labelMedium.copyWith(
                color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
              ),
            ),
            backgroundColor: isSelected ? AppColors.primary : AppColors.surfaceContainerHigh,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            onPressed: () {
              setState(() {
                _selectedCategory = cat;
              });
            },
          );
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const _ProductCard({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = product.images.isNotEmpty;
    final isOutOfStock = product.availableQuantity <= 0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  hasImage
                      ? Image.network(product.images.first, fit: BoxFit.cover)
                      : Container(color: Colors.grey.shade200, child: const Icon(Icons.image, color: Colors.grey)),
                  
                  if (product.isOrganic)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'ORGANIC',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  
                  if (isOutOfStock)
                    Positioned.fill(
                      child: Container(
                        color: Colors.white.withOpacity(0.7),
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'SOLD OUT',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            
            // Details section
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.farmerName,
                            style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.verified, size: 12, color: AppColors.primary),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.title,
                      style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('₹${product.pricePerUnit.toStringAsFixed(0)}', style: AppTypography.titleLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                            Text('per ${product.unit}', style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                        if (!isOutOfStock)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add_shopping_cart, color: AppColors.onPrimaryContainer, size: 18),
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
}
