import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class AgritechPremiumScreen extends StatelessWidget {
  const AgritechPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FarmBridge Premium'), backgroundColor: AppColors.surface),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.workspace_premium, size: 100, color: Colors.amber),
            const SizedBox(height: 24),
            const Text('Upgrade to Premium', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Zero commission, advanced weather, and priority support.'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
              child: const Text('Get Premium - ₹999/year'),
            )
          ],
        ),
      ),
    );
  }
}
