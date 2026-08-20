// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'negotiation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NegotiationModel _$NegotiationModelFromJson(Map<String, dynamic> json) {
  return _NegotiationModel.fromJson(json);
}

/// @nodoc
mixin _$NegotiationModel {
  @JsonKey(name: 'negotiation_id')
  String get negotiationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'requirement_id')
  String? get requirementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deal_id')
  String? get dealId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farmer_id')
  String get farmerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_id')
  String get buyerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_offer_price')
  double get currentOfferPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_offer_by')
  String get currentOfferBy => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<NegotiationMessage> get messages => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NegotiationModelCopyWith<NegotiationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NegotiationModelCopyWith<$Res> {
  factory $NegotiationModelCopyWith(
          NegotiationModel value, $Res Function(NegotiationModel) then) =
      _$NegotiationModelCopyWithImpl<$Res, NegotiationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'negotiation_id') String negotiationId,
      @JsonKey(name: 'requirement_id') String? requirementId,
      @JsonKey(name: 'deal_id') String? dealId,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'current_offer_price') double currentOfferPrice,
      @JsonKey(name: 'current_offer_by') String currentOfferBy,
      String status,
      List<NegotiationMessage> messages,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$NegotiationModelCopyWithImpl<$Res, $Val extends NegotiationModel>
    implements $NegotiationModelCopyWith<$Res> {
  _$NegotiationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? negotiationId = null,
    Object? requirementId = freezed,
    Object? dealId = freezed,
    Object? farmerId = null,
    Object? buyerId = null,
    Object? productId = null,
    Object? currentOfferPrice = null,
    Object? currentOfferBy = null,
    Object? status = null,
    Object? messages = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      negotiationId: null == negotiationId
          ? _value.negotiationId
          : negotiationId // ignore: cast_nullable_to_non_nullable
              as String,
      requirementId: freezed == requirementId
          ? _value.requirementId
          : requirementId // ignore: cast_nullable_to_non_nullable
              as String?,
      dealId: freezed == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String?,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      currentOfferPrice: null == currentOfferPrice
          ? _value.currentOfferPrice
          : currentOfferPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currentOfferBy: null == currentOfferBy
          ? _value.currentOfferBy
          : currentOfferBy // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<NegotiationMessage>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NegotiationModelImplCopyWith<$Res>
    implements $NegotiationModelCopyWith<$Res> {
  factory _$$NegotiationModelImplCopyWith(_$NegotiationModelImpl value,
          $Res Function(_$NegotiationModelImpl) then) =
      __$$NegotiationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'negotiation_id') String negotiationId,
      @JsonKey(name: 'requirement_id') String? requirementId,
      @JsonKey(name: 'deal_id') String? dealId,
      @JsonKey(name: 'farmer_id') String farmerId,
      @JsonKey(name: 'buyer_id') String buyerId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'current_offer_price') double currentOfferPrice,
      @JsonKey(name: 'current_offer_by') String currentOfferBy,
      String status,
      List<NegotiationMessage> messages,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$NegotiationModelImplCopyWithImpl<$Res>
    extends _$NegotiationModelCopyWithImpl<$Res, _$NegotiationModelImpl>
    implements _$$NegotiationModelImplCopyWith<$Res> {
  __$$NegotiationModelImplCopyWithImpl(_$NegotiationModelImpl _value,
      $Res Function(_$NegotiationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? negotiationId = null,
    Object? requirementId = freezed,
    Object? dealId = freezed,
    Object? farmerId = null,
    Object? buyerId = null,
    Object? productId = null,
    Object? currentOfferPrice = null,
    Object? currentOfferBy = null,
    Object? status = null,
    Object? messages = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$NegotiationModelImpl(
      negotiationId: null == negotiationId
          ? _value.negotiationId
          : negotiationId // ignore: cast_nullable_to_non_nullable
              as String,
      requirementId: freezed == requirementId
          ? _value.requirementId
          : requirementId // ignore: cast_nullable_to_non_nullable
              as String?,
      dealId: freezed == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String?,
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      currentOfferPrice: null == currentOfferPrice
          ? _value.currentOfferPrice
          : currentOfferPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currentOfferBy: null == currentOfferBy
          ? _value.currentOfferBy
          : currentOfferBy // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<NegotiationMessage>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NegotiationModelImpl implements _NegotiationModel {
  const _$NegotiationModelImpl(
      {@JsonKey(name: 'negotiation_id') required this.negotiationId,
      @JsonKey(name: 'requirement_id') this.requirementId,
      @JsonKey(name: 'deal_id') this.dealId,
      @JsonKey(name: 'farmer_id') required this.farmerId,
      @JsonKey(name: 'buyer_id') required this.buyerId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'current_offer_price') required this.currentOfferPrice,
      @JsonKey(name: 'current_offer_by') required this.currentOfferBy,
      this.status = DealStatus.negotiating,
      final List<NegotiationMessage> messages = const [],
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt,
      @JsonKey(name: 'updated_at') @TimestampConverter() this.updatedAt})
      : _messages = messages;

  factory _$NegotiationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NegotiationModelImplFromJson(json);

  @override
  @JsonKey(name: 'negotiation_id')
  final String negotiationId;
  @override
  @JsonKey(name: 'requirement_id')
  final String? requirementId;
  @override
  @JsonKey(name: 'deal_id')
  final String? dealId;
  @override
  @JsonKey(name: 'farmer_id')
  final String farmerId;
  @override
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'current_offer_price')
  final double currentOfferPrice;
  @override
  @JsonKey(name: 'current_offer_by')
  final String currentOfferBy;
  @override
  @JsonKey()
  final String status;
  final List<NegotiationMessage> _messages;
  @override
  @JsonKey()
  List<NegotiationMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'NegotiationModel(negotiationId: $negotiationId, requirementId: $requirementId, dealId: $dealId, farmerId: $farmerId, buyerId: $buyerId, productId: $productId, currentOfferPrice: $currentOfferPrice, currentOfferBy: $currentOfferBy, status: $status, messages: $messages, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NegotiationModelImpl &&
            (identical(other.negotiationId, negotiationId) ||
                other.negotiationId == negotiationId) &&
            (identical(other.requirementId, requirementId) ||
                other.requirementId == requirementId) &&
            (identical(other.dealId, dealId) || other.dealId == dealId) &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.currentOfferPrice, currentOfferPrice) ||
                other.currentOfferPrice == currentOfferPrice) &&
            (identical(other.currentOfferBy, currentOfferBy) ||
                other.currentOfferBy == currentOfferBy) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      negotiationId,
      requirementId,
      dealId,
      farmerId,
      buyerId,
      productId,
      currentOfferPrice,
      currentOfferBy,
      status,
      const DeepCollectionEquality().hash(_messages),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NegotiationModelImplCopyWith<_$NegotiationModelImpl> get copyWith =>
      __$$NegotiationModelImplCopyWithImpl<_$NegotiationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NegotiationModelImplToJson(
      this,
    );
  }
}

