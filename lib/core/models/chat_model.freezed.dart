// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  @JsonKey(name: 'chat_id')
  String get chatId => throw _privateConstructorUsedError;
  List<String> get participants => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_names')
  Map<String, String> get participantNames =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_photos')
  Map<String, String> get participantPhotos =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message')
  String get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message_at')
  @TimestampConverter()
  DateTime? get lastMessageAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_sender_id')
  String get lastSenderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_count')
  Map<String, int> get unreadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ChatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'chat_id') String chatId,
      List<String> participants,
      @JsonKey(name: 'participant_names') Map<String, String> participantNames,
      @JsonKey(name: 'participant_photos')
      Map<String, String> participantPhotos,
      @JsonKey(name: 'last_message') String lastMessage,
      @JsonKey(name: 'last_message_at')
      @TimestampConverter()
      DateTime? lastMessageAt,
      @JsonKey(name: 'last_sender_id') String lastSenderId,
      @JsonKey(name: 'unread_count') Map<String, int> unreadCount,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? participants = null,
    Object? participantNames = null,
    Object? participantPhotos = null,
    Object? lastMessage = null,
    Object? lastMessageAt = freezed,
    Object? lastSenderId = null,
    Object? unreadCount = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      participantNames: null == participantNames
          ? _value.participantNames
          : participantNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      participantPhotos: null == participantPhotos
          ? _value.participantPhotos
          : participantPhotos // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageAt: freezed == lastMessageAt
          ? _value.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSenderId: null == lastSenderId
          ? _value.lastSenderId
          : lastSenderId // ignore: cast_nullable_to_non_nullable
              as String,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'chat_id') String chatId,
      List<String> participants,
      @JsonKey(name: 'participant_names') Map<String, String> participantNames,
      @JsonKey(name: 'participant_photos')
      Map<String, String> participantPhotos,
      @JsonKey(name: 'last_message') String lastMessage,
      @JsonKey(name: 'last_message_at')
      @TimestampConverter()
      DateTime? lastMessageAt,
      @JsonKey(name: 'last_sender_id') String lastSenderId,
      @JsonKey(name: 'unread_count') Map<String, int> unreadCount,
      @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? participants = null,
    Object? participantNames = null,
    Object? participantPhotos = null,
    Object? lastMessage = null,
    Object? lastMessageAt = freezed,
    Object? lastSenderId = null,
    Object? unreadCount = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ChatModelImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      participantNames: null == participantNames
          ? _value._participantNames
          : participantNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      participantPhotos: null == participantPhotos
          ? _value._participantPhotos
          : participantPhotos // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageAt: freezed == lastMessageAt
          ? _value.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSenderId: null == lastSenderId
          ? _value.lastSenderId
          : lastSenderId // ignore: cast_nullable_to_non_nullable
              as String,
      unreadCount: null == unreadCount
          ? _value._unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatModelImpl implements _ChatModel {
  const _$ChatModelImpl(
      {@JsonKey(name: 'chat_id') required this.chatId,
      required final List<String> participants,
      @JsonKey(name: 'participant_names')
      final Map<String, String> participantNames = const {},
      @JsonKey(name: 'participant_photos')
      final Map<String, String> participantPhotos = const {},
      @JsonKey(name: 'last_message') this.lastMessage = '',
      @JsonKey(name: 'last_message_at')
      @TimestampConverter()
      this.lastMessageAt,
      @JsonKey(name: 'last_sender_id') this.lastSenderId = '',
      @JsonKey(name: 'unread_count')
      final Map<String, int> unreadCount = const {},
      @JsonKey(name: 'created_at') @TimestampConverter() this.createdAt})
      : _participants = participants,
        _participantNames = participantNames,
        _participantPhotos = participantPhotos,
        _unreadCount = unreadCount;

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  @JsonKey(name: 'chat_id')
  final String chatId;
  final List<String> _participants;
  @override
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final Map<String, String> _participantNames;
  @override
  @JsonKey(name: 'participant_names')
  Map<String, String> get participantNames {
    if (_participantNames is EqualUnmodifiableMapView) return _participantNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantNames);
  }

  final Map<String, String> _participantPhotos;
  @override
  @JsonKey(name: 'participant_photos')
  Map<String, String> get participantPhotos {
    if (_participantPhotos is EqualUnmodifiableMapView)
      return _participantPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantPhotos);
  }

  @override
  @JsonKey(name: 'last_message')
  final String lastMessage;
  @override
  @JsonKey(name: 'last_message_at')
  @TimestampConverter()
  final DateTime? lastMessageAt;
  @override
  @JsonKey(name: 'last_sender_id')
  final String lastSenderId;
  final Map<String, int> _unreadCount;
  @override
  @JsonKey(name: 'unread_count')
  Map<String, int> get unreadCount {
    if (_unreadCount is EqualUnmodifiableMapView) return _unreadCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unreadCount);
  }

  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ChatModel(chatId: $chatId, participants: $participants, participantNames: $participantNames, participantPhotos: $participantPhotos, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, lastSenderId: $lastSenderId, unreadCount: $unreadCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality()
                .equals(other._participantNames, _participantNames) &&
            const DeepCollectionEquality()
                .equals(other._participantPhotos, _participantPhotos) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.lastSenderId, lastSenderId) ||
                other.lastSenderId == lastSenderId) &&
            const DeepCollectionEquality()
                .equals(other._unreadCount, _unreadCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatId,
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_participantNames),
      const DeepCollectionEquality().hash(_participantPhotos),
      lastMessage,
      lastMessageAt,
      lastSenderId,
      const DeepCollectionEquality().hash(_unreadCount),
      createdAt);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel(
      {@JsonKey(name: 'chat_id') required final String chatId,
      required final List<String> participants,
      @JsonKey(name: 'participant_names')
      final Map<String, String> participantNames,
      @JsonKey(name: 'participant_photos')
      final Map<String, String> participantPhotos,
      @JsonKey(name: 'last_message') final String lastMessage,
      @JsonKey(name: 'last_message_at')
      @TimestampConverter()
      final DateTime? lastMessageAt,
      @JsonKey(name: 'last_sender_id') final String lastSenderId,
      @JsonKey(name: 'unread_count') final Map<String, int> unreadCount,
      @JsonKey(name: 'created_at')
      @TimestampConverter()
      final DateTime? createdAt}) = _$ChatModelImpl;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  @JsonKey(name: 'chat_id')
  String get chatId;
  @override
  List<String> get participants;
  @override
  @JsonKey(name: 'participant_names')
  Map<String, String> get participantNames;
  @override
  @JsonKey(name: 'participant_photos')
  Map<String, String> get participantPhotos;
  @override
  @JsonKey(name: 'last_message')
  String get lastMessage;
  @override
  @JsonKey(name: 'last_message_at')
  @TimestampConverter()
  DateTime? get lastMessageAt;
  @override
  @JsonKey(name: 'last_sender_id')
  String get lastSenderId;
  @override
  @JsonKey(name: 'unread_count')
  Map<String, int> get unreadCount;
  @override
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime? get createdAt;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  @JsonKey(name: 'sender_id')
  String get senderId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_at')
  @TimestampConverter()
  DateTime? get sentAt => throw _privateConstructorUsedError;

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      String text,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_read') bool isRead,
      @JsonKey(name: 'sent_at') @TimestampConverter() DateTime? sentAt});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? text = null,
    Object? imageUrl = freezed,
    Object? isRead = null,
    Object? sentAt = freezed,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
          _$MessageModelImpl value, $Res Function(_$MessageModelImpl) then) =
      __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      String text,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_read') bool isRead,
      @JsonKey(name: 'sent_at') @TimestampConverter() DateTime? sentAt});
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
      _$MessageModelImpl _value, $Res Function(_$MessageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? text = null,
    Object? imageUrl = freezed,
    Object? isRead = null,
    Object? sentAt = freezed,
  }) {
    return _then(_$MessageModelImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageModelImpl implements _MessageModel {
  const _$MessageModelImpl(
      {@JsonKey(name: 'sender_id') required this.senderId,
      this.text = '',
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'is_read') this.isRead = false,
      @JsonKey(name: 'sent_at') @TimestampConverter() this.sentAt});

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  @JsonKey(name: 'sender_id')
  final String senderId;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_read')
  final bool isRead;
  @override
  @JsonKey(name: 'sent_at')
  @TimestampConverter()
  final DateTime? sentAt;

  @override
  String toString() {
    return 'MessageModel(senderId: $senderId, text: $text, imageUrl: $imageUrl, isRead: $isRead, sentAt: $sentAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, senderId, text, imageUrl, isRead, sentAt);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(
      this,
    );
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel(
      {@JsonKey(name: 'sender_id') required final String senderId,
      final String text,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'is_read') final bool isRead,
      @JsonKey(name: 'sent_at')
      @TimestampConverter()
      final DateTime? sentAt}) = _$MessageModelImpl;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  @JsonKey(name: 'sender_id')
  String get senderId;
  @override
  String get text;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'is_read')
  bool get isRead;
  @override
  @JsonKey(name: 'sent_at')
  @TimestampConverter()
  DateTime? get sentAt;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
