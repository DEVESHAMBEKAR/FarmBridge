import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'farmer_id') required String farmerId,
    @JsonKey(name: 'farmer_name') @Default('') String farmerName,
    @JsonKey(name: 'farmer_photo_url') String? farmerPhotoUrl,
    required String title,
    @Default('') String description,
    @Default('other') String category,
    @JsonKey(name: 'listing_type') @Default('retail') String listingType,
    @JsonKey(name: 'price_per_unit') required double pricePerUnit,
    @Default('kg') String unit,
    @JsonKey(name: 'min_order_quantity') @Default(1) double minOrderQuantity,
    @JsonKey(name: 'available_quantity') @Default(0) double availableQuantity,
    @Default([]) List<String> images,
    @JsonKey(name: 'is_organic') @Default(false) bool isOrganic,
    @JsonKey(name: 'harvest_date') @TimestampConverter() DateTime? harvestDate,
    @JsonKey(name: 'expiry_date') @TimestampConverter() DateTime? expiryDate,
    @JsonKey(name: 'location_name') @Default('') String locationName,
    @Default('active') String status,
    @JsonKey(name: 'total_sold') @Default(0) int totalSold,
    @JsonKey(name: 'average_rating') @Default(0) double averageRating,
    @JsonKey(name: 'review_count') @Default(0) int reviewCount,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
