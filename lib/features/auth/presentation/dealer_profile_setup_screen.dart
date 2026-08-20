import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DealerProfileSetupScreen extends StatelessWidget {
  const DealerProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setup Business Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/splash'),
          child: const Text('Complete Setup'),
        ),
      ),
    );
  }
}
