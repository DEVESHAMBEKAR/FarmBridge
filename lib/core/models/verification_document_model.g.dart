// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationDocumentModelImpl _$$VerificationDocumentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationDocumentModelImpl(
      documentId: json['document_id'] as String,
      userId: json['user_id'] as String,
      entityType: json['entity_type'] as String,
      documentType: json['document_type'] as String,
      documentName: json['document_name'] as String,
      storagePath: json['storage_path'] as String,
      downloadUrl: json['download_url'] as String,
      documentNumberMasked: json['document_number_masked'] as String?,
      status: json['status'] as String? ?? 'SUBMITTED',
      uploadedAt: const TimestampConverter()
          .fromJson(json['uploaded_at'] as Timestamp?),
      reviewedAt: const TimestampConverter()
          .fromJson(json['reviewed_at'] as Timestamp?),
      reviewedBy: json['reviewed_by'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
      adminComment: json['admin_comment'] as String?,
      version: (json['version'] as num?)?.toInt() ?? 1,
      isRequired: json['is_required'] as bool? ?? true,
    );

Map<String, dynamic> _$$VerificationDocumentModelImplToJson(
        _$VerificationDocumentModelImpl instance) =>
    <String, dynamic>{
      'document_id': instance.documentId,
      'user_id': instance.userId,
      'entity_type': instance.entityType,
      'document_type': instance.documentType,
      'document_name': instance.documentName,
      'storage_path': instance.storagePath,
      'download_url': instance.downloadUrl,
      'document_number_masked': instance.documentNumberMasked,
      'status': instance.status,
      'uploaded_at': const TimestampConverter().toJson(instance.uploadedAt),
      'reviewed_at': const TimestampConverter().toJson(instance.reviewedAt),
      'reviewed_by': instance.reviewedBy,
      'rejection_reason': instance.rejectionReason,
      'admin_comment': instance.adminComment,
      'version': instance.version,
      'is_required': instance.isRequired,
    };
