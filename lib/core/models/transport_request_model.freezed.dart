// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transport_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransportRequestModel _$TransportRequestModelFromJson(
    Map<String, dynamic> json) {
  return _TransportRequestModel.fromJson(json);
}

/// @nodoc
mixin _$TransportRequestModel {
  @JsonKey(name: 'request_id')
  String get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deal_id')
  String? get dealId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_id')
  String get farmerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_id')
  String get buyerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_location')
  String get pickupLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_latitude')
  double? get pickupLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_longitude')
  double? get pickupLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_location')
  String get deliveryLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_latitude')
  double? get deliveryLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_longitude')
  double? get deliveryLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_type')
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_weight')
  double get totalWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_count')
  int get packageCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_dimensions')
  String? get packageDimensions => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_vehicle_type')
  String get requiredVehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'refrigeration_required')
  bool get refrigerationRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'special_instructions')
  String? get specialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_ready_at')
  @TimestampConverter()
  DateTime? get pickupReadyAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_pickup_time')
  String? get preferredPickupTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportRequestModelCopyWith<TransportRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportRequestModelCopyWith<$Res> {
  factory $TransportRequestModelCopyWith(TransportRequestModel value,
          $Res Function(TransportRequestModel) then) =
      _$TransportRequestModelCopyWithImpl<$Res, TransportRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'request_id') String requestId,
      @JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'deal_id') String? dealId,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'pickup_location') String pickupLocation,
      @JsonKey(name: 'pickup_latitude') double? pickupLatitude,
      @JsonKey(name: 'pickup_longitude') double? pickupLongitude,
      @JsonKey(name: 'delivery_location') String deliveryLocation,
      @JsonKey(name: 'delivery_latitude') double? deliveryLatitude,
      @JsonKey(name: 'delivery_longitude') double? deliveryLongitude,
      @JsonKey(name: 'product_type') String productType,
      @JsonKey(name: 'total_weight') double totalWeight,
      @JsonKey(name: 'package_count') int packageCount,
      @JsonKey(name: 'package_dimensions') String? packageDimensions,
      @JsonKey(name: 'required_vehicle_type') String requiredVehicleType,
      @JsonKey(name: 'refrigeration_required') bool refrigerationRequired,
      @JsonKey(name: 'special_instructions') String? specialInstructions,
      @JsonKey(name: 'pickup_ready_at')
      @TimestampConverter()
      DateTime? pickupReadyAt,
      @JsonKey(name: 'preferred_pickup_time') String? preferredPickupTime,
      String status,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$TransportRequestModelCopyWithImpl<$Res,
        $Val extends TransportRequestModel>
    implements $TransportRequestModelCopyWith<$Res> {
  _$TransportRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? orderId = freezed,
    Object? dealId = freezed,
    Object? farmerId = null,
    Object? buyerId = null,
    Object? pickupLocation = null,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? deliveryLocation = null,
    Object? deliveryLatitude = freezed,
    Object? deliveryLongitude = freezed,
    Object? productType = null,
    Object? totalWeight = null,
    Object? packageCount = null,
    Object? packageDimensions = freezed,
    Object? requiredVehicleType = null,
    Object? refrigerationRequired = null,
    Object? specialInstructions = freezed,
    Object? pickupReadyAt = freezed,
    Object? preferredPickupTime = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      dealId: freezed == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String?,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      pickupLocation: null == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as String,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLocation: null == deliveryLocation
          ? _value.deliveryLocation
          : deliveryLocation // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: freezed == deliveryLatitude
          ? _value.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLongitude: freezed == deliveryLongitude
          ? _value.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      totalWeight: null == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as double,
      packageCount: null == packageCount
          ? _value.packageCount
          : packageCount // ignore: cast_nullable_to_non_nullable
              as int,
      packageDimensions: freezed == packageDimensions
          ? _value.packageDimensions
          : packageDimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredVehicleType: null == requiredVehicleType
          ? _value.requiredVehicleType
          : requiredVehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      refrigerationRequired: null == refrigerationRequired
          ? _value.refrigerationRequired
          : refrigerationRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupReadyAt: freezed == pickupReadyAt
          ? _value.pickupReadyAt
          : pickupReadyAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferredPickupTime: freezed == preferredPickupTime
          ? _value.preferredPickupTime
          : preferredPickupTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$TransportRequestModelImplCopyWith<$Res>
    implements $TransportRequestModelCopyWith<$Res> {
  factory _$$TransportRequestModelImplCopyWith(
          _$TransportRequestModelImpl value,
          $Res Function(_$TransportRequestModelImpl) then) =
      __$$TransportRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'request_id') String requestId,
      @JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'deal_id') String? dealId,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'pickup_location') String pickupLocation,
      @JsonKey(name: 'pickup_latitude') double? pickupLatitude,
      @JsonKey(name: 'pickup_longitude') double? pickupLongitude,
      @JsonKey(name: 'delivery_location') String deliveryLocation,
      @JsonKey(name: 'delivery_latitude') double? deliveryLatitude,
      @JsonKey(name: 'delivery_longitude') double? deliveryLongitude,
      @JsonKey(name: 'product_type') String productType,
      @JsonKey(name: 'total_weight') double totalWeight,
      @JsonKey(name: 'package_count') int packageCount,
      @JsonKey(name: 'package_dimensions') String? packageDimensions,
      @JsonKey(name: 'required_vehicle_type') String requiredVehicleType,
      @JsonKey(name: 'refrigeration_required') bool refrigerationRequired,
      @JsonKey(name: 'special_instructions') String? specialInstructions,
      @JsonKey(name: 'pickup_ready_at')
      @TimestampConverter()
      DateTime? pickupReadyAt,
      @JsonKey(name: 'preferred_pickup_time') String? preferredPickupTime,
      String status,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$TransportRequestModelImplCopyWithImpl<$Res>
    extends _$TransportRequestModelCopyWithImpl<$Res,
        _$TransportRequestModelImpl>
    implements _$$TransportRequestModelImplCopyWith<$Res> {
  __$$TransportRequestModelImplCopyWithImpl(_$TransportRequestModelImpl _value,
      $Res Function(_$TransportRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? orderId = freezed,
    Object? dealId = freezed,
    Object? farmerId = null,
    Object? buyerId = null,
    Object? pickupLocation = null,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? deliveryLocation = null,
    Object? deliveryLatitude = freezed,
    Object? deliveryLongitude = freezed,
    Object? productType = null,
    Object? totalWeight = null,
    Object? packageCount = null,
    Object? packageDimensions = freezed,
    Object? requiredVehicleType = null,
    Object? refrigerationRequired = null,
    Object? specialInstructions = freezed,
    Object? pickupReadyAt = freezed,
    Object? preferredPickupTime = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TransportRequestModelImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      dealId: freezed == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String?,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      pickupLocation: null == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as String,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLocation: null == deliveryLocation
          ? _value.deliveryLocation
          : deliveryLocation // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryLatitude: freezed == deliveryLatitude
          ? _value.deliveryLatitude
          : deliveryLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryLongitude: freezed == deliveryLongitude
          ? _value.deliveryLongitude
          : deliveryLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      totalWeight: null == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as double,
      packageCount: null == packageCount
          ? _value.packageCount
          : packageCount // ignore: cast_nullable_to_non_nullable
              as int,
      packageDimensions: freezed == packageDimensions
          ? _value.packageDimensions
          : packageDimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredVehicleType: null == requiredVehicleType
          ? _value.requiredVehicleType
          : requiredVehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      refrigerationRequired: null == refrigerationRequired
          ? _value.refrigerationRequired
          : refrigerationRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupReadyAt: freezed == pickupReadyAt
          ? _value.pickupReadyAt
          : pickupReadyAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferredPickupTime: freezed == preferredPickupTime
          ? _value.preferredPickupTime
          : preferredPickupTime // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$TransportRequestModelImpl implements _TransportRequestModel {
  const _$TransportRequestModelImpl(
      {@JsonKey(name: 'request_id') required this.requestId,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'deal_id') this.dealId,
      @JsonKey(name: 'farmer_id') required this.farmerId,
      @JsonKey(name: 'buyer_id') required this.buyerId,
      @JsonKey(name: 'pickup_location') required this.pickupLocation,
      @JsonKey(name: 'pickup_latitude') this.pickupLatitude,
      @JsonKey(name: 'pickup_longitude') this.pickupLongitude,
      @JsonKey(name: 'delivery_location') required this.deliveryLocation,
      @JsonKey(name: 'delivery_latitude') this.deliveryLatitude,
      @JsonKey(name: 'delivery_longitude') this.deliveryLongitude,
      @JsonKey(name: 'product_type') required this.productType,
      @JsonKey(name: 'total_weight') required this.totalWeight,
      @JsonKey(name: 'package_count') required this.packageCount,
      @JsonKey(name: 'package_dimensions') this.packageDimensions,
      @JsonKey(name: 'required_vehicle_type') required this.requiredVehicleType,
      @JsonKey(name: 'refrigeration_required')
      this.refrigerationRequired = false,
      @JsonKey(name: 'special_instructions') this.specialInstructions,
      @JsonKey(name: 'pickup_ready_at')
      @TimestampConverter()
      this.pickupReadyAt,
      @JsonKey(name: 'preferred_pickup_time') this.preferredPickupTime,
      this.status = 'PENDING',
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$TransportRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransportRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'request_id')
  final String requestId;
  @override
  @JsonKey(name: 'order_id')
  final String? orderId;
  @override
  @JsonKey(name: 'deal_id')
  final String? dealId;
  @override
  @JsonKey(name: 'farmer_id')
  final String farmerId;
  @override
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @override
  @JsonKey(name: 'pickup_location')
  final String pickupLocation;
  @override
  @JsonKey(name: 'pickup_latitude')
  final double? pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  final double? pickupLongitude;
  @override
  @JsonKey(name: 'delivery_location')
  final String deliveryLocation;
  @override
  @JsonKey(name: 'delivery_latitude')
  final double? deliveryLatitude;
  @override
  @JsonKey(name: 'delivery_longitude')
  final double? deliveryLongitude;
  @override
  @JsonKey(name: 'product_type')
  final String productType;
  @override
  @JsonKey(name: 'total_weight')
  final double totalWeight;
  @override
  @JsonKey(name: 'package_count')
  final int packageCount;
  @override
  @JsonKey(name: 'package_dimensions')
  final String? packageDimensions;
  @override
  @JsonKey(name: 'required_vehicle_type')
  final String requiredVehicleType;
  @override
  @JsonKey(name: 'refrigeration_required')
  final bool refrigerationRequired;
  @override
  @JsonKey(name: 'special_instructions')
  final String? specialInstructions;
  @override
  @JsonKey(name: 'pickup_ready_at')
  @TimestampConverter()
  final DateTime? pickupReadyAt;
  @override
  @JsonKey(name: 'preferred_pickup_time')
  final String? preferredPickupTime;
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
    return 'TransportRequestModel(requestId: $requestId, orderId: $orderId, dealId: $dealId, farmerId: $farmerId, buyerId: $buyerId, pickupLocation: $pickupLocation, pickupLatitude: $pickupLatitude, pickupLongitude: $pickupLongitude, deliveryLocation: $deliveryLocation, deliveryLatitude: $deliveryLatitude, deliveryLongitude: $deliveryLongitude, productType: $productType, totalWeight: $totalWeight, packageCount: $packageCount, packageDimensions: $packageDimensions, requiredVehicleType: $requiredVehicleType, refrigerationRequired: $refrigerationRequired, specialInstructions: $specialInstructions, pickupReadyAt: $pickupReadyAt, preferredPickupTime: $preferredPickupTime, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransportRequestModelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.dealId, dealId) || other.dealId == dealId) &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.pickupLatitude, pickupLatitude) ||
                other.pickupLatitude == pickupLatitude) &&
            (identical(other.pickupLongitude, pickupLongitude) ||
                other.pickupLongitude == pickupLongitude) &&
            (identical(other.deliveryLocation, deliveryLocation) ||
                other.deliveryLocation == deliveryLocation) &&
            (identical(other.deliveryLatitude, deliveryLatitude) ||
                other.deliveryLatitude == deliveryLatitude) &&
            (identical(other.deliveryLongitude, deliveryLongitude) ||
                other.deliveryLongitude == deliveryLongitude) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.totalWeight, totalWeight) ||
                other.totalWeight == totalWeight) &&
            (identical(other.packageCount, packageCount) ||
                other.packageCount == packageCount) &&
            (identical(other.packageDimensions, packageDimensions) ||
                other.packageDimensions == packageDimensions) &&
            (identical(other.requiredVehicleType, requiredVehicleType) ||
                other.requiredVehicleType == requiredVehicleType) &&
            (identical(other.refrigerationRequired, refrigerationRequired) ||
                other.refrigerationRequired == refrigerationRequired) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.pickupReadyAt, pickupReadyAt) ||
                other.pickupReadyAt == pickupReadyAt) &&
            (identical(other.preferredPickupTime, preferredPickupTime) ||
                other.preferredPickupTime == preferredPickupTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        requestId,
        orderId,
        dealId,
        farmerId,
        buyerId,
        pickupLocation,
        pickupLatitude,
        pickupLongitude,
        deliveryLocation,
        deliveryLatitude,
        deliveryLongitude,
        productType,
        totalWeight,
        packageCount,
        packageDimensions,
        requiredVehicleType,
        refrigerationRequired,
        specialInstructions,
        pickupReadyAt,
        preferredPickupTime,
        status,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransportRequestModelImplCopyWith<_$TransportRequestModelImpl>
      get copyWith => __$$TransportRequestModelImplCopyWithImpl<
          _$TransportRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransportRequestModelImplToJson(
      this,
    );
  }
}

