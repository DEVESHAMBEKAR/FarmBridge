import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'verification_document_model.freezed.dart';
part 'verification_document_model.g.dart';

@freezed
class VerificationDocumentModel with _$VerificationDocumentModel {
  const factory VerificationDocumentModel({
    @JsonKey(name: 'document_id') required String documentId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'entity_type') required String entityType, // farmer, logistics, dealer, etc.
    @JsonKey(name: 'document_type') required String documentType, // identity_proof, driving_license, etc.
    @JsonKey(name: 'document_name') required String documentName,
    @JsonKey(name: 'storage_path') required String storagePath,
    @JsonKey(name: 'download_url') required String downloadUrl,
    @JsonKey(name: 'document_number_masked') String? documentNumberMasked,
    @Default('SUBMITTED') String status, // SUBMITTED, UNDER_REVIEW, VERIFIED, REJECTED, EXPIRED, RESUBMISSION_REQUIRED
    @JsonKey(name: 'uploaded_at') @TimestampConverter() DateTime? uploadedAt,
    @JsonKey(name: 'reviewed_at') @TimestampConverter() DateTime? reviewedAt,
    @JsonKey(name: 'reviewed_by') String? reviewedBy, // admin uid
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'admin_comment') String? adminComment,
    @Default(1) int version,
    @JsonKey(name: 'is_required') @Default(true) bool isRequired,
  }) = _VerificationDocumentModel;

  factory VerificationDocumentModel.fromJson(Map<String, dynamic> json) => _$VerificationDocumentModelFromJson(json);
}
