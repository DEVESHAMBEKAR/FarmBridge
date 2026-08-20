import 'package:freezed_annotation/freezed_annotation.dart';

part 'logistics_provider_model.freezed.dart';
part 'logistics_provider_model.g.dart';

@freezed
class LogisticsProviderModel with _$LogisticsProviderModel {
  const factory LogisticsProviderModel({
    @JsonKey(name: 'provider_id') required String providerId,
    required String name,
    String? logo,
    @JsonKey(name: 'provider_type') required String providerType,
    @JsonKey(name: 'api_enabled') @Default(false) bool apiEnabled,
    @JsonKey(name: 'booking_enabled') @Default(true) bool bookingEnabled,
    @JsonKey(name: 'tracking_enabled') @Default(false) bool trackingEnabled,
    @JsonKey(name: 'pricing_enabled') @Default(false) bool pricingEnabled,
    @JsonKey(name: 'service_areas') @Default([]) List<String> serviceAreas,
    @JsonKey(name: 'vehicle_types') @Default([]) List<String> vehicleTypes,
    @Default('ACTIVE') String status,
  }) = _LogisticsProviderModel;

  factory LogisticsProviderModel.fromJson(Map<String, dynamic> json) => _$LogisticsProviderModelFromJson(json);
}
