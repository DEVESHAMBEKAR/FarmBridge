// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return _CartModel.fromJson(json);
}

/// @nodoc
mixin _$CartModel {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_count')
  int get itemCount => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'item_count') int itemCount,
      double subtotal,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? itemCount = null,
    Object? subtotal = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
          _$CartModelImpl value, $Res Function(_$CartModelImpl) then) =
      __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'item_count') int itemCount,
      double subtotal,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
      _$CartModelImpl _value, $Res Function(_$CartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? itemCount = null,
    Object? subtotal = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CartModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartModelImpl implements _CartModel {
  const _$CartModelImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'item_count') this.itemCount = 0,
      this.subtotal = 0,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt});

  factory _$CartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'item_count')
  final int itemCount;
  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CartModel(userId: $userId, itemCount: $itemCount, subtotal: $subtotal, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, itemCount, subtotal, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartModelImplToJson(
      this,
    );
  }
}

abstract class _CartModel implements CartModel {
  const factory _CartModel(
      {@JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'item_count') final int itemCount,
      final double subtotal,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$CartModelImpl;

  factory _CartModel.fromJson(Map<String, dynamic> json) =
      _$CartModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'item_count')
  int get itemCount;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) {
  return _CartItemModel.fromJson(json);
}

/// @nodoc
mixin _$CartItemModel {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_id')
  String get farmerId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_unit')
  double get pricePerUnit => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'line_total')
  double get lineTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemModelCopyWith<CartItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemModelCopyWith<$Res> {
  factory $CartItemModelCopyWith(
          CartItemModel value, $Res Function(CartItemModel) then) =
      _$CartItemModelCopyWithImpl<$Res, CartItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'farmer_id') String farmerId,
      String title,
      String image,
      @JsonKey(name: 'price_per_unit') double pricePerUnit,
      String unit,
      double quantity,
      @JsonKey(name: 'line_total') double lineTotal});
}

/// @nodoc
class _$CartItemModelCopyWithImpl<$Res, $Val extends CartItemModel>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? farmerId = null,
    Object? title = null,
    Object? image = null,
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
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CartItemModelImplCopyWith<$Res>
    implements $CartItemModelCopyWith<$Res> {
  factory _$$CartItemModelImplCopyWith(
          _$CartItemModelImpl value, $Res Function(_$CartItemModelImpl) then) =
      __$$CartItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'farmer_id') String farmerId,
      String title,
      String image,
      @JsonKey(name: 'price_per_unit') double pricePerUnit,
      String unit,
      double quantity,
      @JsonKey(name: 'line_total') double lineTotal});
}

/// @nodoc
class __$$CartItemModelImplCopyWithImpl<$Res>
    extends _$CartItemModelCopyWithImpl<$Res, _$CartItemModelImpl>
    implements _$$CartItemModelImplCopyWith<$Res> {
  __$$CartItemModelImplCopyWithImpl(
      _$CartItemModelImpl _value, $Res Function(_$CartItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? farmerId = null,
    Object? title = null,
    Object? image = null,
    Object? pricePerUnit = null,
    Object? unit = null,
    Object? quantity = null,
    Object? lineTotal = null,
  }) {
    return _then(_$CartItemModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
class _$CartItemModelImpl implements _CartItemModel {
  const _$CartItemModelImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'farmer_id') required this.farmerId,
      this.title = '',
      this.image = '',
      @JsonKey(name: 'price_per_unit') required this.pricePerUnit,
      this.unit = 'kg',
      required this.quantity,
      @JsonKey(name: 'line_total') this.lineTotal = 0});

  factory _$CartItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'farmer_id')
  final String farmerId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String image;
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
    return 'CartItemModel(productId: $productId, farmerId: $farmerId, title: $title, image: $image, pricePerUnit: $pricePerUnit, unit: $unit, quantity: $quantity, lineTotal: $lineTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
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
  int get hashCode => Object.hash(runtimeType, productId, farmerId, title,
      image, pricePerUnit, unit, quantity, lineTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemModelImplCopyWith<_$CartItemModelImpl> get copyWith =>
      __$$CartItemModelImplCopyWithImpl<_$CartItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemModelImplToJson(
      this,
    );
  }
}

abstract class _CartItemModel implements CartItemModel {
  const factory _CartItemModel(
          {@JsonKey(name: 'product_id') required final String productId,
          @JsonKey(name: 'farmer_id') required final String farmerId,
          final String title,
          final String image,
          @JsonKey(name: 'price_per_unit') required final double pricePerUnit,
          final String unit,
          required final double quantity,
          @JsonKey(name: 'line_total') final double lineTotal}) =
      _$CartItemModelImpl;

  factory _CartItemModel.fromJson(Map<String, dynamic> json) =
      _$CartItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'farmer_id')
  String get farmerId;
  @override
  String get title;
  @override
  String get image;
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
  _$$CartItemModelImplCopyWith<_$CartItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
