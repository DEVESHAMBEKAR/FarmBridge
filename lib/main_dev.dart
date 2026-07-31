import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase here, Hive, etc.
  // Example: await Firebase.initializeApp();
  
  runApp(
    const ProviderScope(
      child: FarmBridgeApp(),
    ),
  );
}