abstract class _NegotiationModel implements NegotiationModel {
  const factory _NegotiationModel(
      {@JsonKey(name: 'negotiation_id') required final String negotiationId,
      @JsonKey(name: 'requirement_id') final String? requirementId,
      @JsonKey(name: 'deal_id') final String? dealId,
      @JsonKey(name: 'farmer_id') required final String farmerId,
      @JsonKey(name: 'buyer_id') required final String buyerId,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'current_offer_price')
      required final double currentOfferPrice,
      @JsonKey(name: 'current_offer_by') required final String currentOfferBy,
      final String status,
      final List<NegotiationMessage> messages,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @TimestampConverter()
      final DateTime? updatedAt}) = _$NegotiationModelImpl;

  factory _NegotiationModel.fromJson(Map<String, dynamic> json) =
      _$NegotiationModelImpl.fromJson;

  @override
  @JsonKey(name: 'negotiation_id')
  String get negotiationId;
  @override
  @JsonKey(name: 'requirement_id')
  String? get requirementId;
  @override
  @JsonKey(name: 'deal_id')
  String? get dealId;
  @override
  @JsonKey(name: 'farmer_id')
  String get farmerId;
  @override
  @JsonKey(name: 'buyer_id')
  String get buyerId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'current_offer_price')
  double get currentOfferPrice;
  @override
  @JsonKey(name: 'current_offer_by')
  String get currentOfferBy;
  @override
  String get status;
  @override
  List<NegotiationMessage> get messages;
  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NegotiationModelImplCopyWith<_$NegotiationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NegotiationMessage _$NegotiationMessageFromJson(Map<String, dynamic> json) {
  return _NegotiationMessage.fromJson(json);
}

