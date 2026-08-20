// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'negotiation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NegotiationModelImpl _$$NegotiationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NegotiationModelImpl(
      negotiationId: json['negotiation_id'] as String,
      requirementId: json['requirement_id'] as String?,
      dealId: json['deal_id'] as String?,
      farmerId: json['farmer_id'] as String,
      buyerId: json['buyer_id'] as String,
      productId: json['product_id'] as String,
      currentOfferPrice: (json['current_offer_price'] as num).toDouble(),
      currentOfferBy: json['current_offer_by'] as String,
      status: json['status'] as String? ?? DealStatus.negotiating,
      messages: (json['messages'] as List<dynamic>?)
              ?.map(
                  (e) => NegotiationMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$$NegotiationModelImplToJson(
        _$NegotiationModelImpl instance) =>
    <String, dynamic>{
      'negotiation_id': instance.negotiationId,
      'requirement_id': instance.requirementId,
      'deal_id': instance.dealId,
      'farmer_id': instance.farmerId,
      'buyer_id': instance.buyerId,
      'product_id': instance.productId,
      'current_offer_price': instance.currentOfferPrice,
      'current_offer_by': instance.currentOfferBy,
      'status': instance.status,
      'messages': instance.messages,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };

_$NegotiationMessageImpl _$$NegotiationMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$NegotiationMessageImpl(
      senderId: json['sender_id'] as String,
      message: json['message'] as String,
      proposedPrice: (json['proposed_price'] as num).toDouble(),
      timestamp: const TimestampNonNullConverter()
          .fromJson(json['timestamp'] as Timestamp),
    );

Map<String, dynamic> _$$NegotiationMessageImplToJson(
        _$NegotiationMessageImpl instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'message': instance.message,
      'proposed_price': instance.proposedPrice,
      'timestamp': const TimestampNonNullConverter().toJson(instance.timestamp),
    };
