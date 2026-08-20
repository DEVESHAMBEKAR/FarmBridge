// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransportBookingModelImpl _$$TransportBookingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransportBookingModelImpl(
      bookingId: json['booking_id'] as String,
      transportRequestId: json['transport_request_id'] as String,
      providerType: json['provider_type'] as String,
      partnerId: json['partner_id'] as String?,
      providerId: json['provider_id'] as String?,
      externalBookingId: json['external_booking_id'] as String?,
      driverName: json['driver_name'] as String?,
      driverPhone: json['driver_phone'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
      trackingUrl: json['tracking_url'] as String?,
      agreedPrice: (json['agreed_price'] as num?)?.toDouble(),
      status: json['status'] as String? ?? 'ASSIGNED',
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$TransportBookingModelImplToJson(
        _$TransportBookingModelImpl instance) =>
    <String, dynamic>{
      'booking_id': instance.bookingId,
      'transport_request_id': instance.transportRequestId,
      'provider_type': instance.providerType,
      'partner_id': instance.partnerId,
      'provider_id': instance.providerId,
      'external_booking_id': instance.externalBookingId,
      'driver_name': instance.driverName,
      'driver_phone': instance.driverPhone,
      'vehicle_number': instance.vehicleNumber,
      'tracking_url': instance.trackingUrl,
      'agreed_price': instance.agreedPrice,
      'status': instance.status,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
