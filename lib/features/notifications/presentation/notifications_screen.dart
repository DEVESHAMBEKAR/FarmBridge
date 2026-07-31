import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Notifications', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Today', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 16),
          _buildNotificationItem(
            'Order Confirmed',
            'Your order #FB-827391 has been confirmed and is being prepared.',
            '10:30 AM',
            Icons.check_circle,
            AppColors.primary,
            isUnread: true,
          ),
          const SizedBox(height: 16),
          _buildNotificationItem(
            'Price Drop Alert',
            'Premium Hass Avocados are now 15% off!',
            '09:15 AM',
            Icons.local_offer,
            AppColors.secondary,
            isUnread: true,
          ),
          const SizedBox(height: 24),
          Text('Yesterday', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 16),
          _buildNotificationItem(
            'Delivery Successful',
            'Your order #FB-819922 was delivered successfully.',
            '04:45 PM',
            Icons.local_shipping,
            AppColors.onSurfaceVariant,
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String title, String body, String time, IconData icon, Color color, {bool isUnread = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? color.withOpacity(0.05) : AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isUnread ? color.withOpacity(0.3) : AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUnread ? color.withOpacity(0.2) : AppColors.surfaceContainerLow,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isUnread ? color : AppColors.onSurfaceVariant, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(title, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface))),
                    Text(time, style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(body, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          if (isUnread) ...[
            const SizedBox(width: 8),
            Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          ]
        ],
      ),
    );
  }
}
