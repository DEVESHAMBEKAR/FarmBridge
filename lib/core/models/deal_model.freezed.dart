// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DealModel _$DealModelFromJson(Map<String, dynamic> json) {
  return _DealModel.fromJson(json);
}

/// @nodoc
mixin _$DealModel {
  @JsonKey(name: 'deal_id')
  String get dealId => throw _privateConstructorUsedError;
  @JsonKey(name: 'requirement_id')
  String? get requirementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_id')
  String get farmerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_id')
  String get buyerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'agreed_price_per_unit')
  double get agreedPricePerUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_address')
  String get pickupAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_pickup_date')
  @TimestampNonNullConverter()
  DateTime get expectedPickupDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_delivery_date')
  @TimestampNonNullConverter()
  DateTime get expectedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'transport_status')
  String get transportStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'deal_status')
  String get dealStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DealModelCopyWith<DealModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealModelCopyWith<$Res> {
  factory $DealModelCopyWith(DealModel value, $Res Function(DealModel) then) =
      _$DealModelCopyWithImpl<$Res, DealModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'deal_id') String dealId,
      @JsonKey(name: 'requirement_id') String? requirementId,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'product_id') String? productId,
      @JsonKey(name: 'product_name') String productName,
      double quantity,
      @JsonKey(name: 'agreed_price_per_unit') double agreedPricePerUnit,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'pickup_address') String pickupAddress,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      @JsonKey(name: 'expected_pickup_date')
      @TimestampNonNullConverter()
      DateTime expectedPickupDate,
      @JsonKey(name: 'expected_delivery_date')
      @TimestampNonNullConverter()
      DateTime expectedDeliveryDate,
      @JsonKey(name: 'payment_status') String paymentStatus,
      @JsonKey(name: 'transport_status') String transportStatus,
      @JsonKey(name: 'deal_status') String dealStatus,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$DealModelCopyWithImpl<$Res, $Val extends DealModel>
    implements $DealModelCopyWith<$Res> {
  _$DealModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealId = null,
    Object? requirementId = freezed,
    Object? farmerId = null,
    Object? buyerId = null,
    Object? productId = freezed,
    Object? productName = null,
    Object? quantity = null,
    Object? agreedPricePerUnit = null,
    Object? totalAmount = null,
    Object? pickupAddress = null,
    Object? deliveryAddress = null,
    Object? expectedPickupDate = null,
    Object? expectedDeliveryDate = null,
    Object? paymentStatus = null,
    Object? transportStatus = null,
    Object? dealStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      dealId: null == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String,
      requirementId: freezed == requirementId
          ? _value.requirementId
          : requirementId // ignore: cast_nullable_to_non_nullable
              as String?,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      agreedPricePerUnit: null == agreedPricePerUnit
          ? _value.agreedPricePerUnit
          : agreedPricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      pickupAddress: null == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      expectedPickupDate: null == expectedPickupDate
          ? _value.expectedPickupDate
          : expectedPickupDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedDeliveryDate: null == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transportStatus: null == transportStatus
          ? _value.transportStatus
          : transportStatus // ignore: cast_nullable_to_non_nullable
              as String,
      dealStatus: null == dealStatus
          ? _value.dealStatus
          : dealStatus // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DealModelImplCopyWith<$Res>
    implements $DealModelCopyWith<$Res> {
  factory _$$DealModelImplCopyWith(
          _$DealModelImpl value, $Res Function(_$DealModelImpl) then) =
      __$$DealModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'deal_id') String dealId,
      @JsonKey(name: 'requirement_id') String? requirementId,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'product_id') String? productId,
      @JsonKey(name: 'product_name') String productName,
      double quantity,
      @JsonKey(name: 'agreed_price_per_unit') double agreedPricePerUnit,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'pickup_address') String pickupAddress,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      @JsonKey(name: 'expected_pickup_date')
      @TimestampNonNullConverter()
      DateTime expectedPickupDate,
      @JsonKey(name: 'expected_delivery_date')
      @TimestampNonNullConverter()
      DateTime expectedDeliveryDate,
      @JsonKey(name: 'payment_status') String paymentStatus,
      @JsonKey(name: 'transport_status') String transportStatus,
      @JsonKey(name: 'deal_status') String dealStatus,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$DealModelImplCopyWithImpl<$Res>
    extends _$DealModelCopyWithImpl<$Res, _$DealModelImpl>
    implements _$$DealModelImplCopyWith<$Res> {
  __$$DealModelImplCopyWithImpl(
      _$DealModelImpl _value, $Res Function(_$DealModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealId = null,
    Object? requirementId = freezed,
    Object? farmerId = null,
    Object? buyerId = null,
    Object? productId = freezed,
    Object? productName = null,
    Object? quantity = null,
    Object? agreedPricePerUnit = null,
    Object? totalAmount = null,
    Object? pickupAddress = null,
    Object? deliveryAddress = null,
    Object? expectedPickupDate = null,
    Object? expectedDeliveryDate = null,
    Object? paymentStatus = null,
    Object? transportStatus = null,
    Object? dealStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DealModelImpl(
      dealId: null == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String,
      requirementId: freezed == requirementId
          ? _value.requirementId
          : requirementId // ignore: cast_nullable_to_non_nullable
              as String?,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      agreedPricePerUnit: null == agreedPricePerUnit
          ? _value.agreedPricePerUnit
          : agreedPricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      pickupAddress: null == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      expectedPickupDate: null == expectedPickupDate
          ? _value.expectedPickupDate
          : expectedPickupDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedDeliveryDate: null == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transportStatus: null == transportStatus
          ? _value.transportStatus
          : transportStatus // ignore: cast_nullable_to_non_nullable
              as String,
      dealStatus: null == dealStatus
          ? _value.dealStatus
          : dealStatus // ignore: cast_nullable_to_non_nullable
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
class _$DealModelImpl implements _DealModel {
  const _$DealModelImpl(
      {@JsonKey(name: 'deal_id') required this.dealId,
      @JsonKey(name: 'requirement_id') this.requirementId,
      @JsonKey(name: 'farmer_id') required this.farmerId,
      @JsonKey(name: 'buyer_id') required this.buyerId,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      required this.quantity,
      @JsonKey(name: 'agreed_price_per_unit') required this.agreedPricePerUnit,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'pickup_address') required this.pickupAddress,
      @JsonKey(name: 'delivery_address') required this.deliveryAddress,
      @JsonKey(name: 'expected_pickup_date')
      @TimestampNonNullConverter()
      required this.expectedPickupDate,
      @JsonKey(name: 'expected_delivery_date')
      @TimestampNonNullConverter()
      required this.expectedDeliveryDate,
      @JsonKey(name: 'payment_status') required this.paymentStatus,
      @JsonKey(name: 'transport_status') required this.transportStatus,
      @JsonKey(name: 'deal_status') this.dealStatus = DealStatus.negotiating,
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$DealModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DealModelImplFromJson(json);

  @override
  @JsonKey(name: 'deal_id')
  final String dealId;
  @override
  @JsonKey(name: 'requirement_id')
  final String? requirementId;
  @override
  @JsonKey(name: 'farmer_id')
  final String farmerId;
  @override
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @override
  @JsonKey(name: 'product_id')
  final String? productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'agreed_price_per_unit')
  final double agreedPricePerUnit;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'pickup_address')
  final String pickupAddress;
  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  @JsonKey(name: 'expected_pickup_date')
  @TimestampNonNullConverter()
  final DateTime expectedPickupDate;
  @override
  @JsonKey(name: 'expected_delivery_date')
  @TimestampNonNullConverter()
  final DateTime expectedDeliveryDate;
  @override
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  @override
  @JsonKey(name: 'transport_status')
  final String transportStatus;
  @override
  @JsonKey(name: 'deal_status')
  final String dealStatus;
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
    return 'DealModel(dealId: $dealId, requirementId: $requirementId, farmerId: $farmerId, buyerId: $buyerId, productId: $productId, productName: $productName, quantity: $quantity, agreedPricePerUnit: $agreedPricePerUnit, totalAmount: $totalAmount, pickupAddress: $pickupAddress, deliveryAddress: $deliveryAddress, expectedPickupDate: $expectedPickupDate, expectedDeliveryDate: $expectedDeliveryDate, paymentStatus: $paymentStatus, transportStatus: $transportStatus, dealStatus: $dealStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DealModelImpl &&
            (identical(other.dealId, dealId) || other.dealId == dealId) &&
            (identical(other.requirementId, requirementId) ||
                other.requirementId == requirementId) &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.agreedPricePerUnit, agreedPricePerUnit) ||
                other.agreedPricePerUnit == agreedPricePerUnit) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.expectedPickupDate, expectedPickupDate) ||
                other.expectedPickupDate == expectedPickupDate) &&
            (identical(other.expectedDeliveryDate, expectedDeliveryDate) ||
                other.expectedDeliveryDate == expectedDeliveryDate) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.transportStatus, transportStatus) ||
                other.transportStatus == transportStatus) &&
            (identical(other.dealStatus, dealStatus) ||
                other.dealStatus == dealStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dealId,
      requirementId,
      farmerId,
      buyerId,
      productId,
      productName,
      quantity,
      agreedPricePerUnit,
      totalAmount,
      pickupAddress,
      deliveryAddress,
      expectedPickupDate,
      expectedDeliveryDate,
      paymentStatus,
      transportStatus,
      dealStatus,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DealModelImplCopyWith<_$DealModelImpl> get copyWith =>
      __$$DealModelImplCopyWithImpl<_$DealModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DealModelImplToJson(
      this,
    );
  }
}

