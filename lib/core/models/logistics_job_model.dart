import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';
// import '../constants/firestore_collections.dart'; // Uncomment if there's LogisticsStatus

part 'logistics_job_model.freezed.dart';
part 'logistics_job_model.g.dart';

@freezed
class LogisticsJobModel with _$LogisticsJobModel {
  const factory LogisticsJobModel({
    @JsonKey(name: 'job_id') required String jobId,
    @JsonKey(name: 'deal_id') required String dealId,
    @JsonKey(name: 'transporter_id') String? transporterId,
    @JsonKey(name: 'pickup_location') required String pickupLocation,
    @JsonKey(name: 'drop_location') required String dropLocation,
    @JsonKey(name: 'delivery_latitude') double? deliveryLatitude,
    @JsonKey(name: 'delivery_longitude') double? deliveryLongitude,
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'required_vehicle_type') required String requiredVehicleType,
    @JsonKey(name: 'expected_pickup_time') @TimestampNonNullConverter() required DateTime expectedPickupTime,
    @JsonKey(name: 'expected_delivery_time') @TimestampNonNullConverter() required DateTime expectedDeliveryTime,
    @Default('PENDING') String status,
    @JsonKey(name: 'offered_freight_amount') required double offeredFreightAmount,
    @JsonKey(name: 'agreed_freight_amount') double? agreedFreightAmount,
    @JsonKey(name: 'proof_of_delivery_url') String? proofOfDeliveryUrl,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _LogisticsJobModel;

  factory LogisticsJobModel.fromJson(Map<String, dynamic> json) => _$LogisticsJobModelFromJson(json);
}

