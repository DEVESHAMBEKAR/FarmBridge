import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class AdminDisputesScreen extends StatelessWidget {
  const AdminDisputesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Active Disputes'), backgroundColor: AppColors.surface),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.gavel, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text('No active disputes at the moment.', style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