abstract class _DealModel implements DealModel {
  const factory _DealModel(
      {@JsonKey(name: 'deal_id') required final String dealId,
      @JsonKey(name: 'requirement_id') final String? requirementId,
      @JsonKey(name: 'farmer_id') required final String farmerId,
      @JsonKey(name: 'buyer_id') required final String buyerId,
      @JsonKey(name: 'product_id') final String? productId,
      @JsonKey(name: 'product_name') required final String productName,
      required final double quantity,
      @JsonKey(name: 'agreed_price_per_unit')
      required final double agreedPricePerUnit,
      @JsonKey(name: 'total_amount') required final double totalAmount,
      @JsonKey(name: 'pickup_address') required final String pickupAddress,
      @JsonKey(name: 'delivery_address') required final String deliveryAddress,
      @JsonKey(name: 'expected_pickup_date')
      @TimestampNonNullConverter()
      required final DateTime expectedPickupDate,
      @JsonKey(name: 'expected_delivery_date')
      @TimestampNonNullConverter()
      required final DateTime expectedDeliveryDate,
      @JsonKey(name: 'payment_status') required final String paymentStatus,
      @JsonKey(name: 'transport_status') required final String transportStatus,
      @JsonKey(name: 'deal_status') final String dealStatus,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$DealModelImpl;

  factory _DealModel.fromJson(Map<String, dynamic> json) =
      _$DealModelImpl.fromJson;

  @override
  @JsonKey(name: 'deal_id')
  String get dealId;
  @override
  @JsonKey(name: 'requirement_id')
  String? get requirementId;
  @override
  @JsonKey(name: 'farmer_id')
  String get farmerId;
  @override
  @JsonKey(name: 'buyer_id')
  String get buyerId;
  @override
  @JsonKey(name: 'product_id')
  String? get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'agreed_price_per_unit')
  double get agreedPricePerUnit;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'pickup_address')
  String get pickupAddress;
  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  @JsonKey(name: 'expected_pickup_date')
  @TimestampNonNullConverter()
  DateTime get expectedPickupDate;
  @override
  @JsonKey(name: 'expected_delivery_date')
  @TimestampNonNullConverter()
  DateTime get expectedDeliveryDate;
  @override
  @JsonKey(name: 'payment_status')
  String get paymentStatus;
  @override
  @JsonKey(name: 'transport_status')
  String get transportStatus;
  @override
  @JsonKey(name: 'deal_status')
  String get dealStatus;
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
  _$$DealModelImplCopyWith<_$DealModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