abstract class _TransportRequestModel implements TransportRequestModel {
  const factory _TransportRequestModel(
      {@JsonKey(name: 'request_id') required final String requestId,
      @JsonKey(name: 'order_id') final String? orderId,
      @JsonKey(name: 'deal_id') final String? dealId,
      @JsonKey(name: 'farmer_id') required final String farmerId,
      @JsonKey(name: 'buyer_id') required final String buyerId,
      @JsonKey(name: 'pickup_location') required final String pickupLocation,
      @JsonKey(name: 'pickup_latitude') final double? pickupLatitude,
      @JsonKey(name: 'pickup_longitude') final double? pickupLongitude,
      @JsonKey(name: 'delivery_location')
      required final String deliveryLocation,
      @JsonKey(name: 'delivery_latitude') final double? deliveryLatitude,
      @JsonKey(name: 'delivery_longitude') final double? deliveryLongitude,
      @JsonKey(name: 'product_type') required final String productType,
      @JsonKey(name: 'total_weight') required final double totalWeight,
      @JsonKey(name: 'package_count') required final int packageCount,
      @JsonKey(name: 'package_dimensions') final String? packageDimensions,
      @JsonKey(name: 'required_vehicle_type')
      required final String requiredVehicleType,
      @JsonKey(name: 'refrigeration_required') final bool refrigerationRequired,
      @JsonKey(name: 'special_instructions') final String? specialInstructions,
      @JsonKey(name: 'pickup_ready_at')
      @TimestampConverter()
      final DateTime? pickupReadyAt,
      @JsonKey(name: 'preferred_pickup_time') final String? preferredPickupTime,
      final String status,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$TransportRequestModelImpl;

  factory _TransportRequestModel.fromJson(Map<String, dynamic> json) =
      _$TransportRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'request_id')
  String get requestId;
  @override
  @JsonKey(name: 'order_id')
  String? get orderId;
  @override
  @JsonKey(name: 'deal_id')
  String? get dealId;
  @override
  @JsonKey(name: 'farmer_id')
  String get farmerId;
  @override
  @JsonKey(name: 'buyer_id')
  String get buyerId;
  @override
  @JsonKey(name: 'pickup_location')
  String get pickupLocation;
  @override
  @JsonKey(name: 'pickup_latitude')
  double? get pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  double? get pickupLongitude;
  @override
  @JsonKey(name: 'delivery_location')
  String get deliveryLocation;
  @override
  @JsonKey(name: 'delivery_latitude')
  double? get deliveryLatitude;
  @override
  @JsonKey(name: 'delivery_longitude')
  double? get deliveryLongitude;
  @override
  @JsonKey(name: 'product_type')
  String get productType;
  @override
  @JsonKey(name: 'total_weight')
  double get totalWeight;
  @override
  @JsonKey(name: 'package_count')
  int get packageCount;
  @override
  @JsonKey(name: 'package_dimensions')
  String? get packageDimensions;
  @override
  @JsonKey(name: 'required_vehicle_type')
  String get requiredVehicleType;
  @override
  @JsonKey(name: 'refrigeration_required')
  bool get refrigerationRequired;
  @override
  @JsonKey(name: 'special_instructions')
  String? get specialInstructions;
  @override
  @JsonKey(name: 'pickup_ready_at')
  @TimestampConverter()
  DateTime? get pickupReadyAt;
  @override
  @JsonKey(name: 'preferred_pickup_time')
  String? get preferredPickupTime;
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
  _$$TransportRequestModelImplCopyWith<_$TransportRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
