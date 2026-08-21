import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'buyer_id') required String buyerId,
    @JsonKey(name: 'buyer_name') @Default('') String buyerName,
    @JsonKey(name: 'buyer_phone') @Default('') String buyerPhone,
    @JsonKey(name: 'farmer_id') required String farmerId,
    @JsonKey(name: 'farmer_name') @Default('') String farmerName,
    @JsonKey(name: 'delivery_partner_id') String? deliveryPartnerId,
    @JsonKey(name: 'delivery_latitude') double? deliveryLatitude,
    @JsonKey(name: 'delivery_longitude') double? deliveryLongitude,
    @JsonKey(name: 'delivery_address') @Default('') String deliveryAddress,
    @JsonKey(name: 'delivery_pincode') @Default('') String deliveryPincode,
    @Default('placed') String status,
    @JsonKey(name: 'payment_status') @Default('pending') String paymentStatus,
    @JsonKey(name: 'payment_method') @Default('cod') String paymentMethod,
    @Default(0) double subtotal,
    @JsonKey(name: 'delivery_fee') @Default(0) double deliveryFee,
    @JsonKey(name: 'total_amount') @Default(0) double totalAmount,
    String? notes,
    @JsonKey(name: 'placed_at') @TimestampConverter() DateTime? placedAt,
    @JsonKey(name: 'confirmed_at') @TimestampConverter() DateTime? confirmedAt,
    @JsonKey(name: 'delivered_at') @TimestampConverter() DateTime? deliveredAt,
    @JsonKey(name: 'cancelled_at') @TimestampConverter() DateTime? cancelledAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_title') @Default('') String productTitle,
    @JsonKey(name: 'product_image') @Default('') String productImage,
    @JsonKey(name: 'price_per_unit') required double pricePerUnit,
    @Default('kg') String unit,
    required double quantity,
    @JsonKey(name: 'line_total') @Default(0) double lineTotal,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);
}

