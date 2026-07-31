import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/models/user_model.dart';
import 'providers/admin_farmers_provider.dart';

class AdminFarmersScreen extends ConsumerStatefulWidget {
  const AdminFarmersScreen({super.key});

  @override
  ConsumerState<AdminFarmersScreen> createState() => _AdminFarmersScreenState();
}

class _AdminFarmersScreenState extends ConsumerState<AdminFarmersScreen> {
  Future<void> _verifyFarmer(String userId, String farmName) async {
    // We don't read the provider as a stream here, just call the future to update
    final success = await ref.read(farmerVerificationProvider(userId).future);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? '$farmName has been verified!' : 'Failed to verify farmer'),
          backgroundColor: success ? AppColors.primary : AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pendingFarmersAsync = ref.watch(pendingFarmersProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Pending Approvals', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: pendingFarmersAsync.when(
        data: (farmers) {
          if (farmers.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified, size: 80, color: AppColors.primary.withOpacity(0.5)),
                  const SizedBox(height: 16),
                  Text(
                    'All caught up!',
                    style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No farmers waiting for verification.',
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: farmers.length,
            itemBuilder: (context, index) {
              final farmer = farmers[index];
              return _buildFarmerVerificationCard(context, farmer);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildFarmerVerificationCard(BuildContext context, UserModel user) {
    final profile = user.farmerProfile;
    final farmName = profile?.farmName ?? user.displayName;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryContainer,
                  radius: 24,
                  child: Text(
                    farmName.isNotEmpty ? farmName[0].toUpperCase() : 'F',
                    style: const TextStyle(color: AppColors.onPrimaryContainer, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(farmName, style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
                      if (user.phone != null)
                        Text(user.phone!, style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.errorContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Pending',
                    style: AppTypography.labelSmall.copyWith(color: AppColors.onErrorContainer),
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            if (profile != null) ...[
              _buildInfoRow(Icons.location_on, 'Address', profile.farmAddress),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.landscape, 'Size', '${profile.farmSizeAcres} Acres'),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.eco, 'Crops', profile.cropsGrown.join(', ')),
              const SizedBox(height: 8),
              _buildInfoRow(
                Icons.verified_user, 
                'Organic', 
                profile.organicCertified ? 'Yes - Claimed' : 'No',
              ),
            ],
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Logic for rejecting or contacting could go here
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Reject'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _verifyFarmer(user.uid, farmName),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Approve & Verify'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.onSurfaceVariant),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTypography.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
              Text(
                value.isEmpty ? 'Not Provided' : value, 
                style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurface),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
