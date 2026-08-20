// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requirement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequirementModelImpl _$$RequirementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequirementModelImpl(
      requirementId: json['requirement_id'] as String,
      dealerId: json['dealer_id'] as String,
      productId: json['product_id'] as String?,
      category: json['category'] as String,
      cropVariety: json['crop_variety'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      qualityGrade: json['quality_grade'] as String,
      locationName: json['location_name'] as String,
      deliveryPincode: json['delivery_pincode'] as String,
      requiredDate: const TimestampNonNullConverter()
          .fromJson(json['required_date'] as Timestamp),
      targetPricePerUnit: (json['target_price_per_unit'] as num).toDouble(),
      maxBudget: (json['max_budget'] as num).toDouble(),
      status: json['status'] as String? ?? UserStatus.active,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$RequirementModelImplToJson(
        _$RequirementModelImpl instance) =>
    <String, dynamic>{
      'requirement_id': instance.requirementId,
      'dealer_id': instance.dealerId,
      'product_id': instance.productId,
      'category': instance.category,
      'crop_variety': instance.cropVariety,
      'quantity': instance.quantity,
      'quality_grade': instance.qualityGrade,
      'location_name': instance.locationName,
      'delivery_pincode': instance.deliveryPincode,
      'required_date':
          const TimestampNonNullConverter().toJson(instance.requiredDate),
      'target_price_per_unit': instance.targetPricePerUnit,
      'max_budget': instance.maxBudget,
      'status': instance.status,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
