// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      chatId: json['chat_id'] as String,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      participantNames:
          (json['participant_names'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              const {},
      participantPhotos:
          (json['participant_photos'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              const {},
      lastMessage: json['last_message'] as String? ?? '',
      lastMessageAt: const TimestampConverter()
          .fromJson(json['last_message_at'] as Timestamp?),
      lastSenderId: json['last_sender_id'] as String? ?? '',
      unreadCount: (json['unread_count'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'chat_id': instance.chatId,
      'participants': instance.participants,
      'participant_names': instance.participantNames,
      'participant_photos': instance.participantPhotos,
      'last_message': instance.lastMessage,
      'last_message_at':
          const TimestampConverter().toJson(instance.lastMessageAt),
      'last_sender_id': instance.lastSenderId,
      'unread_count': instance.unreadCount,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      senderId: json['sender_id'] as String,
      text: json['text'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      isRead: json['is_read'] as bool? ?? false,
      sentAt:
          const TimestampConverter().fromJson(json['sent_at'] as Timestamp?),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'text': instance.text,
      'image_url': instance.imageUrl,
      'is_read': instance.isRead,
      'sent_at': const TimestampConverter().toJson(instance.sentAt),
    };
