import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class BuyerProfileScreen extends StatelessWidget {
  const BuyerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Profile', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
        actions: [
          IconButton(icon: const Icon(Icons.settings, color: AppColors.onSurfaceVariant), onPressed: () => context.push('/settings')),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 32),
            _buildSettingsGroup(
              'Account',
              [
                _buildSettingsTile(Icons.person_outline, 'Personal Information', () {}),
                _buildSettingsTile(Icons.location_on_outlined, 'Saved Addresses', () {}),
                _buildSettingsTile(Icons.payment, 'Payment Methods', () {}),
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsGroup(
              'FarmBridge',
              [
                _buildSettingsTile(Icons.storefront, 'Favorite Farms', () {}),
                _buildSettingsTile(Icons.history, 'Order History', () => context.go('/buyer/orders')),
                _buildSettingsTile(Icons.card_membership, 'FarmBridge Premium', () {}),
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsGroup(
              'Support',
              [
                _buildSettingsTile(Icons.help_outline, 'Help Center', () {}),
                _buildSettingsTile(Icons.policy_outlined, 'Terms & Privacy', () {}),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => context.go('/auth'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: const BorderSide(color: AppColors.error),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceContainerHigh,
            border: Border.all(color: AppColors.primaryContainer, width: 2),
          ),
          child: const Center(
            child: Text('R', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primary)),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rajesh Kumar', style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface)),
              const SizedBox(height: 4),
              Text('+91 98765 43210', style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text('Buyer Account', style: AppTypography.labelSmall.copyWith(color: AppColors.onSecondaryContainer)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsGroup(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(title, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1.2)),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.onSurfaceVariant),
      title: Text(title, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
      trailing: const Icon(Icons.chevron_right, color: AppColors.outlineVariant),
      onTap: onTap,
    );
  }
}
