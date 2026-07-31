import 'dart:io';

void main() {
  final libDir = Directory('lib');
  if (!libDir.existsSync()) {
    print('Run this from the project root');
    return;
  }

  // 1. Create app/ structure
  Directory('lib/app').createSync();
  Directory('lib/app/localization').createSync();

  // 2. Move core/router -> app/router
  final routerDir = Directory('lib/core/router');
  if (routerDir.existsSync()) {
    routerDir.renameSync('lib/app/router');
    print('Moved router to app/router');
  }

  // 3. Move core/theme -> app/theme
  final themeDir = Directory('lib/core/theme');
  if (themeDir.existsSync()) {
    themeDir.renameSync('lib/app/theme');
    print('Moved theme to app/theme');
  }

  // 4. Create missing core/ structure
  final coreDirs = ['constants', 'network', 'storage', 'services', 'utils', 'widgets'];
  for (final dir in coreDirs) {
    Directory('lib/core/$dir').createSync(recursive: true);
  }
  print('Created core directories');

  // 5. Create missing features/ structure
  final featureDirs = [
    'auth', 'onboarding', 'marketplace', 'products', 'orders', 
    'cart', 'payments', 'wallet', 'logistics', 'profile', 
    'notifications', 'chat', 'admin'
  ];
  for (final dir in featureDirs) {
    Directory('lib/features/$dir').createSync(recursive: true);
  }
  print('Created feature directories');

  // 6. Create app.dart (placeholder)
  final appDart = File('lib/app/app.dart');
  if (!appDart.existsSync()) {
    appDart.writeAsStringSync('''import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class FarmBridgeApp extends ConsumerWidget {
  const FarmBridgeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'FarmBridge',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
''');
  }

  // 7. Update main.dart
  final mainDart = File('lib/main.dart');
  if (mainDart.existsSync()) {
    mainDart.writeAsStringSync('''import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';

void main() {
  runApp(const ProviderScope(child: FarmBridgeApp()));
}
''');
  }

  // 8. Global import replacement
  int updatedFiles = 0;
  final dartFiles = libDir.listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.dart'));
  
  for (final file in dartFiles) {
    String content = file.readAsStringSync();
    bool changed = false;

    // Replace relative paths pointing to core/theme and core/router
    if (content.contains('/core/theme/')) {
      content = content.replaceAll('/core/theme/', '/app/theme/');
      changed = true;
    }
    if (content.contains('/core/router/')) {
      content = content.replaceAll('/core/router/', '/app/router/');
      changed = true;
    }

    if (changed) {
      file.writeAsStringSync(content);
      updatedFiles++;
    }
  }

  print('Updated imports in $updatedFiles files.');
  print('Refactoring Complete!');
}
