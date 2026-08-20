// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransportRequestModelImpl _$$TransportRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransportRequestModelImpl(
      requestId: json['request_id'] as String,
      orderId: json['order_id'] as String?,
      dealId: json['deal_id'] as String?,
      farmerId: json['farmer_id'] as String,
      buyerId: json['buyer_id'] as String,
      pickupLocation: json['pickup_location'] as String,
      pickupLatitude: (json['pickup_latitude'] as num?)?.toDouble(),
      pickupLongitude: (json['pickup_longitude'] as num?)?.toDouble(),
      deliveryLocation: json['delivery_location'] as String,
      deliveryLatitude: (json['delivery_latitude'] as num?)?.toDouble(),
      deliveryLongitude: (json['delivery_longitude'] as num?)?.toDouble(),
      productType: json['product_type'] as String,
      totalWeight: (json['total_weight'] as num).toDouble(),
      packageCount: (json['package_count'] as num).toInt(),
      packageDimensions: json['package_dimensions'] as String?,
      requiredVehicleType: json['required_vehicle_type'] as String,
      refrigerationRequired: json['refrigeration_required'] as bool? ?? false,
      specialInstructions: json['special_instructions'] as String?,
      pickupReadyAt: const TimestampConverter()
          .fromJson(json['pickup_ready_at'] as Timestamp?),
      preferredPickupTime: json['preferred_pickup_time'] as String?,
      status: json['status'] as String? ?? 'PENDING',
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$TransportRequestModelImplToJson(
        _$TransportRequestModelImpl instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'order_id': instance.orderId,
      'deal_id': instance.dealId,
      'farmer_id': instance.farmerId,
      'buyer_id': instance.buyerId,
      'pickup_location': instance.pickupLocation,
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'delivery_location': instance.deliveryLocation,
      'delivery_latitude': instance.deliveryLatitude,
      'delivery_longitude': instance.deliveryLongitude,
      'product_type': instance.productType,
      'total_weight': instance.totalWeight,
      'package_count': instance.packageCount,
      'package_dimensions': instance.packageDimensions,
      'required_vehicle_type': instance.requiredVehicleType,
      'refrigeration_required': instance.refrigerationRequired,
      'special_instructions': instance.specialInstructions,
      'pickup_ready_at':
          const TimestampConverter().toJson(instance.pickupReadyAt),
      'preferred_pickup_time': instance.preferredPickupTime,
      'status': instance.status,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
