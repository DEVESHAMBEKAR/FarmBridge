// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DealModelImpl _$$DealModelImplFromJson(Map<String, dynamic> json) =>
    _$DealModelImpl(
      dealId: json['deal_id'] as String,
      requirementId: json['requirement_id'] as String?,
      farmerId: json['farmer_id'] as String,
      buyerId: json['buyer_id'] as String,
      productId: json['product_id'] as String?,
      productName: json['product_name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      agreedPricePerUnit: (json['agreed_price_per_unit'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      pickupAddress: json['pickup_address'] as String,
      deliveryAddress: json['delivery_address'] as String,
      expectedPickupDate: const TimestampNonNullConverter()
          .fromJson(json['expected_pickup_date'] as Timestamp),
      expectedDeliveryDate: const TimestampNonNullConverter()
          .fromJson(json['expected_delivery_date'] as Timestamp),
      paymentStatus: json['payment_status'] as String,
      transportStatus: json['transport_status'] as String,
      dealStatus: json['deal_status'] as String? ?? DealStatus.negotiating,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$DealModelImplToJson(_$DealModelImpl instance) =>
    <String, dynamic>{
      'deal_id': instance.dealId,
      'requirement_id': instance.requirementId,
      'farmer_id': instance.farmerId,
      'buyer_id': instance.buyerId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'agreed_price_per_unit': instance.agreedPricePerUnit,
      'total_amount': instance.totalAmount,
      'pickup_address': instance.pickupAddress,
      'delivery_address': instance.deliveryAddress,
      'expected_pickup_date':
          const TimestampNonNullConverter().toJson(instance.expectedPickupDate),
      'expected_delivery_date': const TimestampNonNullConverter()
          .toJson(instance.expectedDeliveryDate),
      'payment_status': instance.paymentStatus,
      'transport_status': instance.transportStatus,
      'deal_status': instance.dealStatus,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
