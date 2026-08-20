import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../app/theme/app_colors.dart';

class BulkSearchScreen extends ConsumerWidget {
  const BulkSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(dealerProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bulk Marketplace'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search crops, quantities, locations...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: AsyncValueWidget(
        value: productsAsync,
        data: (products) {
          if (products.isEmpty) {
            return const Center(child: Text('No bulk listings available right now.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.title, style: Theme.of(context).textTheme.titleLarge),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text('Bulk', style: TextStyle(color: AppColors.onPrimaryContainer)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Farmer: ${product.farmerName}'),
                      Text('Location: ${product.locationName}'),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${product.availableQuantity} ${product.unit} Available',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₹${product.pricePerUnit}/${product.unit}',
                            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            context.go('/dealer/search/negotiate/${product.productId}/${product.farmerId}');
                          },
                          child: const Text('Make an Offer'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
