import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';

class OnboardingSuccessScreen extends StatelessWidget {
  const OnboardingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: AppColors.primary),
            const SizedBox(height: 24),
            const Text('Welcome to FarmBridge!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Your profile is ready.'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go('/splash'),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
