import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/providers/providers.dart';

class VerificationPendingScreen extends ConsumerWidget {
  const VerificationPendingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to user profile changes
    ref.listen(userProfileStreamProvider, (previous, next) {
      final user = next.valueOrNull;
      if (user != null && user.isVerified) {
        // If they get verified, push them to the right dashboard
        final role = user.role.toLowerCase();
        if (role == 'farmer') {
          context.go('/farmer/dashboard');
        } else if (role == 'logistics') {
          context.go('/delivery/dashboard');
        }
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => context.go('/role-selection'),
            child: const Text('Change Role'),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.tertiaryContainer.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.pending_actions,
                  size: 80,
                  color: AppColors.tertiary,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Application Under Review',
                style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Your profile is currently being reviewed by our administrators. This process typically takes 1-2 business days to ensure platform quality and security.',
                style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Waiting for approval...',
                style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
