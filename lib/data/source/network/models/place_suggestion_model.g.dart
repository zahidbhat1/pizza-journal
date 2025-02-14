// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceSuggestionsResponseImpl _$$PlaceSuggestionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceSuggestionsResponseImpl(
      status: json['status'] as String,
      data: PlaceSuggestionsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlaceSuggestionsResponseImplToJson(
        _$PlaceSuggestionsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$PlaceSuggestionsDataImpl _$$PlaceSuggestionsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceSuggestionsDataImpl(
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => PlaceSuggestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlaceSuggestionsDataImplToJson(
        _$PlaceSuggestionsDataImpl instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions,
    };

_$PlaceSuggestionImpl _$$PlaceSuggestionImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceSuggestionImpl(
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      hoursOpen: (json['hoursOpen'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      location: json['location'] as Map<String, dynamic>?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      pizzaPlace: json['pizzaPlace'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PlaceSuggestionImplToJson(
        _$PlaceSuggestionImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'hoursOpen': instance.hoursOpen,
      'location': instance.location,
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'website': instance.website,
      'user': instance.user,
      'pizzaPlace': instance.pizzaPlace,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
