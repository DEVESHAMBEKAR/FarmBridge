// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_audit_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationAuditLogModelImpl _$$VerificationAuditLogModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationAuditLogModelImpl(
      auditId: json['audit_id'] as String,
      adminId: json['admin_id'] as String,
      entityId: json['entity_id'] as String,
      entityType: json['entity_type'] as String,
      action: json['action'] as String,
      documentId: json['document_id'] as String?,
      previousStatus: json['previous_status'] as String?,
      newStatus: json['new_status'] as String?,
      reason: json['reason'] as String?,
      comment: json['comment'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$VerificationAuditLogModelImplToJson(
        _$VerificationAuditLogModelImpl instance) =>
    <String, dynamic>{
      'audit_id': instance.auditId,
      'admin_id': instance.adminId,
      'entity_id': instance.entityId,
      'entity_type': instance.entityType,
      'action': instance.action,
      'document_id': instance.documentId,
      'previous_status': instance.previousStatus,
      'new_status': instance.newStatus,
      'reason': instance.reason,
      'comment': instance.comment,
      'timestamp': instance.timestamp.toIso8601String(),
    };
