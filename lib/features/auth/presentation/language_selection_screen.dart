import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = ['English', 'हिंदी (Hindi)', 'मराठी (Marathi)', 'ગુજરાતી (Gujarati)'];
    
    return Scaffold(
      appBar: AppBar(title: const Text('Select Language'), backgroundColor: AppColors.surface),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.go('/auth');
            },
          );
        },
      ),
    );
  }
}
