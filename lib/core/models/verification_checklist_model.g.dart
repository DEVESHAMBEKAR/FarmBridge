// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_checklist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationChecklistModelImpl _$$VerificationChecklistModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationChecklistModelImpl(
      userId: json['user_id'] as String,
      entityType: json['entity_type'] as String,
      checks: (json['checks'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
      updatedBy: json['updated_by'] as String?,
    );

Map<String, dynamic> _$$VerificationChecklistModelImplToJson(
        _$VerificationChecklistModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'entity_type': instance.entityType,
      'checks': instance.checks,
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
      'updated_by': instance.updatedBy,
    };
