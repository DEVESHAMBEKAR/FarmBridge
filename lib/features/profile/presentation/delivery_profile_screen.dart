import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';

class DeliveryProfileScreen extends StatelessWidget {
  const DeliveryProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delivery Profile'), backgroundColor: AppColors.surface),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 50, child: Icon(Icons.local_shipping, size: 50)),
          const SizedBox(height: 24),
          const ListTile(title: Text('Vehicle Type'), subtitle: Text('Mini Truck (Tata Ace)')),
          const ListTile(title: Text('Driving License'), subtitle: Text('DL-14202390XXXX')),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: const Text('Logout', style: TextStyle(color: AppColors.error)),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) context.go('/auth');
            },
          ),
        ],
      ),
    );
  }
}
