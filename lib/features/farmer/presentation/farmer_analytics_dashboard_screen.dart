import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class FarmerAnalyticsDashboardScreen extends StatelessWidget {
  const FarmerAnalyticsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Analytics', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Deep insights into farm performance.', style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: 24),
            _buildTimeFilter(),
            const SizedBox(height: 32),
            _buildYieldOverview(),
            const SizedBox(height: 24),
            _buildKeyMetrics(),
            const SizedBox(height: 24),
            _buildCropPerformance(),
            const SizedBox(height: 24),
            _buildPriceTrends(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeFilter() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(child: _buildFilterTab('Daily', isSelected: false)),
          Expanded(child: _buildFilterTab('Weekly', isSelected: false)),
          Expanded(child: _buildFilterTab('Monthly', isSelected: true)),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.surface : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] : null,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: AppTypography.labelMedium.copyWith(
          color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildYieldOverview() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Yield Overview', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
              const Icon(Icons.more_vert, color: AppColors.onSurfaceVariant),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBar(0.4, 'Jan'),
                _buildBar(0.55, 'Feb'),
                _buildBar(0.3, 'Mar'),
                _buildBar(0.8, 'Apr', isPrimary: true),
                _buildBar(0.65, 'May'),
                _buildBar(0.9, 'Jun'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double heightFactor, String label, {bool isPrimary = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 120 * heightFactor,
          decoration: BoxDecoration(
            color: isPrimary ? AppColors.primaryContainer : AppColors.secondaryFixedDim,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
      ],
    );
  }

  Widget _buildKeyMetrics() {
    return Column(
      children: [
        _buildMetricCard('Total Revenue', '\$124,500', Icons.payments, AppColors.primary, '+12.5% from last month'),
        const SizedBox(height: 16),
        _buildMetricCard('Avg. Quality Grade', 'A-', Icons.star, AppColors.tertiary, 'Top 15% of region'),
        const SizedBox(height: 16),
        _buildMetricCard('Market Demand Index', '94/100', Icons.moving, AppColors.primary, 'High Demand'),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color iconColor, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 8),
              Text(title, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1.2)),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: AppTypography.displaySmall.copyWith(color: AppColors.onSurface, fontSize: 36)),
          const SizedBox(height: 8),
          Text(subtitle, style: AppTypography.labelMedium.copyWith(color: iconColor)),
        ],
      ),
    );
  }

  Widget _buildCropPerformance() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Crop Performance', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
              Text('View All', style: AppTypography.labelMedium.copyWith(color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 16),
          _buildCropItem('Tomatoes', 'Premium Grade', '\$45,200', '+8.2%', true),
          _buildCropItem('Spinach', 'Organic', '\$28,900', '+3.1%', true),
          _buildCropItem('Garlic', 'Standard', '\$15,400', '-1.4%', false),
        ],
      ),
    );
  }

  Widget _buildCropItem(String name, String type, String value, String change, bool isPositive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.eco, color: AppColors.onSecondaryContainer),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                  Text(type, style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(value, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                Text(change, style: AppTypography.labelMedium.copyWith(color: isPositive ? AppColors.primary : AppColors.error)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceTrends() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price Trends', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
              Text('Current Market', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 24),
          _buildTrendItem('Tomatoes (per kg)', '\$3.20', AppColors.primary),
          const SizedBox(height: 16),
          _buildTrendItem('Spinach (per bunch)', '\$1.85', AppColors.error),
        ],
      ),
    );
  }

  Widget _buildTrendItem(String label, String price, Color color) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurface)),
            Text(price, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurface)),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [color.withOpacity(0.2), Colors.transparent],
            ),
          ),
          child: CustomPaint(
            painter: SparklinePainter(color: color),
            size: const Size(double.infinity, 48),
          ),
        ),
      ],
    );
  }
}

class SparklinePainter extends CustomPainter {
  final Color color;
  SparklinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(0, size.height * 0.75);
    path.lineTo(size.width * 0.2, size.height * 0.6);
    path.lineTo(size.width * 0.4, size.height * 0.8);
    path.lineTo(size.width * 0.6, size.height * 0.4);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
