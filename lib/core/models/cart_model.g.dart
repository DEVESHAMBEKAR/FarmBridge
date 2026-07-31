// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      userId: json['user_id'] as String,
      itemCount: (json['item_count'] as num?)?.toInt() ?? 0,
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'item_count': instance.itemCount,
      'subtotal': instance.subtotal,
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };

_$CartItemModelImpl _$$CartItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CartItemModelImpl(
      productId: json['product_id'] as String,
      farmerId: json['farmer_id'] as String,
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      pricePerUnit: (json['price_per_unit'] as num).toDouble(),
      unit: json['unit'] as String? ?? 'kg',
      quantity: (json['quantity'] as num).toDouble(),
      lineTotal: (json['line_total'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CartItemModelImplToJson(_$CartItemModelImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'farmer_id': instance.farmerId,
      'title': instance.title,
      'image': instance.image,
      'price_per_unit': instance.pricePerUnit,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'line_total': instance.lineTotal,
    };
