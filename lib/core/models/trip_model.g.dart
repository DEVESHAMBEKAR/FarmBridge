// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripModelImpl _$$TripModelImplFromJson(Map<String, dynamic> json) =>
    _$TripModelImpl(
      tripId: json['trip_id'] as String,
      jobId: json['job_id'] as String,
      transporterId: json['transporter_id'] as String,
      currentLatitude: (json['current_latitude'] as num?)?.toDouble(),
      currentLongitude: (json['current_longitude'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      status: json['status'] as String? ?? 'EN_ROUTE_TO_PICKUP',
      estimatedArrivalTime: const TimestampConverter()
          .fromJson(json['estimated_arrival_time'] as Timestamp?),
      distanceRemainingKm: (json['distance_remaining_km'] as num?)?.toDouble(),
      startedAt:
          const TimestampConverter().fromJson(json['started_at'] as Timestamp?),
      pickedUpAt: const TimestampConverter()
          .fromJson(json['picked_up_at'] as Timestamp?),
      deliveredAt: const TimestampConverter()
          .fromJson(json['delivered_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$TripModelImplToJson(_$TripModelImpl instance) =>
    <String, dynamic>{
      'trip_id': instance.tripId,
      'job_id': instance.jobId,
      'transporter_id': instance.transporterId,
      'current_latitude': instance.currentLatitude,
      'current_longitude': instance.currentLongitude,
      'heading': instance.heading,
      'status': instance.status,
      'estimated_arrival_time':
          const TimestampConverter().toJson(instance.estimatedArrivalTime),
      'distance_remaining_km': instance.distanceRemainingKm,
      'started_at': const TimestampConverter().toJson(instance.startedAt),
      'picked_up_at': const TimestampConverter().toJson(instance.pickedUpAt),
      'delivered_at': const TimestampConverter().toJson(instance.deliveredAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
