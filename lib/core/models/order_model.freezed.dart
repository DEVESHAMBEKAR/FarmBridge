// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_id')
  String get buyerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_name')
  String get buyerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_phone')
  String get buyerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_id')
  String get farmerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_name')
  String get farmerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_partner_id')
  String? get deliveryPartnerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_pincode')
  String get deliveryPincode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_fee')
  double get deliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'placed_at')
  @TimestampConverter()
  DateTime? get placedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_at')
  @TimestampConverter()
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivered_at')
  @TimestampConverter()
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancelled_at')
  @TimestampConverter()
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'buyer_name') String buyerName,
      @JsonKey(name: 'buyer_phone') String buyerPhone,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'farmer_name') String farmerName,
      @JsonKey(name: 'delivery_partner_id') String? deliveryPartnerId,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      @JsonKey(name: 'delivery_pincode') String deliveryPincode,
      String status,
      @JsonKey(name: 'payment_status') String paymentStatus,
      @JsonKey(name: 'payment_method') String paymentMethod,
      double subtotal,
      @JsonKey(name: 'delivery_fee') double deliveryFee,
      @JsonKey(name: 'total_amount') double totalAmount,
      String? notes,
      @JsonKey(name: 'placed_at') @TimestampConverter() DateTime? placedAt,
      @JsonKey(name: 'confirmed_at')
      @TimestampConverter()
      DateTime? confirmedAt,
      @JsonKey(name: 'delivered_at')
      @TimestampConverter()
      DateTime? deliveredAt,
      @JsonKey(name: 'cancelled_at')
      @TimestampConverter()
      DateTime? cancelledAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? buyerId = null,
    Object? buyerName = null,
    Object? buyerPhone = null,
    Object? farmerId = null,
    Object? farmerName = null,
    Object? deliveryPartnerId = freezed,
    Object? deliveryAddress = null,
    Object? deliveryPincode = null,
    Object? status = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? totalAmount = null,
    Object? notes = freezed,
    Object? placedAt = freezed,
    Object? confirmedAt = freezed,
    Object? deliveredAt = freezed,
    Object? cancelledAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      buyerPhone: null == buyerPhone
          ? _value.buyerPhone
          : buyerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      farmerName: null == farmerName
          ? _value.farmerName
          : farmerName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPartnerId: freezed == deliveryPartnerId
          ? _value.deliveryPartnerId
          : deliveryPartnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPincode: null == deliveryPincode
          ? _value.deliveryPincode
          : deliveryPincode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      placedAt: freezed == placedAt
          ? _value.placedAt
          : placedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'buyer_name') String buyerName,
      @JsonKey(name: 'buyer_phone') String buyerPhone,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'farmer_name') String farmerName,
      @JsonKey(name: 'delivery_partner_id') String? deliveryPartnerId,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      @JsonKey(name: 'delivery_pincode') String deliveryPincode,
      String status,
      @JsonKey(name: 'payment_status') String paymentStatus,
      @JsonKey(name: 'payment_method') String paymentMethod,
      double subtotal,
      @JsonKey(name: 'delivery_fee') double deliveryFee,
      @JsonKey(name: 'total_amount') double totalAmount,
      String? notes,
      @JsonKey(name: 'placed_at') @TimestampConverter() DateTime? placedAt,
      @JsonKey(name: 'confirmed_at')
      @TimestampConverter()
      DateTime? confirmedAt,
      @JsonKey(name: 'delivered_at')
      @TimestampConverter()
      DateTime? deliveredAt,
      @JsonKey(name: 'cancelled_at')
      @TimestampConverter()
      DateTime? cancelledAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? buyerId = null,
    Object? buyerName = null,
    Object? buyerPhone = null,
    Object? farmerId = null,
    Object? farmerName = null,
    Object? deliveryPartnerId = freezed,
    Object? deliveryAddress = null,
    Object? deliveryPincode = null,
    Object? status = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? totalAmount = null,
    Object? notes = freezed,
    Object? placedAt = freezed,
    Object? confirmedAt = freezed,
    Object? deliveredAt = freezed,
    Object? cancelledAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderModelImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      buyerPhone: null == buyerPhone
          ? _value.buyerPhone
          : buyerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      farmerName: null == farmerName
          ? _value.farmerName
          : farmerName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPartnerId: freezed == deliveryPartnerId
          ? _value.deliveryPartnerId
          : deliveryPartnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPincode: null == deliveryPincode
          ? _value.deliveryPincode
          : deliveryPincode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      placedAt: freezed == placedAt
          ? _value.placedAt
          : placedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
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
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
      {@JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'buyer_id') required this.buyerId,
      @JsonKey(name: 'buyer_name') this.buyerName = '',
      @JsonKey(name: 'buyer_phone') this.buyerPhone = '',
      @JsonKey(name: 'farmer_id') required this.farmerId,
      @JsonKey(name: 'farmer_name') this.farmerName = '',
      @JsonKey(name: 'delivery_partner_id') this.deliveryPartnerId,
      @JsonKey(name: 'delivery_address') this.deliveryAddress = '',
      @JsonKey(name: 'delivery_pincode') this.deliveryPincode = '',
      this.status = 'placed',
      @JsonKey(name: 'payment_status') this.paymentStatus = 'pending',
      @JsonKey(name: 'payment_method') this.paymentMethod = 'cod',
      this.subtotal = 0,
      @JsonKey(name: 'delivery_fee') this.deliveryFee = 0,
      @JsonKey(name: 'total_amount') this.totalAmount = 0,
      this.notes,
      @JsonKey(name: 'placed_at') @TimestampConverter() this.placedAt,
      @JsonKey(name: 'confirmed_at') @TimestampConverter() this.confirmedAt,
      @JsonKey(name: 'delivered_at') @TimestampConverter() this.deliveredAt,
      @JsonKey(name: 'cancelled_at') @TimestampConverter() this.cancelledAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @override
  @JsonKey(name: 'buyer_name')
  final String buyerName;
  @override
  @JsonKey(name: 'buyer_phone')
  final String buyerPhone;
  @override
  @JsonKey(name: 'farmer_id')
  final String farmerId;
  @override
  @JsonKey(name: 'farmer_name')
  final String farmerName;
  @override
  @JsonKey(name: 'delivery_partner_id')
  final String? deliveryPartnerId;
  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  @JsonKey(name: 'delivery_pincode')
  final String deliveryPincode;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey(name: 'delivery_fee')
  final double deliveryFee;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'placed_at')
  @TimestampConverter()
  final DateTime? placedAt;
  @override
  @JsonKey(name: 'confirmed_at')
  @TimestampConverter()
  final DateTime? confirmedAt;
  @override
  @JsonKey(name: 'delivered_at')
  @TimestampConverter()
  final DateTime? deliveredAt;
  @override
  @JsonKey(name: 'cancelled_at')
  @TimestampConverter()
  final DateTime? cancelledAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, buyerId: $buyerId, buyerName: $buyerName, buyerPhone: $buyerPhone, farmerId: $farmerId, farmerName: $farmerName, deliveryPartnerId: $deliveryPartnerId, deliveryAddress: $deliveryAddress, deliveryPincode: $deliveryPincode, status: $status, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, subtotal: $subtotal, deliveryFee: $deliveryFee, totalAmount: $totalAmount, notes: $notes, placedAt: $placedAt, confirmedAt: $confirmedAt, deliveredAt: $deliveredAt, cancelledAt: $cancelledAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.buyerPhone, buyerPhone) ||
                other.buyerPhone == buyerPhone) &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.farmerName, farmerName) ||
                other.farmerName == farmerName) &&
            (identical(other.deliveryPartnerId, deliveryPartnerId) ||
                other.deliveryPartnerId == deliveryPartnerId) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryPincode, deliveryPincode) ||
                other.deliveryPincode == deliveryPincode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.placedAt, placedAt) ||
                other.placedAt == placedAt) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orderId,
        buyerId,
        buyerName,
        buyerPhone,
        farmerId,
        farmerName,
        deliveryPartnerId,
        deliveryAddress,
        deliveryPincode,
        status,
        paymentStatus,
        paymentMethod,
        subtotal,
        deliveryFee,
        totalAmount,
        notes,
        placedAt,
        confirmedAt,
        deliveredAt,
        cancelledAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {@JsonKey(name: 'order_id') required final String orderId,
      @JsonKey(name: 'buyer_id') required final String buyerId,
      @JsonKey(name: 'buyer_name') final String buyerName,
      @JsonKey(name: 'buyer_phone') final String buyerPhone,
      @JsonKey(name: 'farmer_id') required final String farmerId,
      @JsonKey(name: 'farmer_name') final String farmerName,
      @JsonKey(name: 'delivery_partner_id') final String? deliveryPartnerId,
      @JsonKey(name: 'delivery_address') final String deliveryAddress,
      @JsonKey(name: 'delivery_pincode') final String deliveryPincode,
      final String status,
      @JsonKey(name: 'payment_status') final String paymentStatus,
      @JsonKey(name: 'payment_method') final String paymentMethod,
      final double subtotal,
      @JsonKey(name: 'delivery_fee') final double deliveryFee,
      @JsonKey(name: 'total_amount') final double totalAmount,
      final String? notes,
      @JsonKey(name: 'placed_at')
      @TimestampConverter()
      final DateTime? placedAt,
      @JsonKey(name: 'confirmed_at')
      @TimestampConverter()
      final DateTime? confirmedAt,
      @JsonKey(name: 'delivered_at')
      @TimestampConverter()
      final DateTime? deliveredAt,
      @JsonKey(name: 'cancelled_at')
      @TimestampConverter()
      final DateTime? cancelledAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'buyer_id')
  String get buyerId;
  @override
  @JsonKey(name: 'buyer_name')
  String get buyerName;
  @override
  @JsonKey(name: 'buyer_phone')
  String get buyerPhone;
  @override
  @JsonKey(name: 'farmer_id')
  String get farmerId;
  @override
  @JsonKey(name: 'farmer_name')
  String get farmerName;
  @override
  @JsonKey(name: 'delivery_partner_id')
  String? get deliveryPartnerId;
  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  @JsonKey(name: 'delivery_pincode')
  String get deliveryPincode;
  @override
  String get status;
  @override
  @JsonKey(name: 'payment_status')
  String get paymentStatus;
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'delivery_fee')
  double get deliveryFee;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'placed_at')
  @TimestampConverter()
  DateTime? get placedAt;
  @override
  @JsonKey(name: 'confirmed_at')
  @TimestampConverter()
  DateTime? get confirmedAt;
  @override
  @JsonKey(name: 'delivered_at')
  @TimestampConverter()
  DateTime? get deliveredAt;
  @override
  @JsonKey(name: 'cancelled_at')
  @TimestampConverter()
  DateTime? get cancelledAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_title')
  String get productTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_image')
  String get productImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_unit')
  double get pricePerUnit => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'line_total')
  double get lineTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) then) =
      _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_title') String productTitle,
      @JsonKey(name: 'product_image') String productImage,
      @JsonKey(name: 'price_per_unit') double pricePerUnit,
      String unit,
      double quantity,
      @JsonKey(name: 'line_total') double lineTotal});
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productTitle = null,
    Object? productImage = null,
    Object? pricePerUnit = null,
    Object? unit = null,
    Object? quantity = null,
    Object? lineTotal = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productTitle: null == productTitle
          ? _value.productTitle
          : productTitle // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      lineTotal: null == lineTotal
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(_$OrderItemModelImpl value,
          $Res Function(_$OrderItemModelImpl) then) =
      __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_title') String productTitle,
      @JsonKey(name: 'product_image') String productImage,
      @JsonKey(name: 'price_per_unit') double pricePerUnit,
      String unit,
      double quantity,
      @JsonKey(name: 'line_total') double lineTotal});
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
      _$OrderItemModelImpl _value, $Res Function(_$OrderItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productTitle = null,
    Object? productImage = null,
    Object? pricePerUnit = null,
    Object? unit = null,
    Object? quantity = null,
    Object? lineTotal = null,
  }) {
    return _then(_$OrderItemModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productTitle: null == productTitle
          ? _value.productTitle
          : productTitle // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      lineTotal: null == lineTotal
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl implements _OrderItemModel {
  const _$OrderItemModelImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_title') this.productTitle = '',
      @JsonKey(name: 'product_image') this.productImage = '',
      @JsonKey(name: 'price_per_unit') required this.pricePerUnit,
      this.unit = 'kg',
      required this.quantity,
      @JsonKey(name: 'line_total') this.lineTotal = 0});

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_title')
  final String productTitle;
  @override
  @JsonKey(name: 'product_image')
  final String productImage;
  @override
  @JsonKey(name: 'price_per_unit')
  final double pricePerUnit;
  @override
  @JsonKey()
  final String unit;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'line_total')
  final double lineTotal;

  @override
  String toString() {
    return 'OrderItemModel(productId: $productId, productTitle: $productTitle, productImage: $productImage, pricePerUnit: $pricePerUnit, unit: $unit, quantity: $quantity, lineTotal: $lineTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productTitle, productTitle) ||
                other.productTitle == productTitle) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.pricePerUnit, pricePerUnit) ||
                other.pricePerUnit == pricePerUnit) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productTitle,
      productImage, pricePerUnit, unit, quantity, lineTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemModel implements OrderItemModel {
  const factory _OrderItemModel(
          {@JsonKey(name: 'product_id') required final String productId,
          @JsonKey(name: 'product_title') final String productTitle,
          @JsonKey(name: 'product_image') final String productImage,
          @JsonKey(name: 'price_per_unit') required final double pricePerUnit,
          final String unit,
          required final double quantity,
          @JsonKey(name: 'line_total') final double lineTotal}) =
      _$OrderItemModelImpl;

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_title')
  String get productTitle;
  @override
  @JsonKey(name: 'product_image')
  String get productImage;
  @override
  @JsonKey(name: 'price_per_unit')
  double get pricePerUnit;
  @override
  String get unit;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'line_total')
  double get lineTotal;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
