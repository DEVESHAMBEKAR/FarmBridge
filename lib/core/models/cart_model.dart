import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'item_count') @Default(0) int itemCount,
    @Default(0) double subtotal,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
}

@freezed
class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'farmer_id') required String farmerId,
    @Default('') String title,
    @Default('') String image,
    @JsonKey(name: 'price_per_unit') required double pricePerUnit,
    @Default('kg') String unit,
    required double quantity,
    @JsonKey(name: 'line_total') @Default(0) double lineTotal,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);
}
