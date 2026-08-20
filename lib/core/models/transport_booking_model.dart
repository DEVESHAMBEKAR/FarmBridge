import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'transport_booking_model.freezed.dart';
part 'transport_booking_model.g.dart';

@freezed
class TransportBookingModel with _$TransportBookingModel {
  const factory TransportBookingModel({
    @JsonKey(name: 'booking_id') required String bookingId,
    @JsonKey(name: 'transport_request_id') required String transportRequestId,
    @JsonKey(name: 'provider_type') required String providerType, // FARM_BRIDGE or THIRD_PARTY
    @JsonKey(name: 'partner_id') String? partnerId,
    @JsonKey(name: 'provider_id') String? providerId,
    @JsonKey(name: 'external_booking_id') String? externalBookingId,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'driver_phone') String? driverPhone,
    @JsonKey(name: 'vehicle_number') String? vehicleNumber,
    @JsonKey(name: 'tracking_url') String? trackingUrl,
    @JsonKey(name: 'agreed_price') double? agreedPrice,
    @Default('ASSIGNED') String status,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _TransportBookingModel;

  factory TransportBookingModel.fromJson(Map<String, dynamic> json) => _$TransportBookingModelFromJson(json);
}
