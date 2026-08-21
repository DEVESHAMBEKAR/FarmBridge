import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'upi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment'), backgroundColor: AppColors.surface),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Select Payment Method', style: AppTypography.titleLarge),
          const SizedBox(height: 16),
          RadioListTile<String>(
            title: const Text('UPI (Google Pay, PhonePe)'),
            value: 'upi',
            groupValue: _selectedMethod,
            onChanged: (val) => setState(() => _selectedMethod = val!),
          ),
          RadioListTile<String>(
            title: const Text('Credit / Debit Card'),
            value: 'card',
            groupValue: _selectedMethod,
            onChanged: (val) => setState(() => _selectedMethod = val!),
          ),
          RadioListTile<String>(
            title: const Text('Cash on Delivery'),
            value: 'cod',
            groupValue: _selectedMethod,
            onChanged: (val) => setState(() => _selectedMethod = val!),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment Successful!')));
              context.go('/buyer/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Pay Now'),
          )
        ],
      ),
    );
  }
}
