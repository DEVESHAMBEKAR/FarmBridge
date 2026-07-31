// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productId: json['product_id'] as String,
      farmerId: json['farmer_id'] as String,
      farmerName: json['farmer_name'] as String? ?? '',
      farmerPhotoUrl: json['farmer_photo_url'] as String?,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? 'other',
      pricePerUnit: (json['price_per_unit'] as num).toDouble(),
      unit: json['unit'] as String? ?? 'kg',
      minOrderQuantity: (json['min_order_quantity'] as num?)?.toDouble() ?? 1,
      availableQuantity: (json['available_quantity'] as num?)?.toDouble() ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isOrganic: json['is_organic'] as bool? ?? false,
      harvestDate: const TimestampConverter()
          .fromJson(json['harvest_date'] as Timestamp?),
      expiryDate: const TimestampConverter()
          .fromJson(json['expiry_date'] as Timestamp?),
      locationName: json['location_name'] as String? ?? '',
      status: json['status'] as String? ?? 'active',
      totalSold: (json['total_sold'] as num?)?.toInt() ?? 0,
      averageRating: (json['average_rating'] as num?)?.toDouble() ?? 0,
      reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'farmer_id': instance.farmerId,
      'farmer_name': instance.farmerName,
      'farmer_photo_url': instance.farmerPhotoUrl,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price_per_unit': instance.pricePerUnit,
      'unit': instance.unit,
      'min_order_quantity': instance.minOrderQuantity,
      'available_quantity': instance.availableQuantity,
      'images': instance.images,
      'is_organic': instance.isOrganic,
      'harvest_date': const TimestampConverter().toJson(instance.harvestDate),
      'expiry_date': const TimestampConverter().toJson(instance.expiryDate),
      'location_name': instance.locationName,
      'status': instance.status,
      'total_sold': instance.totalSold,
      'average_rating': instance.averageRating,
      'review_count': instance.reviewCount,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
