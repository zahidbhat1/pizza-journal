// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VersionHistoryModelImpl _$$VersionHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VersionHistoryModelImpl(
      os: json['os'] as String?,
      version: json['version'] as String?,
      firstLoggedOn: json['first_logged_on'] as String?,
    );

Map<String, dynamic> _$$VersionHistoryModelImplToJson(
        _$VersionHistoryModelImpl instance) =>
    <String, dynamic>{
      'os': instance.os,
      'version': instance.version,
      'first_logged_on': instance.firstLoggedOn,
    };
