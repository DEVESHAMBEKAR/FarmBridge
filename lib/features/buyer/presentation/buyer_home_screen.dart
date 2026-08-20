import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../../core/providers/providers.dart';
import 'package:intl/intl.dart';

class BuyerHomeScreen extends ConsumerWidget {
  const BuyerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final ordersAsync = ref.watch(buyerOrdersProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Welcome, ${(user?.displayName.isNotEmpty == true) ? user!.displayName.split(' ').first : 'User'}', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.onSurfaceVariant),
            onPressed: () => context.push('/notifications'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBox(),
            const SizedBox(height: 24),
            _buildFeaturedBanner(),
            const SizedBox(height: 32),
            _buildSectionHeader('Recent Orders', onSeeAll: () => context.go('/buyer/orders')),
            const SizedBox(height: 16),
            ordersAsync.when(
              data: (orders) {
                if (orders.isEmpty) {
                  return const Text('No recent orders.');
                }
                final latestOrder = orders.first;
                return _buildRecentOrderCard(latestOrder);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => const Text('Failed to load recent order.'),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader('Trending Categories', onSeeAll: () => context.go('/buyer/marketplace')),
            const SizedBox(height: 16),
            _buildCategoriesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search for fresh produce...',
          prefixIcon: Icon(Icons.search, color: AppColors.onSurfaceVariant),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildFeaturedBanner() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAguW6NQqtNWx0Pv5BoiZpqod5VGkJdsBG0SqZiP5RKd6nE8-HLPJ-jDH9WKjmpfNGZUcCli5ZdZ_yZln0Pr6OgZtbVeOLTeppyIrNUpnsAseO3RoOZS3XuI7CoLTGXDxNlLAtyeEjAdN8qbETh9__Yp32Op-mFwKWcTryjngxcDDZ3dBEq6-gBVvdowqdVSnjkBmvoQnn79hhuv-F4COC2YQJPPHki-ObnHWRv1cdsjWB_Z6zloqU4d3PTV_cmauVcl5gyU3hVa5w'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Farm Fresh Weekly', style: AppTypography.headlineMedium.copyWith(color: AppColors.onPrimary)),
          const SizedBox(height: 4),
          Text('Get up to 20% off on organic veggies', style: AppTypography.bodyMedium.copyWith(color: AppColors.onPrimary.withOpacity(0.9))),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {required VoidCallback onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onSeeAll,
          child: Text('See All', style: AppTypography.labelMedium.copyWith(color: AppColors.primary)),
        ),
      ],
    );
  }

  Widget _buildRecentOrderCard(dynamic order) {
    String dateStr = '';
    if (order.placedAt != null) {
      dateStr = DateFormat('MMM d, yyyy').format(order.placedAt!);
    }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.local_shipping, color: AppColors.onSecondaryContainer),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order #${order.orderId.toString().substring(0, 6).toUpperCase()}', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Placed on $dateStr • ${order.status.toUpperCase()}', style: AppTypography.bodySmall.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 2.5,
      children: [
        _buildCategoryCard('Vegetables', Icons.eco, AppColors.primaryContainer, AppColors.onPrimaryContainer),
        _buildCategoryCard('Fruits', Icons.apple, AppColors.secondaryContainer, AppColors.onSecondaryContainer),
        _buildCategoryCard('Grains', Icons.grass, AppColors.tertiaryContainer, AppColors.onTertiaryContainer),
        _buildCategoryCard('Organic', Icons.verified, AppColors.surfaceContainerHigh, AppColors.onSurface),
      ],
    );
  }

  Widget _buildCategoryCard(String name, IconData icon, Color bgColor, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: bgColor.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 8),
          Text(name, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurface)),
        ],
      ),
    );
  }
}
