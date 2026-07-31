import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: kDebugMode 
            ? const Duration(minutes: 5) 
            : const Duration(hours: 1),
      ));

      // Set default values
      await _remoteConfig.setDefaults(const {
        "maintenance_mode": false,
        "min_app_version": "1.0.0",
      });

      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint('Failed to initialize Remote Config: $e');
    }
  }

  bool get isMaintenanceMode => _remoteConfig.getBool("maintenance_mode");
  
  String get minAppVersion => _remoteConfig.getString("min_app_version");
}
