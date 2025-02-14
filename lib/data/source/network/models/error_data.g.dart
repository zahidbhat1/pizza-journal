// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorData _$ErrorDataFromJson(Map<String, dynamic> json) => ErrorData(
      code: json['code'] as String?,
      status: json['status'] as String?,
      error: json['error'] as String?,
      message: json['message'] as String?,
      title: json['title'] as String?,
      description: json['description'],
    );

Map<String, dynamic> _$ErrorDataToJson(ErrorData instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'title': instance.title,
      'description': instance.description,
    };
