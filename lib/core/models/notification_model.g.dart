// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      notificationId: json['notification_id'] as String,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      isRead: json['is_read'] as bool? ?? false,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'user_id': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'data': instance.data,
      'is_read': instance.isRead,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
