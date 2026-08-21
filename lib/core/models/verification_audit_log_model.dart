import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'verification_audit_log_model.freezed.dart';
part 'verification_audit_log_model.g.dart';

@freezed
class VerificationAuditLogModel with _$VerificationAuditLogModel {
  const factory VerificationAuditLogModel({
    @JsonKey(name: 'audit_id') required String auditId,
    @JsonKey(name: 'admin_id') required String adminId,
    @JsonKey(name: 'entity_id') required String entityId,
    @JsonKey(name: 'entity_type') required String entityType,
    required String action, // e.g., DOCUMENT_VERIFIED, DOCUMENT_REJECTED, ENTITY_APPROVED
    @JsonKey(name: 'document_id') String? documentId,
    @JsonKey(name: 'previous_status') String? previousStatus,
    @JsonKey(name: 'new_status') String? newStatus,
    String? reason,
    String? comment,
    @TimestampConverter() required DateTime timestamp,
  }) = _VerificationAuditLogModel;

  factory VerificationAuditLogModel.fromJson(Map<String, dynamic> json) => _$VerificationAuditLogModelFromJson(json);
}
