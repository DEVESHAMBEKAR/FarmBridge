// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      orderId: json['order_id'] as String,
      buyerId: json['buyer_id'] as String,
      buyerName: json['buyer_name'] as String? ?? '',
      buyerPhone: json['buyer_phone'] as String? ?? '',
      farmerId: json['farmer_id'] as String,
      farmerName: json['farmer_name'] as String? ?? '',
      deliveryPartnerId: json['delivery_partner_id'] as String?,
      deliveryLatitude: (json['delivery_latitude'] as num?)?.toDouble(),
      deliveryLongitude: (json['delivery_longitude'] as num?)?.toDouble(),
      deliveryAddress: json['delivery_address'] as String? ?? '',
      deliveryPincode: json['delivery_pincode'] as String? ?? '',
      status: json['status'] as String? ?? 'placed',
      paymentStatus: json['payment_status'] as String? ?? 'pending',
      paymentMethod: json['payment_method'] as String? ?? 'cod',
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
      deliveryFee: (json['delivery_fee'] as num?)?.toDouble() ?? 0,
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0,
      notes: json['notes'] as String?,
      placedAt:
          const TimestampConverter().fromJson(json['placed_at'] as Timestamp?),
      confirmedAt: const TimestampConverter()
          .fromJson(json['confirmed_at'] as Timestamp?),
      deliveredAt: const TimestampConverter()
          .fromJson(json['delivered_at'] as Timestamp?),
      cancelledAt: const TimestampConverter()
          .fromJson(json['cancelled_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'buyer_id': instance.buyerId,
      'buyer_name': instance.buyerName,
      'buyer_phone': instance.buyerPhone,
      'farmer_id': instance.farmerId,
      'farmer_name': instance.farmerName,
      'delivery_partner_id': instance.deliveryPartnerId,
      'delivery_latitude': instance.deliveryLatitude,
      'delivery_longitude': instance.deliveryLongitude,
      'delivery_address': instance.deliveryAddress,
      'delivery_pincode': instance.deliveryPincode,
      'status': instance.status,
      'payment_status': instance.paymentStatus,
      'payment_method': instance.paymentMethod,
      'subtotal': instance.subtotal,
      'delivery_fee': instance.deliveryFee,
      'total_amount': instance.totalAmount,
      'notes': instance.notes,
      'placed_at': const TimestampConverter().toJson(instance.placedAt),
      'confirmed_at': const TimestampConverter().toJson(instance.confirmedAt),
      'delivered_at': const TimestampConverter().toJson(instance.deliveredAt),
      'cancelled_at': const TimestampConverter().toJson(instance.cancelledAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      productId: json['product_id'] as String,
      productTitle: json['product_title'] as String? ?? '',
      productImage: json['product_image'] as String? ?? '',
      pricePerUnit: (json['price_per_unit'] as num).toDouble(),
      unit: json['unit'] as String? ?? 'kg',
      quantity: (json['quantity'] as num).toDouble(),
      lineTotal: (json['line_total'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
        _$OrderItemModelImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_title': instance.productTitle,
      'product_image': instance.productImage,
      'price_per_unit': instance.pricePerUnit,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'line_total': instance.lineTotal,
    };
