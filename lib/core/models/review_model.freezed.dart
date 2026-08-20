// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  @JsonKey(name: 'review_id')
  String get reviewId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_id')
  String get buyerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_name')
  String get buyerName => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'review_id') String reviewId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'buyer_name') String buyerName,
      int rating,
      String comment,
      List<String> images,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? productId = null,
    Object? buyerId = null,
    Object? buyerName = null,
    Object? rating = null,
    Object? comment = null,
    Object? images = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewModelImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelImplCopyWith(
          _$ReviewModelImpl value, $Res Function(_$ReviewModelImpl) then) =
      __$$ReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'review_id') String reviewId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'buyer_name') String buyerName,
      int rating,
      String comment,
      List<String> images,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$ReviewModelImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelImpl>
    implements _$$ReviewModelImplCopyWith<$Res> {
  __$$ReviewModelImplCopyWithImpl(
      _$ReviewModelImpl _value, $Res Function(_$ReviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? productId = null,
    Object? buyerId = null,
    Object? buyerName = null,
    Object? rating = null,
    Object? comment = null,
    Object? images = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ReviewModelImpl(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewModelImpl implements _ReviewModel {
  const _$ReviewModelImpl(
      {@JsonKey(name: 'review_id') required this.reviewId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'buyer_id') required this.buyerId,
      @JsonKey(name: 'buyer_name') this.buyerName = '',
      required this.rating,
      this.comment = '',
      final List<String> images = const [],
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt})
      : _images = images;

  factory _$ReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelImplFromJson(json);

  @override
  @JsonKey(name: 'review_id')
  final String reviewId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @override
  @JsonKey(name: 'buyer_name')
  final String buyerName;
  @override
  final int rating;
  @override
  @JsonKey()
  final String comment;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ReviewModel(reviewId: $reviewId, productId: $productId, buyerId: $buyerId, buyerName: $buyerName, rating: $rating, comment: $comment, images: $images, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewId,
      productId,
      buyerId,
      buyerName,
      rating,
      comment,
      const DeepCollectionEquality().hash(_images),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      __$$ReviewModelImplCopyWithImpl<_$ReviewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewModel implements ReviewModel {
  const factory _ReviewModel(
      {@JsonKey(name: 'review_id') required final String reviewId,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'buyer_id') required final String buyerId,
      @JsonKey(name: 'buyer_name') final String buyerName,
      required final int rating,
      final String comment,
      final List<String> images,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt}) = _$ReviewModelImpl;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$ReviewModelImpl.fromJson;

  @override
  @JsonKey(name: 'review_id')
  String get reviewId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'buyer_id')
  String get buyerId;
  @override
  @JsonKey(name: 'buyer_name')
  String get buyerName;
  @override
  int get rating;
  @override
  String get comment;
  @override
  List<String> get images;
  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