/// @nodoc
mixin _$NegotiationMessage {
  @JsonKey(name: 'sender_id')
  String get senderId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'proposed_price')
  double get proposedPrice => throw _privateConstructorUsedError;
  @TimestampNonNullConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NegotiationMessageCopyWith<NegotiationMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NegotiationMessageCopyWith<$Res> {
  factory $NegotiationMessageCopyWith(
          NegotiationMessage value, $Res Function(NegotiationMessage) then) =
      _$NegotiationMessageCopyWithImpl<$Res, NegotiationMessage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      String message,
      @JsonKey(name: 'proposed_price') double proposedPrice,
      @TimestampNonNullConverter() DateTime timestamp});
}

/// @nodoc
class _$NegotiationMessageCopyWithImpl<$Res, $Val extends NegotiationMessage>
    implements $NegotiationMessageCopyWith<$Res> {
  _$NegotiationMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? message = null,
    Object? proposedPrice = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      proposedPrice: null == proposedPrice
          ? _value.proposedPrice
          : proposedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NegotiationMessageImplCopyWith<$Res>
    implements $NegotiationMessageCopyWith<$Res> {
  factory _$$NegotiationMessageImplCopyWith(_$NegotiationMessageImpl value,
          $Res Function(_$NegotiationMessageImpl) then) =
      __$$NegotiationMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      String message,
      @JsonKey(name: 'proposed_price') double proposedPrice,
      @TimestampNonNullConverter() DateTime timestamp});
}

/// @nodoc
class __$$NegotiationMessageImplCopyWithImpl<$Res>
    extends _$NegotiationMessageCopyWithImpl<$Res, _$NegotiationMessageImpl>
    implements _$$NegotiationMessageImplCopyWith<$Res> {
  __$$NegotiationMessageImplCopyWithImpl(_$NegotiationMessageImpl _value,
      $Res Function(_$NegotiationMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? message = null,
    Object? proposedPrice = null,
    Object? timestamp = null,
  }) {
    return _then(_$NegotiationMessageImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      proposedPrice: null == proposedPrice
          ? _value.proposedPrice
          : proposedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NegotiationMessageImpl implements _NegotiationMessage {
  const _$NegotiationMessageImpl(
      {@JsonKey(name: 'sender_id') required this.senderId,
      required this.message,
      @JsonKey(name: 'proposed_price') required this.proposedPrice,
      @TimestampNonNullConverter() required this.timestamp});

  factory _$NegotiationMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$NegotiationMessageImplFromJson(json);

  @override
  @JsonKey(name: 'sender_id')
  final String senderId;
  @override
  final String message;
  @override
  @JsonKey(name: 'proposed_price')
  final double proposedPrice;
  @override
  @TimestampNonNullConverter()
  final DateTime timestamp;

  @override
  String toString() {
    return 'NegotiationMessage(senderId: $senderId, message: $message, proposedPrice: $proposedPrice, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NegotiationMessageImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.proposedPrice, proposedPrice) ||
                other.proposedPrice == proposedPrice) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, senderId, message, proposedPrice, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NegotiationMessageImplCopyWith<_$NegotiationMessageImpl> get copyWith =>
      __$$NegotiationMessageImplCopyWithImpl<_$NegotiationMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NegotiationMessageImplToJson(
      this,
    );
  }
}

abstract class _NegotiationMessage implements NegotiationMessage {
  const factory _NegotiationMessage(
          {@JsonKey(name: 'sender_id') required final String senderId,
          required final String message,
          @JsonKey(name: 'proposed_price') required final double proposedPrice,
          @TimestampNonNullConverter() required final DateTime timestamp}) =
      _$NegotiationMessageImpl;

  factory _NegotiationMessage.fromJson(Map<String, dynamic> json) =
      _$NegotiationMessageImpl.fromJson;

  @override
  @JsonKey(name: 'sender_id')
  String get senderId;
  @override
  String get message;
  @override
  @JsonKey(name: 'proposed_price')
  double get proposedPrice;
  @override
  @TimestampNonNullConverter()
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$NegotiationMessageImplCopyWith<_$NegotiationMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
