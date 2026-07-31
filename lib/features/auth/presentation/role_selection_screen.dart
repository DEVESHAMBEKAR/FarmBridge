import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/providers/providers.dart';
import '../../../core/models/user_model.dart';
import '../../../core/constants/firestore_collections.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class RoleSelectionScreen extends ConsumerStatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  ConsumerState<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends ConsumerState<RoleSelectionScreen> {
  String? _selectedRole;

  void _selectRole(String role) {
    setState(() {
      _selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'FarmBridge',
          style: AppTypography.headlineLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: AppColors.onSurfaceVariant),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text('Who are you?', style: AppTypography.displayLarge.copyWith(color: AppColors.onBackground)),
                  const SizedBox(height: 8),
                  Text(
                    'Choose your role to customize your experience on the FarmBridge network.',
                    style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            _buildRoleGrid(),
            const SizedBox(height: 48),
            _buildContinueButton(context),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant),
                  children: [
                    TextSpan(
                      text: 'Log in',
                      style: AppTypography.labelMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            _buildBentoHint(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _RoleCard(
                title: 'Farmer',
                description: 'List your crops, manage harvests, and connect directly with local buyers and logistics providers.',
                icon: Icons.agriculture,
                iconBgColor: AppColors.primaryContainer.withOpacity(0.3),
                iconColor: AppColors.primary,
                isSelected: _selectedRole == 'Farmer',
                onTap: () => _selectRole('Farmer'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _RoleCard(
                title: 'Buyer/Consumer',
                description: 'Source fresh produce directly from local farms. Perfect for individual consumers or small households.',
                icon: Icons.shopping_bag,
                iconBgColor: AppColors.secondaryContainer.withOpacity(0.6),
                iconColor: AppColors.onSecondaryContainer,
                isSelected: _selectedRole == 'Buyer',
                onTap: () => _selectRole('Buyer'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _RoleCard(
                title: 'Wholesaler',
                description: 'Procure bulk quantities for retail or culinary operations with integrated inventory management tools.',
                icon: Icons.storefront,
                iconBgColor: AppColors.tertiaryContainer.withOpacity(0.3),
                iconColor: AppColors.tertiary,
                isSelected: _selectedRole == 'Wholesaler',
                onTap: () => _selectRole('Wholesaler'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _RoleCard(
                title: 'Logistics',
                description: 'Optimize your fleet operations. Manage delivery routes and transport fresh goods across the bridge.',
                icon: Icons.local_shipping,
                iconBgColor: AppColors.surfaceContainerHighest,
                iconColor: AppColors.onSurface,
                isSelected: _selectedRole == 'Logistics',
                onTap: () => _selectRole('Logistics'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _isLoading = false;

  Future<void> _submitRole() async {
    if (_selectedRole == null) return;
    
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      context.go('/auth');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final roleStr = _selectedRole!.toLowerCase();
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      
      // Check if user already exists (fallback update)
      final docSnap = await firestoreRepo.getDocument(collection: FirestoreCollections.users, documentId: user.uid);
      if (docSnap.exists) {
        await firestoreRepo.updateDocument(
          collection: FirestoreCollections.users, 
          documentId: user.uid, 
          data: {'role': roleStr},
        );
      } else {
        // Create new user profile
        final newUser = UserModel(
          uid: user.uid,
          phone: user.phoneNumber,
          role: roleStr,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await firestoreRepo.setDocument(
          collection: FirestoreCollections.users,
          documentId: user.uid,
          data: newUser.toJson(),
        );
      }

      if (!mounted) return;

      // Force Riverpod to refresh the user profile stream now that it's created
      ref.invalidate(userProfileStreamProvider);

      if (roleStr == 'farmer') {
        // Since they just selected the role, profile is not complete.
        context.go('/farmer/profile-setup');
      } else if (roleStr == 'logistics') {
        context.go('/delivery/profile-setup');
      } else {
        context.go('/buyer/profile-setup');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildContinueButton(BuildContext context) {
    final bool isEnabled = _selectedRole != null && !_isLoading;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isEnabled ? _submitRole : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColors.primary : AppColors.outline.withOpacity(0.3),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: isEnabled ? 2 : 0,
        ),
        child: _isLoading 
            ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
            : Text('Continue', style: AppTypography.labelLarge.copyWith(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  Widget _buildBentoHint() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 160,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.secondaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Connecting rural heartlands', style: AppTypography.headlineMedium.copyWith(color: AppColors.onSecondaryContainer)),
                  const SizedBox(height: 8),
                  Text('Join over 10,000 active participants in the modern agricultural revolution.', style: AppTypography.bodyMedium.copyWith(color: AppColors.onSecondaryContainer)),
                ],
              ),
              Positioned(
                bottom: -20,
                right: -20,
                child: Icon(Icons.diversity_3, size: 120, color: Colors.black.withOpacity(0.05)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh,
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuB3pwax8GQn9yhiMCcOUv6pK-pUuKlu6SJIGDabHIYaqdJ9XwJ5zNdcWryejok4MTlzqlBK0vyYrMhxB2XC1WMRCDC-fai19nqnzJkIQbS2M2lmgccUPCeoSKOozettTW-JwQy9jZg8Omp8KVEiX2PfGT-TQ9KHq0Yvlh4BBKp8OgMYepZrh4cMq3zbEfaYvVrCjiv0-vB1HncjWlLWKnkgg16ZKaS_EZTl3MBeOunCx4-W4bn246LuV8h9mpyGXKROiRJh9Y6b9HU'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text('Trusted by Experts', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryContainer : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (!isSelected) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(12)),
                  child: Icon(icon, color: iconColor, size: 28),
                ),
                if (isSelected) const Icon(Icons.check_circle, color: AppColors.primary),
              ],
            ),
            const SizedBox(height: 16),
            Text(title, style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface)),
            const SizedBox(height: 8),
            Text(description, style: AppTypography.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
