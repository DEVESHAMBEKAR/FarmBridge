// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistics_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogisticsJobModelImpl _$$LogisticsJobModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LogisticsJobModelImpl(
      jobId: json['job_id'] as String,
      dealId: json['deal_id'] as String,
      transporterId: json['transporter_id'] as String?,
      pickupLocation: json['pickup_location'] as String,
      dropLocation: json['drop_location'] as String,
      deliveryLatitude: (json['delivery_latitude'] as num?)?.toDouble(),
      deliveryLongitude: (json['delivery_longitude'] as num?)?.toDouble(),
      distanceKm: (json['distance_km'] as num).toDouble(),
      requiredVehicleType: json['required_vehicle_type'] as String,
      expectedPickupTime: const TimestampNonNullConverter()
          .fromJson(json['expected_pickup_time'] as Timestamp),
      expectedDeliveryTime: const TimestampNonNullConverter()
          .fromJson(json['expected_delivery_time'] as Timestamp),
      status: json['status'] as String? ?? 'PENDING',
      offeredFreightAmount: (json['offered_freight_amount'] as num).toDouble(),
      agreedFreightAmount: (json['agreed_freight_amount'] as num?)?.toDouble(),
      activeTripId: json['active_trip_id'] as String?,
      pickupOtp: json['pickup_otp'] as String?,
      deliveryOtp: json['delivery_otp'] as String?,
      proofOfDeliveryUrl: json['proof_of_delivery_url'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$LogisticsJobModelImplToJson(
        _$LogisticsJobModelImpl instance) =>
    <String, dynamic>{
      'job_id': instance.jobId,
      'deal_id': instance.dealId,
      'transporter_id': instance.transporterId,
      'pickup_location': instance.pickupLocation,
      'drop_location': instance.dropLocation,
      'delivery_latitude': instance.deliveryLatitude,
      'delivery_longitude': instance.deliveryLongitude,
      'distance_km': instance.distanceKm,
      'required_vehicle_type': instance.requiredVehicleType,
      'expected_pickup_time':
          const TimestampNonNullConverter().toJson(instance.expectedPickupTime),
      'expected_delivery_time': const TimestampNonNullConverter()
          .toJson(instance.expectedDeliveryTime),
      'status': instance.status,
      'offered_freight_amount': instance.offeredFreightAmount,
      'agreed_freight_amount': instance.agreedFreightAmount,
      'active_trip_id': instance.activeTripId,
      'pickup_otp': instance.pickupOtp,
      'delivery_otp': instance.deliveryOtp,
      'proof_of_delivery_url': instance.proofOfDeliveryUrl,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
