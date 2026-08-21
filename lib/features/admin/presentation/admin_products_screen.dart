import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'providers/admin_providers.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/providers/providers.dart';

class AdminProductsScreen extends ConsumerStatefulWidget {
  const AdminProductsScreen({super.key});

  @override
  ConsumerState<AdminProductsScreen> createState() => _AdminProductsScreenState();
}

class _AdminProductsScreenState extends ConsumerState<AdminProductsScreen> {
  String _searchQuery = '';
  
  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(adminAllProductsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                Text('Product Inventory', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search product or category...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    ),
                    onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            Expanded(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppColors.outlineVariant.withOpacity(0.5)),
                ),
                child: productsAsync.when(
                  data: (products) {
                    final filtered = products.where((p) {
                      return p.title.toLowerCase().contains(_searchQuery) ||
                             p.category.toLowerCase().contains(_searchQuery);
                    }).toList();
                    
                    if (filtered.isEmpty) {
                      return const Center(child: Text('No products found.'));
                    }
                    
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          headingTextStyle: AppTypography.titleSmall.copyWith(fontWeight: FontWeight.bold),
                          dataRowMinHeight: 60,
                          dataRowMaxHeight: 60,
                          columns: const [
                            DataColumn(label: Text('Product')),
                            DataColumn(label: Text('Category')),
                            DataColumn(label: Text('Farmer')),
                            DataColumn(label: Text('Price')),
                            DataColumn(label: Text('Stock')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: filtered.map((p) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      if (p.images.isNotEmpty)
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: Image.network(p.images.first, width: 40, height: 40, fit: BoxFit.cover,
                                            errorBuilder: (_,__,___) => Container(width: 40, height: 40, color: Colors.grey[200], child: const Icon(Icons.image, size: 20)),
                                          ),
                                        )
                                      else
                                        Container(width: 40, height: 40, color: Colors.grey[200], child: const Icon(Icons.image, size: 20)),
                                      const SizedBox(width: 12),
                                      Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ),
                                DataCell(Text(p.category.toUpperCase())),
                                DataCell(Text(p.farmerName)),
                                DataCell(Text('₹${p.pricePerUnit}/${p.unit}')),
                                DataCell(Text('${p.availableQuantity} ${p.unit}')),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: p.status == ProductStatus.active ? AppColors.primary.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      p.status.toUpperCase(), 
                                      style: TextStyle(color: p.status == ProductStatus.active ? AppColors.primary : Colors.red, fontSize: 12, fontWeight: FontWeight.bold)
                                    ),
                                  )
                                ),
                                DataCell(
                                  PopupMenuButton<String>(
                                    onSelected: (action) async {
                                      final firestore = ref.read(firestoreRepositoryProvider);
                                      try {
                                        if (action == 'hide') {
                                          await firestore.updateDocument(
                                            collection: FirestoreCollections.products,
                                            documentId: p.productId,
                                            data: {'status': ProductStatus.removed},
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unlisted: ${p.title}')));
                                        } else if (action == 'unhide') {
                                          await firestore.updateDocument(
                                            collection: FirestoreCollections.products,
                                            documentId: p.productId,
                                            data: {'status': ProductStatus.active},
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Listed: ${p.title}')));
                                        } else if (action == 'feature') {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Feature functionality not implemented yet.')));
                                        } else if (action == 'delete') {
                                          await firestore.deleteDocument(
                                            collection: FirestoreCollections.products,
                                            documentId: p.productId,
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deleted: ${p.title}')));
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(value: 'feature', child: Text('Feature Product')),
                                      if (p.status == ProductStatus.active) const PopupMenuItem(value: 'hide', child: Text('Hide/Unlist')),
                                      if (p.status != ProductStatus.active) const PopupMenuItem(value: 'unhide', child: Text('Unhide/List')),
                                      const PopupMenuItem(value: 'delete', child: Text('Delete', style: TextStyle(color: Colors.red))),
                                    ],
                                  )
                                ),
                              ]
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(child: Text('Error loading products: $err')),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}