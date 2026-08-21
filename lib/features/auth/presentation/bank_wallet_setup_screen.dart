import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';

class BankWalletSetupScreen extends StatelessWidget {
  const BankWalletSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setup Bank Account'), backgroundColor: AppColors.surface),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const TextField(
            decoration: InputDecoration(labelText: 'Account Holder Name', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(labelText: 'Account Number', border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(labelText: 'IFSC Code', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('Save Bank Details'),
          )
        ],
      ),
    );
  }
}
