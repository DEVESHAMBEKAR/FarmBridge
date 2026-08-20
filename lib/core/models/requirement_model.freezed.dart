// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requirement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequirementModel _$RequirementModelFromJson(Map<String, dynamic> json) {
  return _RequirementModel.fromJson(json);
}

/// @nodoc
mixin _$RequirementModel {
  @JsonKey(name: 'requirement_id')
  String get requirementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dealer_id')
  String get dealerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String? get productId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'crop_variety')
  String get cropVariety => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_grade')
  String get qualityGrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_name')
  String get locationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_pincode')
  String get deliveryPincode => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_date')
  @TimestampNonNullConverter()
  DateTime get requiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_price_per_unit')
  double get targetPricePerUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_budget')
  double get maxBudget => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequirementModelCopyWith<RequirementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequirementModelCopyWith<$Res> {
  factory $RequirementModelCopyWith(
          RequirementModel value, $Res Function(RequirementModel) then) =
      _$RequirementModelCopyWithImpl<$Res, RequirementModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requirement_id') String requirementId,
      @JsonKey(name: 'dealer_id') String dealerId,
      @JsonKey(name: 'product_id') String? productId,
      String category,
      @JsonKey(name: 'crop_variety') String cropVariety,
      double quantity,
      @JsonKey(name: 'quality_grade') String qualityGrade,
      @JsonKey(name: 'location_name') String locationName,
      @JsonKey(name: 'delivery_pincode') String deliveryPincode,
      @JsonKey(name: 'required_date')
      @TimestampNonNullConverter()
      DateTime requiredDate,
      @JsonKey(name: 'target_price_per_unit') double targetPricePerUnit,
      @JsonKey(name: 'max_budget') double maxBudget,
      String status,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$RequirementModelCopyWithImpl<$Res, $Val extends RequirementModel>
    implements $RequirementModelCopyWith<$Res> {
  _$RequirementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requirementId = null,
    Object? dealerId = null,
    Object? productId = freezed,
    Object? category = null,
    Object? cropVariety = null,
    Object? quantity = null,
    Object? qualityGrade = null,
    Object? locationName = null,
    Object? deliveryPincode = null,
    Object? requiredDate = null,
    Object? targetPricePerUnit = null,
    Object? maxBudget = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      requirementId: null == requirementId
          ? _value.requirementId
          : requirementId // ignore: cast_nullable_to_non_nullable
              as String,
      dealerId: null == dealerId
          ? _value.dealerId
          : dealerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      cropVariety: null == cropVariety
          ? _value.cropVariety
          : cropVariety // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      qualityGrade: null == qualityGrade
          ? _value.qualityGrade
          : qualityGrade // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPincode: null == deliveryPincode
          ? _value.deliveryPincode
          : deliveryPincode // ignore: cast_nullable_to_non_nullable
              as String,
      requiredDate: null == requiredDate
          ? _value.requiredDate
          : requiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetPricePerUnit: null == targetPricePerUnit
          ? _value.targetPricePerUnit
          : targetPricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      maxBudget: null == maxBudget
          ? _value.maxBudget
          : maxBudget // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequirementModelImplCopyWith<$Res>
    implements $RequirementModelCopyWith<$Res> {
  factory _$$RequirementModelImplCopyWith(_$RequirementModelImpl value,
          $Res Function(_$RequirementModelImpl) then) =
      __$$RequirementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requirement_id') String requirementId,
      @JsonKey(name: 'dealer_id') String dealerId,
      @JsonKey(name: 'product_id') String? productId,
      String category,
      @JsonKey(name: 'crop_variety') String cropVariety,
      double quantity,
      @JsonKey(name: 'quality_grade') String qualityGrade,
      @JsonKey(name: 'location_name') String locationName,
      @JsonKey(name: 'delivery_pincode') String deliveryPincode,
      @JsonKey(name: 'required_date')
      @TimestampNonNullConverter()
      DateTime requiredDate,
      @JsonKey(name: 'target_price_per_unit') double targetPricePerUnit,
      @JsonKey(name: 'max_budget') double maxBudget,
      String status,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$RequirementModelImplCopyWithImpl<$Res>
    extends _$RequirementModelCopyWithImpl<$Res, _$RequirementModelImpl>
    implements _$$RequirementModelImplCopyWith<$Res> {
  __$$RequirementModelImplCopyWithImpl(_$RequirementModelImpl _value,
      $Res Function(_$RequirementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requirementId = null,
    Object? dealerId = null,
    Object? productId = freezed,
    Object? category = null,
    Object? cropVariety = null,
    Object? quantity = null,
    Object? qualityGrade = null,
    Object? locationName = null,
    Object? deliveryPincode = null,
    Object? requiredDate = null,
    Object? targetPricePerUnit = null,
    Object? maxBudget = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RequirementModelImpl(
      requirementId: null == requirementId
          ? _value.requirementId
          : requirementId // ignore: cast_nullable_to_non_nullable
              as String,
      dealerId: null == dealerId
          ? _value.dealerId
          : dealerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      cropVariety: null == cropVariety
          ? _value.cropVariety
          : cropVariety // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      qualityGrade: null == qualityGrade
          ? _value.qualityGrade
          : qualityGrade // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPincode: null == deliveryPincode
          ? _value.deliveryPincode
          : deliveryPincode // ignore: cast_nullable_to_non_nullable
              as String,
      requiredDate: null == requiredDate
          ? _value.requiredDate
          : requiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetPricePerUnit: null == targetPricePerUnit
          ? _value.targetPricePerUnit
          : targetPricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      maxBudget: null == maxBudget
          ? _value.maxBudget
          : maxBudget // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequirementModelImpl implements _RequirementModel {
  const _$RequirementModelImpl(
      {@JsonKey(name: 'requirement_id') required this.requirementId,
      @JsonKey(name: 'dealer_id') required this.dealerId,
      @JsonKey(name: 'product_id') this.productId,
      required this.category,
      @JsonKey(name: 'crop_variety') required this.cropVariety,
      required this.quantity,
      @JsonKey(name: 'quality_grade') required this.qualityGrade,
      @JsonKey(name: 'location_name') required this.locationName,
      @JsonKey(name: 'delivery_pincode') required this.deliveryPincode,
      @JsonKey(name: 'required_date')
      @TimestampNonNullConverter()
      required this.requiredDate,
      @JsonKey(name: 'target_price_per_unit') required this.targetPricePerUnit,
      @JsonKey(name: 'max_budget') required this.maxBudget,
      this.status = UserStatus.active,
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$RequirementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequirementModelImplFromJson(json);

  @override
  @JsonKey(name: 'requirement_id')
  final String requirementId;
  @override
  @JsonKey(name: 'dealer_id')
  final String dealerId;
  @override
  @JsonKey(name: 'product_id')
  final String? productId;
  @override
  final String category;
  @override
  @JsonKey(name: 'crop_variety')
  final String cropVariety;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'quality_grade')
  final String qualityGrade;
  @override
  @JsonKey(name: 'location_name')
  final String locationName;
  @override
  @JsonKey(name: 'delivery_pincode')
  final String deliveryPincode;
  @override
  @JsonKey(name: 'required_date')
  @TimestampNonNullConverter()
  final DateTime requiredDate;
  @override
  @JsonKey(name: 'target_price_per_unit')
  final double targetPricePerUnit;
  @override
  @JsonKey(name: 'max_budget')
  final double maxBudget;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RequirementModel(requirementId: $requirementId, dealerId: $dealerId, productId: $productId, category: $category, cropVariety: $cropVariety, quantity: $quantity, qualityGrade: $qualityGrade, locationName: $locationName, deliveryPincode: $deliveryPincode, requiredDate: $requiredDate, targetPricePerUnit: $targetPricePerUnit, maxBudget: $maxBudget, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequirementModelImpl &&
            (identical(other.requirementId, requirementId) ||
                other.requirementId == requirementId) &&
            (identical(other.dealerId, dealerId) ||
                other.dealerId == dealerId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.cropVariety, cropVariety) ||
                other.cropVariety == cropVariety) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.qualityGrade, qualityGrade) ||
                other.qualityGrade == qualityGrade) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.deliveryPincode, deliveryPincode) ||
                other.deliveryPincode == deliveryPincode) &&
            (identical(other.requiredDate, requiredDate) ||
                other.requiredDate == requiredDate) &&
            (identical(other.targetPricePerUnit, targetPricePerUnit) ||
                other.targetPricePerUnit == targetPricePerUnit) &&
            (identical(other.maxBudget, maxBudget) ||
                other.maxBudget == maxBudget) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      requirementId,
      dealerId,
      productId,
      category,
      cropVariety,
      quantity,
      qualityGrade,
      locationName,
      deliveryPincode,
      requiredDate,
      targetPricePerUnit,
      maxBudget,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequirementModelImplCopyWith<_$RequirementModelImpl> get copyWith =>
      __$$RequirementModelImplCopyWithImpl<_$RequirementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequirementModelImplToJson(
      this,
    );
  }
}

abstract class _RequirementModel implements RequirementModel {
  const factory _RequirementModel(
      {@JsonKey(name: 'requirement_id') required final String requirementId,
      @JsonKey(name: 'dealer_id') required final String dealerId,
      @JsonKey(name: 'product_id') final String? productId,
      required final String category,
      @JsonKey(name: 'crop_variety') required final String cropVariety,
      required final double quantity,
      @JsonKey(name: 'quality_grade') required final String qualityGrade,
      @JsonKey(name: 'location_name') required final String locationName,
      @JsonKey(name: 'delivery_pincode') required final String deliveryPincode,
      @JsonKey(name: 'required_date')
      @TimestampNonNullConverter()
      required final DateTime requiredDate,
      @JsonKey(name: 'target_price_per_unit')
      required final double targetPricePerUnit,
      @JsonKey(name: 'max_budget') required final double maxBudget,
      final String status,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$RequirementModelImpl;

  factory _RequirementModel.fromJson(Map<String, dynamic> json) =
      _$RequirementModelImpl.fromJson;

  @override
  @JsonKey(name: 'requirement_id')
  String get requirementId;
  @override
  @JsonKey(name: 'dealer_id')
  String get dealerId;
  @override
  @JsonKey(name: 'product_id')
  String? get productId;
  @override
  String get category;
  @override
  @JsonKey(name: 'crop_variety')
  String get cropVariety;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'quality_grade')
  String get qualityGrade;
  @override
  @JsonKey(name: 'location_name')
  String get locationName;
  @override
  @JsonKey(name: 'delivery_pincode')
  String get deliveryPincode;
  @override
  @JsonKey(name: 'required_date')
  @TimestampNonNullConverter()
  DateTime get requiredDate;
  @override
  @JsonKey(name: 'target_price_per_unit')
  double get targetPricePerUnit;
  @override
  @JsonKey(name: 'max_budget')
  double get maxBudget;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RequirementModelImplCopyWith<_$RequirementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
