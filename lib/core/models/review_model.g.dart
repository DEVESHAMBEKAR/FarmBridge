// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      reviewId: json['review_id'] as String,
      productId: json['product_id'] as String,
      buyerId: json['buyer_id'] as String,
      buyerName: json['buyer_name'] as String? ?? '',
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'product_id': instance.productId,
      'buyer_id': instance.buyerId,
      'buyer_name': instance.buyerName,
      'rating': instance.rating,
      'comment': instance.comment,
      'images': instance.images,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
