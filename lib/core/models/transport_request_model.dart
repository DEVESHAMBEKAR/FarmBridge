import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'transport_request_model.freezed.dart';
part 'transport_request_model.g.dart';

@freezed
class TransportRequestModel with _$TransportRequestModel {
  const factory TransportRequestModel({
    @JsonKey(name: 'request_id') required String requestId,
    @JsonKey(name: 'order_id') String? orderId,
    @JsonKey(name: 'deal_id') String? dealId,
    @JsonKey(name: 'farmer_id') required String farmerId,
    @JsonKey(name: 'buyer_id') required String buyerId,
    @JsonKey(name: 'pickup_location') required String pickupLocation,
    @JsonKey(name: 'pickup_latitude') double? pickupLatitude,
    @JsonKey(name: 'pickup_longitude') double? pickupLongitude,
    @JsonKey(name: 'delivery_location') required String deliveryLocation,
    @JsonKey(name: 'delivery_latitude') double? deliveryLatitude,
    @JsonKey(name: 'delivery_longitude') double? deliveryLongitude,
    @JsonKey(name: 'product_type') required String productType,
    @JsonKey(name: 'total_weight') required double totalWeight,
    @JsonKey(name: 'package_count') required int packageCount,
    @JsonKey(name: 'package_dimensions') String? packageDimensions,
    @JsonKey(name: 'required_vehicle_type') required String requiredVehicleType,
    @JsonKey(name: 'refrigeration_required') @Default(false) bool refrigerationRequired,
    @JsonKey(name: 'special_instructions') String? specialInstructions,
    @JsonKey(name: 'pickup_ready_at') @TimestampConverter() DateTime? pickupReadyAt,
    @JsonKey(name: 'preferred_pickup_time') String? preferredPickupTime,
    @Default('PENDING') String status,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _TransportRequestModel;

  factory TransportRequestModel.fromJson(Map<String, dynamic> json) => _$TransportRequestModelFromJson(json);
}
