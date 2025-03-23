// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PizzaReviewModelImpl _$$PizzaReviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PizzaReviewModelImpl(
      summaries: (json['summary'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, PizzaTypeSummary.fromJson(e as Map<String, dynamic>)),
      ),
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
      'summary': instance.summaries,
      'reviews': instance.reviews,
      'userId': instance.userId,
    };

_$PizzaTypeSummaryImpl _$$PizzaTypeSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$PizzaTypeSummaryImpl(
      crust: CrustSummary.fromJson(json['crust'] as Map<String, dynamic>),
      sauce: SauceSummary.fromJson(json['sauce'] as Map<String, dynamic>),
      cheese: CheeseSummary.fromJson(json['cheese'] as Map<String, dynamic>),
      count: (json['count'] as num).toInt(),
      totalStars: (json['totalStars'] as num).toInt(),
      averageRating: (json['averageRating'] as num).toDouble(),
    );

Map<String, dynamic> _$$PizzaTypeSummaryImplToJson(
        _$PizzaTypeSummaryImpl instance) =>
    <String, dynamic>{
      'crust': instance.crust,
      'sauce': instance.sauce,
      'cheese': instance.cheese,
      'count': instance.count,
      'totalStars': instance.totalStars,
      'averageRating': instance.averageRating,
    };

_$CrustSummaryImpl _$$CrustSummaryImplFromJson(Map<String, dynamic> json) =>
    _$CrustSummaryImpl(
      thin: (json['thin'] as num).toInt(),
      thick: (json['thick'] as num).toInt(),
      average: (json['average'] as num).toInt(),
      crispy: (json['crispy'] as num).toInt(),
      dry: (json['dry'] as num).toInt(),
      fluffy: (json['fluffy'] as num).toInt(),
    );

Map<String, dynamic> _$$CrustSummaryImplToJson(_$CrustSummaryImpl instance) =>
    <String, dynamic>{
      'thin': instance.thin,
      'thick': instance.thick,
      'average': instance.average,
      'crispy': instance.crispy,
      'dry': instance.dry,
      'fluffy': instance.fluffy,
    };

_$SauceSummaryImpl _$$SauceSummaryImplFromJson(Map<String, dynamic> json) =>
    _$SauceSummaryImpl(
      sweet: (json['sweet'] as num).toInt(),
      spicy: (json['spicy'] as num).toInt(),
      noflavour: (json['noflavour'] as num).toInt(),
    );

Map<String, dynamic> _$$SauceSummaryImplToJson(_$SauceSummaryImpl instance) =>
    <String, dynamic>{
      'sweet': instance.sweet,
      'spicy': instance.spicy,
      'noflavour': instance.noflavour,
    };

_$CheeseSummaryImpl _$$CheeseSummaryImplFromJson(Map<String, dynamic> json) =>
    _$CheeseSummaryImpl(
      heavy: (json['heavy'] as num).toInt(),
      light: (json['light'] as num).toInt(),
      average: (json['average'] as num).toInt(),
    );

Map<String, dynamic> _$$CheeseSummaryImplToJson(_$CheeseSummaryImpl instance) =>
    <String, dynamic>{
      'heavy': instance.heavy,
      'light': instance.light,
      'average': instance.average,
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
      id: json['_id'] as String?,
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
      '_id': instance.id,
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
      thickness: json['thickness'] as String?,
      crispy: json['crispy'] as bool,
      dry: json['dry'] as bool?,
      fluffy: json['fluffy'] as bool?,
    );

Map<String, dynamic> _$$CrustReviewImplToJson(_$CrustReviewImpl instance) =>
    <String, dynamic>{
      'thickness': instance.thickness,
      'crispy': instance.crispy,
      'dry': instance.dry,
      'fluffy': instance.fluffy,
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
