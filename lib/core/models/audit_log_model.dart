import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'audit_log_model.freezed.dart';
part 'audit_log_model.g.dart';

@freezed
class AuditLogModel with _$AuditLogModel {
  const factory AuditLogModel({
    @JsonKey(name: 'log_id') required String logId,
    @JsonKey(name: 'admin_id') required String adminId,
    required String action,
    @JsonKey(name: 'entity_type') required String entityType,
    @JsonKey(name: 'entity_id') required String entityId,
    @JsonKey(name: 'old_value') String? oldValue,
    @JsonKey(name: 'new_value') String? newValue,
    String? reason,
    @TimestampConverter() DateTime? timestamp,
  }) = _AuditLogModel;

  factory AuditLogModel.fromJson(Map<String, dynamic> json) => _$AuditLogModelFromJson(json);
}
