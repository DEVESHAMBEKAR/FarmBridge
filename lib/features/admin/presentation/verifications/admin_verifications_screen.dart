import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/models/user_model.dart';
import 'providers/admin_verifications_provider.dart';

class AdminVerificationsScreen extends ConsumerStatefulWidget {
  const AdminVerificationsScreen({super.key});

  @override
  ConsumerState<AdminVerificationsScreen> createState() => _AdminVerificationsScreenState();
}

class _AdminVerificationsScreenState extends ConsumerState<AdminVerificationsScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final verificationsAsync = ref.watch(adminVerificationsListProvider);

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
                Text('Verification Center', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
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
              child: verificationsAsync.when(
                data: (usersList) {
                  final users = usersList.cast<UserModel>();
                  final filtered = users.where((u) {
                    final n = u.displayName.toLowerCase();
                    final e = (u.email ?? '').toLowerCase();
                    return n.contains(_searchQuery) || e.contains(_searchQuery);
                  }).toList();

                  if (filtered.isEmpty) {
                    return const Center(child: Text('No verification requests found.'));
                  }

                  final underReview = filtered.where((u) => u.verificationStatus == 'UNDER_REVIEW').toList();
                  final requiresCorrection = filtered.where((u) => u.verificationStatus == 'REQUIRES_CORRECTION').toList();
                  final approved = filtered.where((u) => u.verificationStatus == 'APPROVED').toList();

                  return DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        const TabBar(
                          isScrollable: true,
                          labelColor: AppColors.primary,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: 'All'),
                            Tab(text: 'Under Review'),
                            Tab(text: 'Needs Correction'),
                            Tab(text: 'Approved'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _buildList(filtered),
                              _buildList(underReview),
                              _buildList(requiresCorrection),
                              _buildList(approved),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<UserModel> users) {
    if (users.isEmpty) return const Center(child: Text('No records.'));

    return ListView.builder(
      padding: const EdgeInsets.only(top: 16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final u = users[index];
        final dateStr = u.createdAt != null ? DateFormat.yMMMd().format(u.createdAt!) : 'N/A';
        
        Color statusColor;
        switch (u.verificationStatus) {
          case 'UNDER_REVIEW':
            statusColor = Colors.orange;
            break;
          case 'APPROVED':
            statusColor = Colors.green;
            break;
          case 'REQUIRES_CORRECTION':
            statusColor = Colors.red;
            break;
          default:
            statusColor = Colors.grey;
        }

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primaryContainer,
                  child: Text(u.displayName.isNotEmpty ? u.displayName[0].toUpperCase() : '?', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(u.displayName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text('${u.role.toUpperCase()} • Joined $dateStr', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(u.verificationStatus.replaceAll('_', ' '), style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/admin/dashboard/verifications/${u.uid}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        visualDensity: VisualDensity.compact,
                      ),
                      child: const Text('Review'),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
