import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
class TripModel with _$TripModel {
  const factory TripModel({
    @JsonKey(name: 'trip_id') required String tripId,
    @JsonKey(name: 'job_id') required String jobId,
    @JsonKey(name: 'transporter_id') required String transporterId,
    
    // Live Location
    @JsonKey(name: 'current_latitude') double? currentLatitude,
    @JsonKey(name: 'current_longitude') double? currentLongitude,
    @JsonKey(name: 'heading') double? heading,
    
    // Status: 'EN_ROUTE_TO_PICKUP', 'AT_PICKUP', 'EN_ROUTE_TO_DELIVERY', 'DELIVERED', 'COMPLETED'
    @Default('EN_ROUTE_TO_PICKUP') String status,
    
    // ETA information
    @JsonKey(name: 'estimated_arrival_time') @TimestampConverter() DateTime? estimatedArrivalTime,
    @JsonKey(name: 'distance_remaining_km') double? distanceRemainingKm,
    
    @JsonKey(name: 'started_at') @TimestampConverter() DateTime? startedAt,
    @JsonKey(name: 'picked_up_at') @TimestampConverter() DateTime? pickedUpAt,
    @JsonKey(name: 'delivered_at') @TimestampConverter() DateTime? deliveredAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, dynamic> json) => _$TripModelFromJson(json);
}
