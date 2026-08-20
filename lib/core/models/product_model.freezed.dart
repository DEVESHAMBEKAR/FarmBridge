// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_id')
  String get farmerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_name')
  String get farmerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_photo_url')
  String? get farmerPhotoUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing_type')
  String get listingType => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_unit')
  double get pricePerUnit => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_order_quantity')
  double get minOrderQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_quantity')
  double get availableQuantity => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_organic')
  bool get isOrganic => throw _privateConstructorUsedError;
  @JsonKey(name: 'harvest_date')
  @TimestampConverter()
  DateTime? get harvestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_date')
  @TimestampConverter()
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_name')
  String get locationName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sold')
  int get totalSold => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rating')
  double get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_count')
  int get reviewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'farmer_name') String farmerName,
      @JsonKey(name: 'farmer_photo_url') String? farmerPhotoUrl,
      String title,
      String description,
      String category,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'price_per_unit') double pricePerUnit,
      String unit,
      @JsonKey(name: 'min_order_quantity') double minOrderQuantity,
      @JsonKey(name: 'available_quantity') double availableQuantity,
      List<String> images,
      @JsonKey(name: 'is_organic') bool isOrganic,
      @JsonKey(name: 'harvest_date')
      @TimestampConverter()
      DateTime? harvestDate,
      @JsonKey(name: 'expiry_date') @TimestampConverter() DateTime? expiryDate,
      @JsonKey(name: 'location_name') String locationName,
      String status,
      @JsonKey(name: 'total_sold') int totalSold,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'review_count') int reviewCount,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? farmerId = null,
    Object? farmerName = null,
    Object? farmerPhotoUrl = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? listingType = null,
    Object? pricePerUnit = null,
    Object? unit = null,
    Object? minOrderQuantity = null,
    Object? availableQuantity = null,
    Object? images = null,
    Object? isOrganic = null,
    Object? harvestDate = freezed,
    Object? expiryDate = freezed,
    Object? locationName = null,
    Object? status = null,
    Object? totalSold = null,
    Object? averageRating = null,
    Object? reviewCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      farmerName: null == farmerName
          ? _value.farmerName
          : farmerName // ignore: cast_nullable_to_non_nullable
              as String,
      farmerPhotoUrl: freezed == farmerPhotoUrl
          ? _value.farmerPhotoUrl
          : farmerPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      minOrderQuantity: null == minOrderQuantity
          ? _value.minOrderQuantity
          : minOrderQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isOrganic: null == isOrganic
          ? _value.isOrganic
          : isOrganic // ignore: cast_nullable_to_non_nullable
              as bool,
      harvestDate: freezed == harvestDate
          ? _value.harvestDate
          : harvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalSold: null == totalSold
          ? _value.totalSold
          : totalSold // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'farmer_name') String farmerName,
      @JsonKey(name: 'farmer_photo_url') String? farmerPhotoUrl,
      String title,
      String description,
      String category,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'price_per_unit') double pricePerUnit,
      String unit,
      @JsonKey(name: 'min_order_quantity') double minOrderQuantity,
      @JsonKey(name: 'available_quantity') double availableQuantity,
      List<String> images,
      @JsonKey(name: 'is_organic') bool isOrganic,
      @JsonKey(name: 'harvest_date')
      @TimestampConverter()
      DateTime? harvestDate,
      @JsonKey(name: 'expiry_date') @TimestampConverter() DateTime? expiryDate,
      @JsonKey(name: 'location_name') String locationName,
      String status,
      @JsonKey(name: 'total_sold') int totalSold,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'review_count') int reviewCount,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? farmerId = null,
    Object? farmerName = null,
    Object? farmerPhotoUrl = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? listingType = null,
    Object? pricePerUnit = null,
    Object? unit = null,
    Object? minOrderQuantity = null,
    Object? availableQuantity = null,
    Object? images = null,
    Object? isOrganic = null,
    Object? harvestDate = freezed,
    Object? expiryDate = freezed,
    Object? locationName = null,
    Object? status = null,
    Object? totalSold = null,
    Object? averageRating = null,
    Object? reviewCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      farmerName: null == farmerName
          ? _value.farmerName
          : farmerName // ignore: cast_nullable_to_non_nullable
              as String,
      farmerPhotoUrl: freezed == farmerPhotoUrl
          ? _value.farmerPhotoUrl
          : farmerPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      minOrderQuantity: null == minOrderQuantity
          ? _value.minOrderQuantity
          : minOrderQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isOrganic: null == isOrganic
          ? _value.isOrganic
          : isOrganic // ignore: cast_nullable_to_non_nullable
              as bool,
      harvestDate: freezed == harvestDate
          ? _value.harvestDate
          : harvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalSold: null == totalSold
          ? _value.totalSold
          : totalSold // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'farmer_id') required this.farmerId,
      @JsonKey(name: 'farmer_name') this.farmerName = '',
      @JsonKey(name: 'farmer_photo_url') this.farmerPhotoUrl,
      required this.title,
      this.description = '',
      this.category = 'other',
      @JsonKey(name: 'listing_type') this.listingType = 'retail',
      @JsonKey(name: 'price_per_unit') required this.pricePerUnit,
      this.unit = 'kg',
      @JsonKey(name: 'min_order_quantity') this.minOrderQuantity = 1,
      @JsonKey(name: 'available_quantity') this.availableQuantity = 0,
      final List<String> images = const [],
      @JsonKey(name: 'is_organic') this.isOrganic = false,
      @JsonKey(name: 'harvest_date') @TimestampConverter() this.harvestDate,
      @JsonKey(name: 'expiry_date') @TimestampConverter() this.expiryDate,
      @JsonKey(name: 'location_name') this.locationName = '',
      this.status = 'active',
      @JsonKey(name: 'total_sold') this.totalSold = 0,
      @JsonKey(name: 'average_rating') this.averageRating = 0,
      @JsonKey(name: 'review_count') this.reviewCount = 0,
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt})
      : _images = images;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'farmer_id')
  final String farmerId;
  @override
  @JsonKey(name: 'farmer_name')
  final String farmerName;
  @override
  @JsonKey(name: 'farmer_photo_url')
  final String? farmerPhotoUrl;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey(name: 'listing_type')
  final String listingType;
  @override
  @JsonKey(name: 'price_per_unit')
  final double pricePerUnit;
  @override
  @JsonKey()
  final String unit;
  @override
  @JsonKey(name: 'min_order_quantity')
  final double minOrderQuantity;
  @override
  @JsonKey(name: 'available_quantity')
  final double availableQuantity;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey(name: 'is_organic')
  final bool isOrganic;
  @override
  @JsonKey(name: 'harvest_date')
  @TimestampConverter()
  final DateTime? harvestDate;
  @override
  @JsonKey(name: 'expiry_date')
  @TimestampConverter()
  final DateTime? expiryDate;
  @override
  @JsonKey(name: 'location_name')
  final String locationName;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'total_sold')
  final int totalSold;
  @override
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @override
  @JsonKey(name: 'review_count')
  final int reviewCount;
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
    return 'ProductModel(productId: $productId, farmerId: $farmerId, farmerName: $farmerName, farmerPhotoUrl: $farmerPhotoUrl, title: $title, description: $description, category: $category, listingType: $listingType, pricePerUnit: $pricePerUnit, unit: $unit, minOrderQuantity: $minOrderQuantity, availableQuantity: $availableQuantity, images: $images, isOrganic: $isOrganic, harvestDate: $harvestDate, expiryDate: $expiryDate, locationName: $locationName, status: $status, totalSold: $totalSold, averageRating: $averageRating, reviewCount: $reviewCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.farmerName, farmerName) ||
                other.farmerName == farmerName) &&
            (identical(other.farmerPhotoUrl, farmerPhotoUrl) ||
                other.farmerPhotoUrl == farmerPhotoUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.pricePerUnit, pricePerUnit) ||
                other.pricePerUnit == pricePerUnit) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.minOrderQuantity, minOrderQuantity) ||
                other.minOrderQuantity == minOrderQuantity) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isOrganic, isOrganic) ||
                other.isOrganic == isOrganic) &&
            (identical(other.harvestDate, harvestDate) ||
                other.harvestDate == harvestDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalSold, totalSold) ||
                other.totalSold == totalSold) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productId,
        farmerId,
        farmerName,
        farmerPhotoUrl,
        title,
        description,
        category,
        listingType,
        pricePerUnit,
        unit,
        minOrderQuantity,
        availableQuantity,
        const DeepCollectionEquality().hash(_images),
        isOrganic,
        harvestDate,
        expiryDate,
        locationName,
        status,
        totalSold,
        averageRating,
        reviewCount,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {@JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'farmer_id') required final String farmerId,
      @JsonKey(name: 'farmer_name') final String farmerName,
      @JsonKey(name: 'farmer_photo_url') final String? farmerPhotoUrl,
      required final String title,
      final String description,
      final String category,
      @JsonKey(name: 'listing_type') final String listingType,
      @JsonKey(name: 'price_per_unit') required final double pricePerUnit,
      final String unit,
      @JsonKey(name: 'min_order_quantity') final double minOrderQuantity,
      @JsonKey(name: 'available_quantity') final double availableQuantity,
      final List<String> images,
      @JsonKey(name: 'is_organic') final bool isOrganic,
      @JsonKey(name: 'harvest_date')
      @TimestampConverter()
      final DateTime? harvestDate,
      @JsonKey(name: 'expiry_date')
      @TimestampConverter()
      final DateTime? expiryDate,
      @JsonKey(name: 'location_name') final String locationName,
      final String status,
      @JsonKey(name: 'total_sold') final int totalSold,
      @JsonKey(name: 'average_rating') final double averageRating,
      @JsonKey(name: 'review_count') final int reviewCount,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'farmer_id')
  String get farmerId;
  @override
  @JsonKey(name: 'farmer_name')
  String get farmerName;
  @override
  @JsonKey(name: 'farmer_photo_url')
  String? get farmerPhotoUrl;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  @JsonKey(name: 'listing_type')
  String get listingType;
  @override
  @JsonKey(name: 'price_per_unit')
  double get pricePerUnit;
  @override
  String get unit;
  @override
  @JsonKey(name: 'min_order_quantity')
  double get minOrderQuantity;
  @override
  @JsonKey(name: 'available_quantity')
  double get availableQuantity;
  @override
  List<String> get images;
  @override
  @JsonKey(name: 'is_organic')
  bool get isOrganic;
  @override
  @JsonKey(name: 'harvest_date')
  @TimestampConverter()
  DateTime? get harvestDate;
  @override
  @JsonKey(name: 'expiry_date')
  @TimestampConverter()
  DateTime? get expiryDate;
  @override
  @JsonKey(name: 'location_name')
  String get locationName;
  @override
  String get status;
  @override
  @JsonKey(name: 'total_sold')
  int get totalSold;
  @override
  @JsonKey(name: 'average_rating')
  double get averageRating;
  @override
  @JsonKey(name: 'review_count')
  int get reviewCount;
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
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
