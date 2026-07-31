import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    @JsonKey(name: 'review_id') required String reviewId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'buyer_id') required String buyerId,
    @JsonKey(name: 'buyer_name') @Default('') String buyerName,
    required int rating,
    @Default('') String comment,
    @Default([]) List<String> images,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
