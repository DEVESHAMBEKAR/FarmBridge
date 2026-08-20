// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditLogModelImpl _$$AuditLogModelImplFromJson(Map<String, dynamic> json) =>
    _$AuditLogModelImpl(
      logId: json['log_id'] as String,
      adminId: json['admin_id'] as String,
      action: json['action'] as String,
      entityType: json['entity_type'] as String,
      entityId: json['entity_id'] as String,
      oldValue: json['old_value'] as String?,
      newValue: json['new_value'] as String?,
      reason: json['reason'] as String?,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp?),
    );

Map<String, dynamic> _$$AuditLogModelImplToJson(_$AuditLogModelImpl instance) =>
    <String, dynamic>{
      'log_id': instance.logId,
      'admin_id': instance.adminId,
      'action': instance.action,
      'entity_type': instance.entityType,
      'entity_id': instance.entityId,
      'old_value': instance.oldValue,
      'new_value': instance.newValue,
      'reason': instance.reason,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
