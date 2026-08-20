import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class AdminSettingsScreen extends ConsumerStatefulWidget {
  const AdminSettingsScreen({super.key});

  @override
  ConsumerState<AdminSettingsScreen> createState() => _AdminSettingsScreenState();
}

class _AdminSettingsScreenState extends ConsumerState<AdminSettingsScreen> {
  bool _maintenanceMode = false;
  double _commissionRate = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Platform Settings', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Manage global configurations and feature flags', style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: 32),
            
            Expanded(
              child: ListView(
                children: [
                  _buildSectionTitle('General configuration'),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: AppColors.outlineVariant.withOpacity(0.5))),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('Platform Name'),
                            subtitle: const Text('FarmBridge Enterprise'),
                            trailing: TextButton(onPressed: () {}, child: const Text('EDIT')),
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text('Maintenance Mode'),
                            subtitle: const Text('Temporarily disable access for all non-admin users'),
                            trailing: Switch(
                              value: _maintenanceMode,
                              onChanged: (val) => setState(() => _maintenanceMode = val),
                              activeColor: AppColors.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  _buildSectionTitle('Financial Settings'),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: AppColors.outlineVariant.withOpacity(0.5))),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Platform Commission Rate (%)', style: AppTypography.bodyLarge),
                                Text('Current: ${_commissionRate.toStringAsFixed(1)}%', style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
                                Slider(
                                  value: _commissionRate,
                                  min: 0,
                                  max: 20,
                                  divisions: 40,
                                  label: _commissionRate.toStringAsFixed(1),
                                  onChanged: (val) => setState(() => _commissionRate = val),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text('Minimum Delivery Charge (₹)'),
                            subtitle: const Text('Current: ₹40.00'),
                            trailing: TextButton(onPressed: () {}, child: const Text('EDIT')),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Settings saved securely.')));
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save Changes'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 4),
      child: Text(title, style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary)),
    );
  }
}