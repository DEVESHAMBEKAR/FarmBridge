import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('FarmBridge Wallet', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            _buildQuickActions(),
            const SizedBox(height: 32),
            _buildRecentTransactions(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 8))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Available Balance', style: AppTypography.bodyMedium.copyWith(color: AppColors.onPrimary.withOpacity(0.8))),
              const Icon(Icons.account_balance_wallet, color: AppColors.onPrimary),
            ],
          ),
          const SizedBox(height: 8),
          Text('₹4,850.00', style: AppTypography.displayLarge.copyWith(color: AppColors.onPrimary, fontSize: 36)),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: AppColors.primary),
                  label: const Text('Add Money', style: TextStyle(color: AppColors.primary)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_upward, color: AppColors.onPrimary),
                  label: const Text('Withdraw', style: TextStyle(color: AppColors.onPrimary)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.onPrimary),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionIcon(Icons.qr_code_scanner, 'Scan & Pay'),
        _buildActionIcon(Icons.account_balance, 'Bank Transfer'),
        _buildActionIcon(Icons.receipt, 'Transactions'),
        _buildActionIcon(Icons.support_agent, 'Support'),
      ],
    );
  }

  Widget _buildActionIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
          ),
          child: Icon(icon, color: AppColors.primary, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Transactions', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: Text('See All', style: AppTypography.labelMedium.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildTransactionTile(
          'Order #FB-810485',
          'Oct 12, 2023',
          '-₹890',
          Icons.shopping_bag,
          AppColors.error,
          AppColors.errorContainer,
        ),
        const SizedBox(height: 12),
        _buildTransactionTile(
          'Wallet Top-up',
          'Oct 10, 2023',
          '+₹2,000',
          Icons.account_balance_wallet,
          AppColors.primary,
          AppColors.primaryContainer,
        ),
        const SizedBox(height: 12),
        _buildTransactionTile(
          'Order #FB-776211',
          'Oct 05, 2023',
          '-₹450',
          Icons.shopping_bag,
          AppColors.error,
          AppColors.errorContainer,
        ),
      ],
    );
  }

  Widget _buildTransactionTile(String title, String date, String amount, IconData icon, Color amountColor, Color iconBgColor) {
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
            decoration: BoxDecoration(color: iconBgColor.withOpacity(0.3), shape: BoxShape.circle),
            child: Icon(icon, color: amountColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                const SizedBox(height: 4),
                Text(date, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          Text(amount, style: AppTypography.titleMedium.copyWith(color: amountColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
