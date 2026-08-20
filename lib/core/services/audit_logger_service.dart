import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/firestore_collections.dart';
import '../providers/providers.dart';

class AuditLoggerService {
  final FirebaseFirestore _firestore;
  final Ref _ref;

  AuditLoggerService(this._firestore, this._ref);

  Future<void> logAction({
    required String action,
    required String entity,
    required String entityId,
    String? oldStatus,
    String? newStatus,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final user = _ref.read(authStateProvider).value;
      if (user == null) return; // Silent return if not authenticated

      await _firestore.collection(FirestoreCollections.auditLogs).add({
        'admin_id': user.uid,
        'action': action,
        'entity': entity,
        'entity_id': entityId,
        'timestamp': FieldValue.serverTimestamp(),
        if (oldStatus != null) 'old_status': oldStatus,
        if (newStatus != null) 'new_status': newStatus,
        if (additionalData != null) 'details': additionalData,
      });
    } catch (e) {
      // Intentionally swallow errors so audit logging failure doesn't crash the main transaction
      print('Audit Logger Error: $e');
    }
  }
}

final auditLoggerServiceProvider = Provider<AuditLoggerService>((ref) {
  return AuditLoggerService(FirebaseFirestore.instance, ref);
});
