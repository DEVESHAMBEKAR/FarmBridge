import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'converters.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @JsonKey(name: 'chat_id') required String chatId,
    required List<String> participants,
    @JsonKey(name: 'participant_names') @Default({}) Map<String, String> participantNames,
    @JsonKey(name: 'participant_photos') @Default({}) Map<String, String> participantPhotos,
    @JsonKey(name: 'last_message') @Default('') String lastMessage,
    @JsonKey(name: 'last_message_at') @TimestampConverter() DateTime? lastMessageAt,
    @JsonKey(name: 'last_sender_id') @Default('') String lastSenderId,
    @JsonKey(name: 'unread_count') @Default({}) Map<String, int> unreadCount,
    @JsonKey(name: 'created_at') @TimestampConverter() DateTime? createdAt,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
}

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    @JsonKey(name: 'sender_id') required String senderId,
    @Default('') String text,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'sent_at') @TimestampConverter() DateTime? sentAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
