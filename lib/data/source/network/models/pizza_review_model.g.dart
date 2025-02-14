// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PizzaReviewModelImpl _$$PizzaReviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PizzaReviewModelImpl(
      summary: json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$PizzaReviewModelImplToJson(
        _$PizzaReviewModelImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'reviews': instance.reviews,
      'userId': instance.userId,
    };

_$SummaryImpl _$$SummaryImplFromJson(Map<String, dynamic> json) =>
    _$SummaryImpl(
      sauce: json['sauce'] == null
          ? null
          : Sauce.fromJson(json['sauce'] as Map<String, dynamic>),
      cheese: json['cheese'] == null
          ? null
          : Cheese.fromJson(json['cheese'] as Map<String, dynamic>),
      crust: json['crust'] == null
          ? null
          : Crust.fromJson(json['crust'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SummaryImplToJson(_$SummaryImpl instance) =>
    <String, dynamic>{
      'sauce': instance.sauce,
      'cheese': instance.cheese,
      'crust': instance.crust,
    };

_$SauceImpl _$$SauceImplFromJson(Map<String, dynamic> json) => _$SauceImpl(
      sauceSweet: (json['sauceSweet'] as num?)?.toInt(),
      sauceSpicy: (json['sauceSpicy'] as num?)?.toInt(),
      sauceNoFlavour: (json['sauceNoFlavour'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SauceImplToJson(_$SauceImpl instance) =>
    <String, dynamic>{
      'sauceSweet': instance.sauceSweet,
      'sauceSpicy': instance.sauceSpicy,
      'sauceNoFlavour': instance.sauceNoFlavour,
    };

_$CheeseImpl _$$CheeseImplFromJson(Map<String, dynamic> json) => _$CheeseImpl(
      cheeseGreat: (json['cheeseGreat'] as num?)?.toInt(),
      cheeseEhh: (json['cheeseEhh'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CheeseImplToJson(_$CheeseImpl instance) =>
    <String, dynamic>{
      'cheeseGreat': instance.cheeseGreat,
      'cheeseEhh': instance.cheeseEhh,
    };

_$CrustImpl _$$CrustImplFromJson(Map<String, dynamic> json) => _$CrustImpl(
      crustAverage: (json['crustAverage'] as num?)?.toInt(),
      crustThick: (json['crustThick'] as num?)?.toInt(),
      crustThin: (json['crustThin'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CrustImplToJson(_$CrustImpl instance) =>
    <String, dynamic>{
      'crustAverage': instance.crustAverage,
      'crustThick': instance.crustThick,
      'crustThin': instance.crustThin,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      crust: json['crust'] == null
          ? null
          : CrustReview.fromJson(json['crust'] as Map<String, dynamic>),
      sauce: json['sauce'] == null
          ? null
          : SauceReview.fromJson(json['sauce'] as Map<String, dynamic>),
      cheese: json['cheese'] == null
          ? null
          : CheeseReview.fromJson(json['cheese'] as Map<String, dynamic>),
      id: json['id'] as String?,
      stars: (json['stars'] as num?)?.toInt(),
      pizzaType: json['pizzaType'] as String?,
      description: json['description'] as String?,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      pizzaPlace: json['pizzaPlace'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'crust': instance.crust,
      'sauce': instance.sauce,
      'cheese': instance.cheese,
      'id': instance.id,
      'stars': instance.stars,
      'pizzaType': instance.pizzaType,
      'description': instance.description,
      'photos': instance.photos,
      'user': instance.user,
      'pizzaPlace': instance.pizzaPlace,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$CrustReviewImpl _$$CrustReviewImplFromJson(Map<String, dynamic> json) =>
    _$CrustReviewImpl(
      thickness: (json['thickness'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      crispy: json['crispy'] as bool,
    );

Map<String, dynamic> _$$CrustReviewImplToJson(_$CrustReviewImpl instance) =>
    <String, dynamic>{
      'thickness': instance.thickness,
      'crispy': instance.crispy,
    };

_$SauceReviewImpl _$$SauceReviewImplFromJson(Map<String, dynamic> json) =>
    _$SauceReviewImpl(
      sweetOrSpicy: json['sweetOrSpicy'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$$SauceReviewImplToJson(_$SauceReviewImpl instance) =>
    <String, dynamic>{
      'sweetOrSpicy': instance.sweetOrSpicy,
      'amount': instance.amount,
    };

_$CheeseReviewImpl _$$CheeseReviewImplFromJson(Map<String, dynamic> json) =>
    _$CheeseReviewImpl(
      amount: json['amount'] as String?,
      taste: json['taste'] as String?,
    );

Map<String, dynamic> _$$CheeseReviewImplToJson(_$CheeseReviewImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'taste': instance.taste,
    };
