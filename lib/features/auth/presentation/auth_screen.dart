import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'providers/auth_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onSendOtp() {
    FocusScope.of(context).unfocus();
    final authNotifier = ref.read(authNotifierProvider.notifier);
    authNotifier.sendOtp(
      _phoneController.text.trim(),
      onCodeSent: () => context.go('/otp'),
      onAutoVerified: () => context.go('/splash'),
    );
  }

  void _onGoogleSignIn() {
    FocusScope.of(context).unfocus();
    final authNotifier = ref.read(authNotifierProvider.notifier);
    authNotifier.signInWithGoogle(
      onSuccess: () => context.go('/splash'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.agriculture, size: 48, color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 48),
                Text('Welcome back', style: AppTypography.displayLarge.copyWith(color: AppColors.onSurface)),
                const SizedBox(height: 8),
                Text('Enter your mobile number to log in or create an account.', style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant)),
                
                if (authState.error != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    authState.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],

                const SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.outlineVariant),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: const BoxDecoration(
                          border: Border(right: BorderSide(color: AppColors.outlineVariant)),
                        ),
                        child: Text('+91', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface),
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: AppTypography.titleMedium.copyWith(color: AppColors.onSurfaceVariant.withOpacity(0.5)),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          onChanged: (val) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                
                // Google Sign-In Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton.icon(
                    onPressed: authState.isLoading ? null : _onGoogleSignIn,
                    icon: const Icon(Icons.g_mobiledata, size: 32, color: Colors.red),
                    label: Text('Continue with Google', style: AppTypography.labelLarge.copyWith(color: AppColors.onSurface, fontSize: 16)),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      side: const BorderSide(color: AppColors.outlineVariant),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Send OTP Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: (_phoneController.text.length >= 10 && !authState.isLoading) 
                        ? _onSendOtp 
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (_phoneController.text.length >= 10 && !authState.isLoading) 
                          ? AppColors.primary 
                          : AppColors.outline.withOpacity(0.3),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      elevation: (_phoneController.text.length >= 10 && !authState.isLoading) ? 2 : 0,
                    ),
                    child: authState.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text('Send OTP', style: AppTypography.labelLarge.copyWith(color: Colors.white, fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
