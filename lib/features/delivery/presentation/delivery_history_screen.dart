import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class DeliveryHistoryScreen extends ConsumerWidget {
  const DeliveryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery History'),
        backgroundColor: AppColors.surface,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(16),
            tileColor: AppColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: const Icon(Icons.check, color: Colors.green),
            ),
            title: Text('Completed Delivery #${900 + index}', style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.bold)),
            subtitle: const Text('Pune -> Mumbai\nDistance: 150 km'),
            trailing: Text('₹${1500 - (index * 100)}', style: AppTypography.titleMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
