import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'providers/admin_providers.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/providers/providers.dart';

class AdminOrdersScreen extends ConsumerStatefulWidget {
  const AdminOrdersScreen({super.key});

  @override
  ConsumerState<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends ConsumerState<AdminOrdersScreen> {
  String _searchQuery = '';
  
  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(adminAllOrdersProvider);

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
                Text('Order Management', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search order ID or buyer...',
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
                child: ordersAsync.when(
                  data: (orders) {
                    final filtered = orders.where((o) {
                      return o.orderId.toLowerCase().contains(_searchQuery) ||
                             o.buyerName.toLowerCase().contains(_searchQuery) ||
                             o.farmerName.toLowerCase().contains(_searchQuery);
                    }).toList();
                    
                    if (filtered.isEmpty) {
                      return const Center(child: Text('No orders found.'));
                    }
                    
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          headingTextStyle: AppTypography.titleSmall.copyWith(fontWeight: FontWeight.bold),
                          dataRowMinHeight: 60,
                          dataRowMaxHeight: 60,
                          columns: const [
                            DataColumn(label: Text('Order ID')),
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Buyer')),
                            DataColumn(label: Text('Farmer')),
                            DataColumn(label: Text('Total')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: filtered.map((o) {
                            return DataRow(
                              cells: [
                                DataCell(Text(o.orderId.substring(0, 8).toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold))),
                                DataCell(Text(o.placedAt != null ? DateFormat('MMM dd, hh:mm a').format(o.placedAt!) : 'N/A')),
                                DataCell(Text(o.buyerName)),
                                DataCell(Text(o.farmerName)),
                                DataCell(Text('₹${o.totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold))),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: _getStatusColor(o.status).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      o.status.toUpperCase(), 
                                      style: TextStyle(color: _getStatusColor(o.status), fontSize: 12, fontWeight: FontWeight.bold)
                                    ),
                                  )
                                ),
                                DataCell(
                                  PopupMenuButton<String>(
                                    onSelected: (action) async {
                                      final firestore = ref.read(firestoreRepositoryProvider);
                                      try {
                                        if (action == 'cancel') {
                                          await firestore.updateDocument(
                                            collection: FirestoreCollections.orders,
                                            documentId: o.orderId,
                                            data: {'status': 'cancelled'},
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Cancelled: ${o.orderId}')));
                                        } else if (action == 'update_status') {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Update Order Status'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: ['placed', 'confirmed', 'packed', 'in_transit', 'delivered', 'cancelled'].map((status) {
                                                  return ListTile(
                                                    title: Text(status.toUpperCase()),
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      await firestore.updateDocument(
                                                        collection: FirestoreCollections.orders,
                                                        documentId: o.orderId,
                                                        data: {'status': status},
                                                      );
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status updated to $status')));
                                                    },
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          );
                                        } else if (action == 'assign') {
                                          // Fetch logistics users
                                          final logisticsUsers = await firestore.firestore.collection(FirestoreCollections.users).where('role', isEqualTo: 'logistics').get();
                                          if (context.mounted) {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text('Assign Logistics Partner'),
                                                content: SizedBox(
                                                  width: 300,
                                                  height: 300,
                                                  child: ListView.builder(
                                                    itemCount: logisticsUsers.docs.length,
                                                    itemBuilder: (context, index) {
                                                      final logistics = logisticsUsers.docs[index].data();
                                                      return ListTile(
                                                        leading: const Icon(Icons.local_shipping),
                                                        title: Text(logistics['display_name'] ?? 'Unknown Partner'),
                                                        subtitle: Text(logistics['phone'] ?? ''),
                                                        onTap: () async {
                                                          Navigator.pop(context);
                                                          await firestore.updateDocument(
                                                            collection: FirestoreCollections.orders,
                                                            documentId: o.orderId,
                                                            data: {
                                                              'delivery_partner_id': logisticsUsers.docs[index].id,
                                                              'status': 'confirmed' // move to confirmed when assigned
                                                            },
                                                          );
                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Assigned to ${logistics['display_name']}')));
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(value: 'update_status', child: Text('Update Status')),
                                      const PopupMenuItem(value: 'assign', child: Text('Assign Delivery')),
                                      if (o.status != 'cancelled') const PopupMenuItem(value: 'cancel', child: Text('Cancel Order', style: TextStyle(color: Colors.red))),
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
                  error: (err, _) => Center(child: Text('Error loading orders: $err')),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
  
  Color _getStatusColor(String status) {
    switch (status) {
      case 'placed': return Colors.blue;
      case 'confirmed': return Colors.orange;
      case 'packed': return Colors.purple;
      case 'in_transit': return Colors.deepPurple;
      case 'delivered': return Colors.green;
      case 'cancelled': return Colors.red;
      default: return Colors.grey;
    }
  }
}
