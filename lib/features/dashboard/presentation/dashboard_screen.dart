import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/providers/providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProfileStreamProvider);
    final isVerified = userAsync.valueOrNull?.isVerified ?? false;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreeting(context, userAsync.valueOrNull?.displayName ?? ''),
            const SizedBox(height: 32),
            _buildWalletCard(context),
            const SizedBox(height: 32),
            _buildQuickStats(context),
            const SizedBox(height: 32),
            if (!isVerified) _buildUnverifiedBanner(context) else _buildAddNewCrop(context),
            const SizedBox(height: 32),
            _buildRecentOrders(context),
            const SizedBox(height: 32),
            _buildInsights(context),
            const SizedBox(height: 96), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
              image: const DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCXsAo-b-CGxU5XeqTuBLuuOyC7O-s6jmWfVlXoQatRSBr7WGWA4w7YnDQqiQWKCdFrzZDbWba-KkyOg5XOEIb8KZRQzI7bve958fvzvkgFuXDHV8aFRQ0sPWhfb9XIpnev4KE6OzQSRCge9A53GEu37NoBOeV-S1P_Lip6PEJ11bhbig2Zr5ZlDgx8jnO4G6WxqMa_81iQm5tOoYhesFCYeoagl8L_VzteIkyltX-Xs68_xWpdvECraqvjFRafl_AwyTu1QKzw-gw'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'FarmBridge',
            style: AppTypography.headlineMedium.copyWith(color: AppColors.primary),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: AppColors.onSurfaceVariant),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildGreeting(BuildContext context, String displayName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good morning, ${displayName.isNotEmpty ? displayName : 'Farmer'}',
          style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface),
        ),
        Text(
          'Here\'s what\'s happening on your farm today.',
          style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildWalletCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryContainer, AppColors.primary],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Balance',
                    style: AppTypography.labelMedium.copyWith(color: Colors.white.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹42,850',
                    style: AppTypography.displayLarge.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Icon(Icons.account_balance_wallet_outlined, color: Colors.white.withOpacity(0.4), size: 32),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Text('Withdraw'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Text('Statement'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.local_florist,
            iconColor: AppColors.primary,
            title: '12',
            subtitle: 'Active Listings',
            badge: '+2',
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _StatCard(
            icon: Icons.receipt_long,
            iconColor: AppColors.tertiary,
            title: '4',
            subtitle: 'Pending Orders',
            badge: '4',
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _StatCard(
            icon: Icons.trending_up,
            iconColor: AppColors.secondary,
            title: '₹8,400',
            subtitle: 'Earnings This Week',
            badge: '15%',
          ),
        ),
      ],
    );
  }

  Widget _buildAddNewCrop(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 32, color: AppColors.onSecondaryContainer),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Crop',
                    style: AppTypography.titleLarge.copyWith(color: AppColors.onSecondaryContainer),
                  ),
                  Text(
                    'List your harvest for the market',
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.onSecondaryContainer.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: AppColors.onSecondaryContainer.withOpacity(0.4)),
          ],
        ),
      ),
    );
  }

  Widget _buildUnverifiedBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.errorContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.pending_actions, size: 32, color: AppColors.error),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Under Review',
                  style: AppTypography.titleLarge.copyWith(color: AppColors.onErrorContainer),
                ),
                Text(
                  'You will be able to list crops once your farm is verified by an admin.',
                  style: AppTypography.bodyMedium.copyWith(color: AppColors.onErrorContainer.withOpacity(0.8)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrders(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Orders', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
            TextButton(
              onPressed: () {},
              child: Text('View All', style: AppTypography.labelMedium.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: const [
              _OrderCard(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDnG1ofitOkt4zHJZ3qamqZdKAWdcim-7zc42eVZEPEm7UBJG1q9-Cov5f4afVSLWfvcJBlwm-9SQLUKE1nmgCmKMjyTs3OXzBKkuKQntmjd7eV9_5vhgQf_GJo8Mk1DdPemy16lgw4DC3D32bSVmNZZ8XrmpnIjUJgHu8_MdlFGfXcgNvkuhFj996CXufXbj-qh0jfFKZRK_hQGUhmfs0Kj8ZxVRER2D7-ijDoMqvWwJzoMmO8ei8zAitr6iKdGB_ZMah0iQnepyI',
                title: 'Organic Tomatoes',
                price: '₹1,200',
                unit: '/ 20kg',
                buyerName: 'Anita S.',
                status: 'NEW',
                statusColor: AppColors.secondaryContainer,
                onStatusColor: AppColors.onSecondaryContainer,
              ),
              SizedBox(width: 16),
              _OrderCard(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDhYf5wOax3p2iZ8c_QSoSHBiBQyOfizYmhOZf7CMCTVdlda724hnsEHdAUqQAwZeUBFZFhxziT9AZdEf_vwz9zyxQWfvvGtxUW0FoKWvw08T-5_rA4VOmP-ZnzzQJ21L03arxk14d_3eVvciSdxxaKqxhsEy6HIHmnrkE79iZUGEPzncIrB-uB7K7hyllDWz0DfOVSnHMwTHwRt-3LaeejauxI89WZUU3g4nMbsbekFa1logfTNQnKxJRvN8OXJGo-54C_UeQwBWs',
                title: 'Fresh Cauliflower',
                price: '₹850',
                unit: '/ 15kg',
                buyerName: 'Market Hub',
                status: 'PENDING',
                statusColor: AppColors.surfaceContainerHigh,
                onStatusColor: AppColors.onSurfaceVariant,
              ),
              SizedBox(width: 16),
              _OrderCard(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA3Rn9-O9eViP_4ScVhBYh2aeQi0pSwZNVgMUHUnDocowmCf5i6t18r3sy4RaPqj0gjn5aFl0_GVijD_76cvrYpLn--deCNinjXgBWtsZ2IZXtSyVX6ADadzoyh2DDHo2D5kE64eM5wSRgmwy8SQ_w9MrHE3YbhM2i9aG40CdBChzCw6f8gaYQOSTEMtQPhAPbm3nd6FuUd7Al3-OyR2imoGDW1j6P5y3H7Raz9x9Xts1T7xxVDNyPJecgPT_GLVa2uHcyvUbXpWNQ',
                title: 'Yellow Bananas',
                price: '₹2,100',
                unit: '/ 50kg',
                buyerName: 'Fresh Mart',
                status: 'PENDING',
                statusColor: AppColors.surfaceContainerHigh,
                onStatusColor: AppColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInsights(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Insights for you', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.tertiaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Market Alert', style: AppTypography.titleLarge.copyWith(color: AppColors.onTertiaryContainer)),
                        const SizedBox(height: 4),
                        Text('Wheat prices are expected to rise by 8% next week. Consider holding your stock.', style: AppTypography.bodyMedium.copyWith(color: AppColors.onTertiaryContainer.withOpacity(0.9))),
                      ],
                    ),
                    Positioned(
                      bottom: -16,
                      right: -16,
                      child: Icon(Icons.trending_up, size: 120, color: Colors.black.withOpacity(0.1)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String badge;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor),
              Text(badge, style: AppTypography.labelMedium.copyWith(color: iconColor)),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
          Text(subtitle, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String unit;
  final String buyerName;
  final String status;
  final Color statusColor;
  final Color onStatusColor;

  const _OrderCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.unit,
    required this.buyerName,
    required this.status,
    required this.statusColor,
    required this.onStatusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  status,
                  style: AppTypography.labelSmall.copyWith(color: onStatusColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurface)),
          RichText(
            text: TextSpan(
              text: price,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: ' $unit', style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12)),
            ),
            child: Row(
              children: [
                const Icon(Icons.person, size: 14, color: AppColors.onSurfaceVariant),
                const SizedBox(width: 4),
                Text('Buyer: $buyerName', style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
