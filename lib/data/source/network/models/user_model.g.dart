// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      screenName: json['screenName'] as String?,
      email: json['email'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userName': instance.userName,
      'name': instance.name,
      'screenName': instance.screenName,
      'email': instance.email,
      'picture': instance.picture,
    };
