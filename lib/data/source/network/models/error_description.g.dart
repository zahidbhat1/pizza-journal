// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDescription _$ErrorDescriptionFromJson(Map<String, dynamic> json) =>
    ErrorDescription(
      errorType: json['error_type'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ErrorDescriptionToJson(ErrorDescription instance) =>
    <String, dynamic>{
      'error_type': instance.errorType,
      'messages': instance.messages,
    };
