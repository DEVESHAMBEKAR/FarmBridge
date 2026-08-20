import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'providers/admin_providers.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/providers/providers.dart';
import 'widgets/admin_inspect_profile_dialog.dart';

class AdminFarmersScreen extends ConsumerStatefulWidget {
  const AdminFarmersScreen({super.key});

  @override
  ConsumerState<AdminFarmersScreen> createState() => _AdminFarmersScreenState();
}

class _AdminFarmersScreenState extends ConsumerState<AdminFarmersScreen> {
  String _searchQuery = '';
  
  @override
  Widget build(BuildContext context) {
    final farmersAsync = ref.watch(adminFarmersListProvider);

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
                Text('Farmer Verification', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by farm name...',
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
                child: farmersAsync.when(
                  data: (farmers) {
                    final filteredFarmers = farmers.where((u) {
                      final nameMatch = u.displayName.toLowerCase().contains(_searchQuery);
                      final farmNameMatch = (u.farmerProfile?.farmName ?? '').toLowerCase().contains(_searchQuery);
                      return nameMatch || farmNameMatch;
                    }).toList();
                    
                    if (filteredFarmers.isEmpty) {
                      return const Center(child: Text('No farmers found.'));
                    }
                    
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          headingTextStyle: AppTypography.titleSmall.copyWith(fontWeight: FontWeight.bold),
                          dataRowMinHeight: 60,
                          dataRowMaxHeight: 60,
                          columns: const [
                            DataColumn(label: Text('Farm Name')),
                            DataColumn(label: Text('Farmer Name')),
                            DataColumn(label: Text('Size (Acres)')),
                            DataColumn(label: Text('Bank Linked')),
                            DataColumn(label: Text('Verification')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: filteredFarmers.map((user) {
                            final profile = user.farmerProfile;
                            return DataRow(
                              cells: [
                                DataCell(Text(profile?.farmName ?? 'N/A', style: const TextStyle(fontWeight: FontWeight.bold))),
                                DataCell(Text(user.displayName)),
                                DataCell(Text(profile?.farmSizeAcres.toString() ?? 'N/A')),
                                DataCell(
                                  Icon(
                                    profile?.bankAccountLinked == true ? Icons.check_circle : Icons.cancel,
                                    color: profile?.bankAccountLinked == true ? AppColors.primary : AppColors.error,
                                  )
                                ),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: user.isVerified ? AppColors.primary.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      user.isVerified ? 'VERIFIED' : 'PENDING', 
                                      style: TextStyle(color: user.isVerified ? AppColors.primary : Colors.orange, fontSize: 12, fontWeight: FontWeight.bold)
                                    ),
                                  )
                                ),
                                DataCell(
                                  PopupMenuButton<String>(
                                    onSelected: (action) async {
                                      if (action == 'inspect') {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AdminInspectProfileDialog(user: user),
                                        );
                                        return;
                                      }
                                      if (action == 'verify' || action == 'suspend') {
                                        final isVerified = action == 'verify';
                                        try {
                                          await ref.read(firestoreRepositoryProvider).updateDocument(
                                            collection: FirestoreCollections.users,
                                            documentId: user.uid,
                                            data: {'is_verified': isVerified},
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Successfully ${isVerified ? "verified" : "suspended"} ${user.displayName}')),
                                          );
                                        } catch (e) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Error updating user: $e')),
                                          );
                                        }
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(value: 'inspect', child: Text('Inspect Profile')),
                                      if (!user.isVerified) const PopupMenuItem(value: 'verify', child: Text('Verify Documents')),
                                      if (user.isVerified) const PopupMenuItem(value: 'suspend', child: Text('Suspend')),
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
                  error: (err, _) => Center(child: Text('Error loading farmers: $err')),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
