// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistics_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogisticsProviderModelImpl _$$LogisticsProviderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LogisticsProviderModelImpl(
      providerId: json['provider_id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      providerType: json['provider_type'] as String,
      apiEnabled: json['api_enabled'] as bool? ?? false,
      bookingEnabled: json['booking_enabled'] as bool? ?? true,
      trackingEnabled: json['tracking_enabled'] as bool? ?? false,
      pricingEnabled: json['pricing_enabled'] as bool? ?? false,
      serviceAreas: (json['service_areas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      vehicleTypes: (json['vehicle_types'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: json['status'] as String? ?? 'ACTIVE',
    );

Map<String, dynamic> _$$LogisticsProviderModelImplToJson(
        _$LogisticsProviderModelImpl instance) =>
    <String, dynamic>{
      'provider_id': instance.providerId,
      'name': instance.name,
      'logo': instance.logo,
      'provider_type': instance.providerType,
      'api_enabled': instance.apiEnabled,
      'booking_enabled': instance.bookingEnabled,
      'tracking_enabled': instance.trackingEnabled,
      'pricing_enabled': instance.pricingEnabled,
      'service_areas': instance.serviceAreas,
      'vehicle_types': instance.vehicleTypes,
      'status': instance.status,
    };
