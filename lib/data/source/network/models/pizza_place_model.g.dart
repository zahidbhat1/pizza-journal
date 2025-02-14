// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PizzaPlaceModelImpl _$$PizzaPlaceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PizzaPlaceModelImpl(
      name: json['name'] as String?,
      hoursOpen: (json['hoursOpen'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      phone: json['phone'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['_id'] as String?,
      averageRating: (json['average_rating'] as num?)?.toInt(),
      ratings: (json['ratings'] as num?)?.toInt(),
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      summary: json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
      photos: json['photos'] as List<dynamic>? ?? const [],
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PizzaPlaceModelImplToJson(
        _$PizzaPlaceModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hoursOpen': instance.hoursOpen,
      'phone': instance.phone,
      'created_at': instance.createdAt,
      '_id': instance.id,
      'average_rating': instance.averageRating,
      'ratings': instance.ratings,
      'address': instance.address,
      'summary': instance.summary,
      'photos': instance.photos,
      'links': instance.links,
    };

_$LinksImpl _$$LinksImplFromJson(Map<String, dynamic> json) => _$LinksImpl(
      social: json['social'] as String?,
      maps: json['maps'] as String?,
    );

Map<String, dynamic> _$$LinksImplToJson(_$LinksImpl instance) =>
    <String, dynamic>{
      'social': instance.social,
      'maps': instance.maps,
    };
