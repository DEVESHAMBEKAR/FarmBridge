import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'providers/admin_providers.dart';
import '../../../../core/models/user_model.dart';

class AdminLogisticsScreen extends ConsumerStatefulWidget {
  const AdminLogisticsScreen({super.key});

  @override
  ConsumerState<AdminLogisticsScreen> createState() => _AdminLogisticsScreenState();
}

class _AdminLogisticsScreenState extends ConsumerState<AdminLogisticsScreen> {
  String _searchQuery = '';
  
  @override
  Widget build(BuildContext context) {
    final logisticsAsync = ref.watch(adminLogisticsListProvider);

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
                Text('Logistics Fleet', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by driver name or vehicle...',
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
                child: logisticsAsync.when(
                  data: (drivers) {
                    final filteredDrivers = drivers.where((u) {
                      final nameMatch = u.displayName.toLowerCase().contains(_searchQuery);
                      final vehicleMatch = (u.logisticsProfile?.vehicleNumber ?? '').toLowerCase().contains(_searchQuery);
                      return nameMatch || vehicleMatch;
                    }).toList();
                    
                    if (filteredDrivers.isEmpty) {
                      return const Center(child: Text('No logistics partners found.'));
                    }
                    
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          headingTextStyle: AppTypography.titleSmall.copyWith(fontWeight: FontWeight.bold),
                          dataRowMinHeight: 60,
                          dataRowMaxHeight: 60,
                          columns: const [
                            DataColumn(label: Text('Driver Name')),
                            DataColumn(label: Text('Vehicle Type')),
                            DataColumn(label: Text('Vehicle No.')),
                            DataColumn(label: Text('License No.')),
                            DataColumn(label: Text('Availability')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: filteredDrivers.map((user) {
                            final profile = user.logisticsProfile;
                            return DataRow(
                              cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.primaryContainer,
                                        child: Text(user.displayName.isNotEmpty ? user.displayName[0].toUpperCase() : '?', style: const TextStyle(color: AppColors.primary)),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(user.displayName.isNotEmpty ? user.displayName : 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ),
                                DataCell(Text(profile?.vehicleType ?? 'N/A')),
                                DataCell(Text(profile?.vehicleNumber ?? 'N/A')),
                                DataCell(Text(profile?.licenseNumber ?? 'N/A')),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: profile?.isAvailable == true ? AppColors.primary.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      profile?.isAvailable == true ? 'ONLINE' : 'OFFLINE', 
                                      style: TextStyle(color: profile?.isAvailable == true ? AppColors.primary : Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)
                                    ),
                                  )
                                ),
                                DataCell(
                                  PopupMenuButton<String>(
                                    onSelected: (action) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$action: ${user.displayName}')));
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(value: 'verify', child: Text('Verify Documents')),
                                      const PopupMenuItem(value: 'suspend', child: Text('Suspend Driver')),
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
                  error: (err, _) => Center(child: Text('Error loading logistics: $err')),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}