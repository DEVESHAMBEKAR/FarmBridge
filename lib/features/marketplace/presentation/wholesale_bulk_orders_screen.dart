import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class WholesaleBulkOrdersScreen extends StatelessWidget {
  const WholesaleBulkOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Wholesale Bulk Orders', style: AppTypography.titleLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list, color: AppColors.primary), onPressed: () {}),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Manage active RFQs and large-scale distribution contracts.', style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
                  const SizedBox(height: 24),
                  _buildFilterPills(),
                  const SizedBox(height: 24),
                  _buildPendingQuoteCard(),
                  const SizedBox(height: 16),
                  _buildNegotiatingCard(),
                  const SizedBox(height: 16),
                  _buildContractSignedCard(),
                  const SizedBox(height: 16),
                  _buildInFulfillmentCard(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPills() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildPill('All Active', isSelected: true),
          const SizedBox(width: 8),
          _buildPill('Pending Quote (12)'),
          const SizedBox(width: 8),
          _buildPill('Negotiating (5)'),
          const SizedBox(width: 8),
          _buildPill('Contract Signed (8)'),
          const SizedBox(width: 8),
          _buildPill('In Fulfillment (3)'),
        ],
      ),
    );
  }

  Widget _buildPill(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.secondaryContainer : AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isSelected ? AppColors.secondaryContainer : AppColors.outlineVariant),
      ),
      child: Text(
        label,
        style: AppTypography.labelMedium.copyWith(
          color: isSelected ? AppColors.onSecondaryContainer : AppColors.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildPendingQuoteCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceContainerHighest),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.errorContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.priority_high, size: 16, color: AppColors.onErrorContainer),
                    const SizedBox(width: 4),
                    Text('High Urgency', style: AppTypography.labelMedium.copyWith(color: AppColors.onErrorContainer)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.outlineVariant),
                  ),
                  child: Text('Pending Quote', style: AppTypography.labelSmall.copyWith(color: AppColors.onSurface)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('RFQ-2023-089', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                const SizedBox(height: 4),
                Text('Premium Hass Avocados', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
                Text('Global Fresh Distributors Ltd.', style: AppTypography.bodyMedium.copyWith(color: AppColors.tertiary)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.surfaceVariant),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Volume', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                            const SizedBox(height: 4),
                            Text('50 Tons', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.surfaceVariant),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Target Price', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                            const SizedBox(height: 4),
                            Text('\$2,400 / ton', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text('Delivery Window: Oct 15 - Oct 30', style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.inventory, size: 16, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text('Specs: Grade A, Caliber 40-50, Export Quality', style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.outlineVariant),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Decline'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Quick Quote'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNegotiatingCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceContainerHighest),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.tertiaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Volume Match', style: AppTypography.labelMedium.copyWith(color: AppColors.onTertiaryContainer)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.outlineVariant),
                  ),
                  child: Text('Negotiating', style: AppTypography.labelSmall.copyWith(color: AppColors.onSurface)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('RFQ-2023-085', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                const SizedBox(height: 4),
                Text('Organic Quinoa', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
                Text('HealthyHarvest Co.', style: AppTypography.bodyMedium.copyWith(color: AppColors.tertiary)),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.surfaceVariant),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Requested', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                          const SizedBox(height: 4),
                          Text('120 Tons', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Our Offer', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                          const SizedBox(height: 4),
                          Text('\$1,850/t', style: AppTypography.titleMedium.copyWith(color: AppColors.primary)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Buyer requested a 5% discount for early payment. Awaiting counter-approval.',
                  style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.surfaceTint,
                      foregroundColor: AppColors.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('View Thread'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContractSignedCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceContainerHighest),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 8,
            child: Container(color: AppColors.primaryFixedDim),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text('Contract Signed', style: AppTypography.labelSmall.copyWith(color: AppColors.onPrimaryContainer)),
                    ),
                    const SizedBox(width: 8),
                    Text('ORD-9921', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Arabica Coffee Beans', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
                Text('Roasters Collective', style: AppTypography.bodyMedium.copyWith(color: AppColors.tertiary)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Agreed Volume', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                        const SizedBox(height: 4),
                        Text('80 Tons', style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurface)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Value', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                        const SizedBox(height: 4),
                        Text('\$280,000', style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurface)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Starts', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                        const SizedBox(height: 4),
                        Text('Nov 01', style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurface)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.description),
                    label: const Text('View Contract'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.outlineVariant),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInFulfillmentCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceContainerHighest),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const LinearProgressIndicator(
            value: 0.6,
            backgroundColor: AppColors.surfaceContainerHighest,
            color: AppColors.secondary,
            minHeight: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text('In Fulfillment', style: AppTypography.labelSmall.copyWith(color: AppColors.onSecondaryContainer)),
                    ),
                    const SizedBox(width: 8),
                    Text('ORD-9850', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Soybeans (Non-GMO)', style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
                Text('AgriCorp National', style: AppTypography.bodyMedium.copyWith(color: AppColors.tertiary)),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Progress', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                          const SizedBox(height: 4),
                          Text('600 / 1000 Tons', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Next Shipment', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                          const SizedBox(height: 4),
                          Text('Tomorrow', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.outlineVariant),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Logistics'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: AppColors.onSecondary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Update Status'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
