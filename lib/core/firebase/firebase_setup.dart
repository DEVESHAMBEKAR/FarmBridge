import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import '../../firebase_options.dart';

class FirebaseSetup {
  static Future<void> initialize() async {
    try {
      // 1. Initialize Firebase Core
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // 2. Initialize App Check
      // We are temporarily disabling this for local development because it requires 
      // generating and pasting debug tokens into the Firebase Console for every device/emulator.
      // Uncomment this before pushing to production.
      /*
      await FirebaseAppCheck.instance.activate(
        androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
        appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.appAttest,
      );
      */

      // 3. Configure Crashlytics
      // Pass all uncaught "fatal" errors from the framework to Crashlytics
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };

      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      // 4. Initialize Performance Monitoring
      if (!kIsWeb) {
        FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
      }

    } catch (e, stack) {
      debugPrint('Firebase Initialization Error: $e\n$stack');
      // Graceful fallback or reporting
    }
  }
}
