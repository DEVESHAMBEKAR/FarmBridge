import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class AdminShell extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AdminShell({
    super.key,
    required this.navigationShell,
  });

  @override
  ConsumerState<AdminShell> createState() => _AdminShellState();
}

class _AdminShellState extends ConsumerState<AdminShell> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) context.go('/auth');
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLowest,
      appBar: isDesktop ? null : AppBar(
        title: const Text('FarmBridge Admin'),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      drawer: isDesktop ? null : _buildSidebar(context),
      body: Row(
        children: [
          if (isDesktop) _buildSidebar(context),
          Expanded(
            child: widget.navigationShell,
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    final currentIndex = widget.navigationShell.currentIndex;
    
    return Container(
      width: 250,
      color: AppColors.surface,
      child: Column(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.centerLeft,
            child: Text(
              'FarmBridge Admin',
              style: AppTypography.titleLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildNavItem(0, 'Dashboard', Icons.dashboard, currentIndex),
                _buildNavItem(1, 'Users', Icons.people, currentIndex),
                _buildNavItem(2, 'Farmers', Icons.agriculture, currentIndex),
                _buildNavItem(3, 'Logistics', Icons.local_shipping, currentIndex),
                _buildNavItem(4, 'Products', Icons.inventory, currentIndex),
                _buildNavItem(5, 'Orders', Icons.shopping_cart, currentIndex),
                const Divider(),
                _buildNavItem(6, 'Audit Logs', Icons.history, currentIndex),
                _buildNavItem(7, 'Settings', Icons.settings, currentIndex),
              ],
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: Text('Logout', style: AppTypography.labelLarge.copyWith(color: AppColors.error)),
            onTap: _logout,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String title, IconData icon, int currentIndex) {
    final isSelected = currentIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant),
        title: Text(
          title,
          style: AppTypography.labelLarge.copyWith(
            color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        selectedTileColor: AppColors.primary,
        onTap: () {
          if (Scaffold.maybeOf(context)?.isDrawerOpen ?? false) {
            Navigator.of(context).pop();
          }
          _goBranch(index);
        },
      ),
    );
  }
}
