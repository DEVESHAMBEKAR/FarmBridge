import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'providers/admin_providers.dart';
import '../../../../core/models/user_model.dart';

class AdminUsersScreen extends ConsumerStatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  ConsumerState<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends ConsumerState<AdminUsersScreen> {
  String _searchQuery = '';
  
  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(adminAllUsersProvider);

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
                Text('User Management', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by name or email...',
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
                child: usersAsync.when(
                  data: (users) {
                    final filteredUsers = users.where((u) {
                      final nameMatch = u.displayName.toLowerCase().contains(_searchQuery);
                      final emailMatch = (u.email ?? '').toLowerCase().contains(_searchQuery);
                      return nameMatch || emailMatch;
                    }).toList();
                    
                    if (filteredUsers.isEmpty) {
                      return const Center(child: Text('No users found.'));
                    }
                    
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          headingTextStyle: AppTypography.titleSmall.copyWith(fontWeight: FontWeight.bold),
                          dataRowMinHeight: 60,
                          dataRowMaxHeight: 60,
                          columns: const [
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Email/Phone')),
                            DataColumn(label: Text('Role')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Joined')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: filteredUsers.map((user) {
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
                                      Text(user.displayName.isNotEmpty ? user.displayName : 'Unknown', style: const TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  )
                                ),
                                DataCell(Text(user.email ?? user.phone ?? 'N/A')),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(user.role.toUpperCase(), style: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
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
                                DataCell(Text(user.createdAt != null ? DateFormat.yMMMd().format(user.createdAt!) : 'N/A')),
                                DataCell(
                                  PopupMenuButton<String>(
                                    onSelected: (action) async {
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
                                      } else if (action == 'delete') {
                                        // Deleting requires more care, usually cloud function, 
                                        // but for now we just show a message or do a soft delete.
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Delete requires Admin Cloud Function.')),
                                        );
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      if (!user.isVerified) const PopupMenuItem(value: 'verify', child: Text('Verify User')),
                                      if (user.isVerified) const PopupMenuItem(value: 'suspend', child: Text('Suspend')),
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
                  error: (err, _) => Center(child: Text('Error loading users: $err')),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
