import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';
import '../constants/firestore_collections.dart';

part 'negotiation_model.freezed.dart';
part 'negotiation_model.g.dart';

@freezed
class NegotiationModel with _$NegotiationModel {
  const factory NegotiationModel({
    @JsonKey(name: 'negotiation_id') required String negotiationId,
    @JsonKey(name: 'requirement_id') String? requirementId,
    @JsonKey(name: 'deal_id') String? dealId,
    @JsonKey(name: 'farmer_id') required String farmerId,
    @JsonKey(name: 'buyer_id') required String buyerId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'current_offer_price') required double currentOfferPrice,
    @JsonKey(name: 'current_offer_by') required String currentOfferBy,
    @Default(DealStatus.negotiating) String status,
    @Default([]) List<NegotiationMessage> messages,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt,
  }) = _NegotiationModel;

  factory NegotiationModel.fromJson(Map<String, dynamic> json) => _$NegotiationModelFromJson(json);
}

@freezed
class NegotiationMessage with _$NegotiationMessage {
  const factory NegotiationMessage({
    @JsonKey(name: 'sender_id') required String senderId,
    required String message,
    @JsonKey(name: 'proposed_price') required double proposedPrice,
    @TimestampNonNullConverter() required DateTime timestamp,
  }) = _NegotiationMessage;

  factory NegotiationMessage.fromJson(Map<String, dynamic> json) => _$NegotiationMessageFromJson(json);
}
