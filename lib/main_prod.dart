import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Production specific setup (e.g. Firebase, Crashlytics)
  // await Firebase.initializeApp();
  
  runApp(
    const ProviderScope(
      child: FarmBridgeApp(),
    ),
  );
}
