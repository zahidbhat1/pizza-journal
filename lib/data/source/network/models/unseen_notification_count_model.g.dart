// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unseen_notification_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnseenNotificationCountModelImpl _$$UnseenNotificationCountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnseenNotificationCountModelImpl(
      activities: (json['activities'] as num?)?.toInt(),
      news: (json['news'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UnseenNotificationCountModelImplToJson(
        _$UnseenNotificationCountModelImpl instance) =>
    <String, dynamic>{
      'activities': instance.activities,
      'news': instance.news,
    };
