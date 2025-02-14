// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceModelImpl _$$DeviceModelImplFromJson(Map<String, dynamic> json) =>
    _$DeviceModelImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      model: json['model'] as String?,
      type: json['type'] as String?,
      currentOs: json['current_os'] as String?,
      currentVersion: json['current_version'] as String?,
      versionHistory: (json['version_history'] as List<dynamic>?)
          ?.map((e) => VersionHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      unseenPnCount: json['unseen_pn_count'] == null
          ? null
          : UnseenNotificationCountModel.fromJson(
              json['unseen_pn_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DeviceModelImplToJson(_$DeviceModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'uuid': instance.uuid,
      'model': instance.model,
      'type': instance.type,
      'current_os': instance.currentOs,
      'current_version': instance.currentVersion,
      'version_history': instance.versionHistory,
      'unseen_pn_count': instance.unseenPnCount,
    };
