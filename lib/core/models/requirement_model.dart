import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';
import '../constants/firestore_collections.dart';

part 'requirement_model.freezed.dart';
part 'requirement_model.g.dart';

@freezed
class RequirementModel with _$RequirementModel {
  const factory RequirementModel({
    @JsonKey(name: 'requirement_id') required String requirementId,
    @JsonKey(name: 'dealer_id') required String dealerId,
    @JsonKey(name: 'product_id') String? productId,
    required String category,
    @JsonKey(name: 'crop_variety') required String cropVariety,
    required double quantity,
    @JsonKey(name: 'quality_grade') required String qualityGrade,
    @JsonKey(name: 'location_name') required String locationName,
    @JsonKey(name: 'delivery_pincode') required String deliveryPincode,
    @JsonKey(name: 'required_date') @TimestampNonNullConverter() required DateTime requiredDate,
    @JsonKey(name: 'target_price_per_unit') required double targetPricePerUnit,
    @JsonKey(name: 'max_budget') required double maxBudget,
    @Default(UserStatus.active) String status,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _RequirementModel;

  factory RequirementModel.fromJson(Map<String, dynamic> json) => _$RequirementModelFromJson(json);
}
