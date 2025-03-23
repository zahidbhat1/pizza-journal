// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSearchesResponseImpl _$$UserSearchesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSearchesResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserSearchesResponseImplToJson(
        _$UserSearchesResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$UserSearchImpl _$$UserSearchImplFromJson(Map<String, dynamic> json) =>
    _$UserSearchImpl(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      searchCustomName: json['searchCustomName'] as String?,
      placeName: json['placeName'] as String?,
      pizzaType: json['pizzaType'] as String?,
      minRating: (json['minRating'] as num?)?.toInt(),
      sauceSweetOrSpicy: json['sauceSweetOrSpicy'] as String?,
      sauceAmount: json['sauceAmount'] as String?,
      cheeseAmount: json['cheeseAmount'] as String?,
      cheeseTaste: json['cheeseTaste'] as String?,
      crustThickness: json['crustThickness'] as String?,
      crustCrispy: json['crustCrispy'] as bool?,
      crustDry: json['crustDry'] as bool?,
      crustFluffy: json['crustFluffy'] as bool?,
      screenName: json['screenName'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      version: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$$UserSearchImplToJson(_$UserSearchImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'searchCustomName': instance.searchCustomName,
      'placeName': instance.placeName,
      'pizzaType': instance.pizzaType,
      'minRating': instance.minRating,
      'sauceSweetOrSpicy': instance.sauceSweetOrSpicy,
      'sauceAmount': instance.sauceAmount,
      'cheeseAmount': instance.cheeseAmount,
      'cheeseTaste': instance.cheeseTaste,
      'crustThickness': instance.crustThickness,
      'crustCrispy': instance.crustCrispy,
      'crustDry': instance.crustDry,
      'crustFluffy': instance.crustFluffy,
      'screenName': instance.screenName,
      'createdAt': instance.createdAt.toIso8601String(),
      '__v': instance.version,
    };
