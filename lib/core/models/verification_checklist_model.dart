import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'verification_checklist_model.freezed.dart';
part 'verification_checklist_model.g.dart';

@freezed
class VerificationChecklistModel with _$VerificationChecklistModel {
  const factory VerificationChecklistModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'entity_type') required String entityType,
    @Default({}) Map<String, bool> checks, // e.g., {'Identity verified': true, 'Profile information verified': false}
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
    @JsonKey(name: 'updated_by') String? updatedBy,
  }) = _VerificationChecklistModel;

  factory VerificationChecklistModel.fromJson(Map<String, dynamic> json) => _$VerificationChecklistModelFromJson(json);
}
