import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';
import '../constants/firestore_collections.dart';

part 'deal_model.freezed.dart';
part 'deal_model.g.dart';

@freezed
class DealModel with _$DealModel {
  const factory DealModel({
    @JsonKey(name: 'deal_id') required String dealId,
    @JsonKey(name: 'requirement_id') String? requirementId,
    @JsonKey(name: 'farmer_id') required String farmerId,
    @JsonKey(name: 'buyer_id') required String buyerId,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'product_name') required String productName,
    required double quantity,
    @JsonKey(name: 'agreed_price_per_unit') required double agreedPricePerUnit,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'pickup_address') required String pickupAddress,
    @JsonKey(name: 'delivery_address') required String deliveryAddress,
    @JsonKey(name: 'expected_pickup_date') @TimestampNonNullConverter() required DateTime expectedPickupDate,
    @JsonKey(name: 'expected_delivery_date') @TimestampNonNullConverter() required DateTime expectedDeliveryDate,
    @JsonKey(name: 'payment_status') required String paymentStatus,
    @JsonKey(name: 'transport_status') required String transportStatus,
    @JsonKey(name: 'deal_status') @Default(DealStatus.negotiating) String dealStatus,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _DealModel;

  factory DealModel.fromJson(Map<String, dynamic> json) => _$DealModelFromJson(json);
}
