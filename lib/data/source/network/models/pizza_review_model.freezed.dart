// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pizza_review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PizzaReviewModel _$PizzaReviewModelFromJson(Map<String, dynamic> json) {
  return _PizzaReviewModel.fromJson(json);
}

/// @nodoc
mixin _$PizzaReviewModel {
// Change from "summaries" to "summary" to match API
  @JsonKey(name: 'summary')
  Map<String, PizzaTypeSummary>? get summaries =>
      throw _privateConstructorUsedError;
  List<Review?>? get reviews => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PizzaReviewModelCopyWith<PizzaReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PizzaReviewModelCopyWith<$Res> {
  factory $PizzaReviewModelCopyWith(
          PizzaReviewModel value, $Res Function(PizzaReviewModel) then) =
      _$PizzaReviewModelCopyWithImpl<$Res, PizzaReviewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') Map<String, PizzaTypeSummary>? summaries,
      List<Review?>? reviews,
      String? userId});
}

/// @nodoc
class _$PizzaReviewModelCopyWithImpl<$Res, $Val extends PizzaReviewModel>
    implements $PizzaReviewModelCopyWith<$Res> {
  _$PizzaReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaries = freezed,
    Object? reviews = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      summaries: freezed == summaries
          ? _value.summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as Map<String, PizzaTypeSummary>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review?>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PizzaReviewModelImplCopyWith<$Res>
    implements $PizzaReviewModelCopyWith<$Res> {
  factory _$$PizzaReviewModelImplCopyWith(_$PizzaReviewModelImpl value,
          $Res Function(_$PizzaReviewModelImpl) then) =
      __$$PizzaReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') Map<String, PizzaTypeSummary>? summaries,
      List<Review?>? reviews,
      String? userId});
}

/// @nodoc
class __$$PizzaReviewModelImplCopyWithImpl<$Res>
    extends _$PizzaReviewModelCopyWithImpl<$Res, _$PizzaReviewModelImpl>
    implements _$$PizzaReviewModelImplCopyWith<$Res> {
  __$$PizzaReviewModelImplCopyWithImpl(_$PizzaReviewModelImpl _value,
      $Res Function(_$PizzaReviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaries = freezed,
    Object? reviews = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$PizzaReviewModelImpl(
      summaries: freezed == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as Map<String, PizzaTypeSummary>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review?>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$PizzaReviewModelImpl implements _PizzaReviewModel {
  const _$PizzaReviewModelImpl(
      {@JsonKey(name: 'summary') final Map<String, PizzaTypeSummary>? summaries,
      final List<Review?>? reviews = const [],
      this.userId})
      : _summaries = summaries,
        _reviews = reviews;

  factory _$PizzaReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PizzaReviewModelImplFromJson(json);

// Change from "summaries" to "summary" to match API
  final Map<String, PizzaTypeSummary>? _summaries;
// Change from "summaries" to "summary" to match API
  @override
  @JsonKey(name: 'summary')
  Map<String, PizzaTypeSummary>? get summaries {
    final value = _summaries;
    if (value == null) return null;
    if (_summaries is EqualUnmodifiableMapView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Review?>? _reviews;
  @override
  @JsonKey()
  List<Review?>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? userId;

  @override
  String toString() {
    return 'PizzaReviewModel(summaries: $summaries, reviews: $reviews, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PizzaReviewModelImpl &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_summaries),
      const DeepCollectionEquality().hash(_reviews),
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PizzaReviewModelImplCopyWith<_$PizzaReviewModelImpl> get copyWith =>
      __$$PizzaReviewModelImplCopyWithImpl<_$PizzaReviewModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PizzaReviewModelImplToJson(
      this,
    );
  }
}

abstract class _PizzaReviewModel implements PizzaReviewModel {
  const factory _PizzaReviewModel(
      {@JsonKey(name: 'summary') final Map<String, PizzaTypeSummary>? summaries,
      final List<Review?>? reviews,
      final String? userId}) = _$PizzaReviewModelImpl;

  factory _PizzaReviewModel.fromJson(Map<String, dynamic> json) =
      _$PizzaReviewModelImpl.fromJson;

  @override // Change from "summaries" to "summary" to match API
  @JsonKey(name: 'summary')
  Map<String, PizzaTypeSummary>? get summaries;
  @override
  List<Review?>? get reviews;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$PizzaReviewModelImplCopyWith<_$PizzaReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PizzaTypeSummary _$PizzaTypeSummaryFromJson(Map<String, dynamic> json) {
  return _PizzaTypeSummary.fromJson(json);
}

/// @nodoc
mixin _$PizzaTypeSummary {
  CrustSummary get crust => throw _privateConstructorUsedError;
  SauceSummary get sauce => throw _privateConstructorUsedError;
  CheeseSummary get cheese => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get totalStars => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PizzaTypeSummaryCopyWith<PizzaTypeSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PizzaTypeSummaryCopyWith<$Res> {
  factory $PizzaTypeSummaryCopyWith(
          PizzaTypeSummary value, $Res Function(PizzaTypeSummary) then) =
      _$PizzaTypeSummaryCopyWithImpl<$Res, PizzaTypeSummary>;
  @useResult
  $Res call(
      {CrustSummary crust,
      SauceSummary sauce,
      CheeseSummary cheese,
      int count,
      int totalStars,
      double averageRating});

  $CrustSummaryCopyWith<$Res> get crust;
  $SauceSummaryCopyWith<$Res> get sauce;
  $CheeseSummaryCopyWith<$Res> get cheese;
}

/// @nodoc
class _$PizzaTypeSummaryCopyWithImpl<$Res, $Val extends PizzaTypeSummary>
    implements $PizzaTypeSummaryCopyWith<$Res> {
  _$PizzaTypeSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crust = null,
    Object? sauce = null,
    Object? cheese = null,
    Object? count = null,
    Object? totalStars = null,
    Object? averageRating = null,
  }) {
    return _then(_value.copyWith(
      crust: null == crust
          ? _value.crust
          : crust // ignore: cast_nullable_to_non_nullable
              as CrustSummary,
      sauce: null == sauce
          ? _value.sauce
          : sauce // ignore: cast_nullable_to_non_nullable
              as SauceSummary,
      cheese: null == cheese
          ? _value.cheese
          : cheese // ignore: cast_nullable_to_non_nullable
              as CheeseSummary,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      totalStars: null == totalStars
          ? _value.totalStars
          : totalStars // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CrustSummaryCopyWith<$Res> get crust {
    return $CrustSummaryCopyWith<$Res>(_value.crust, (value) {
      return _then(_value.copyWith(crust: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SauceSummaryCopyWith<$Res> get sauce {
    return $SauceSummaryCopyWith<$Res>(_value.sauce, (value) {
      return _then(_value.copyWith(sauce: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CheeseSummaryCopyWith<$Res> get cheese {
    return $CheeseSummaryCopyWith<$Res>(_value.cheese, (value) {
      return _then(_value.copyWith(cheese: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PizzaTypeSummaryImplCopyWith<$Res>
    implements $PizzaTypeSummaryCopyWith<$Res> {
  factory _$$PizzaTypeSummaryImplCopyWith(_$PizzaTypeSummaryImpl value,
          $Res Function(_$PizzaTypeSummaryImpl) then) =
      __$$PizzaTypeSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CrustSummary crust,
      SauceSummary sauce,
      CheeseSummary cheese,
      int count,
      int totalStars,
      double averageRating});

  @override
  $CrustSummaryCopyWith<$Res> get crust;
  @override
  $SauceSummaryCopyWith<$Res> get sauce;
  @override
  $CheeseSummaryCopyWith<$Res> get cheese;
}

/// @nodoc
class __$$PizzaTypeSummaryImplCopyWithImpl<$Res>
    extends _$PizzaTypeSummaryCopyWithImpl<$Res, _$PizzaTypeSummaryImpl>
    implements _$$PizzaTypeSummaryImplCopyWith<$Res> {
  __$$PizzaTypeSummaryImplCopyWithImpl(_$PizzaTypeSummaryImpl _value,
      $Res Function(_$PizzaTypeSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crust = null,
    Object? sauce = null,
    Object? cheese = null,
    Object? count = null,
    Object? totalStars = null,
    Object? averageRating = null,
  }) {
    return _then(_$PizzaTypeSummaryImpl(
      crust: null == crust
          ? _value.crust
          : crust // ignore: cast_nullable_to_non_nullable
              as CrustSummary,
      sauce: null == sauce
          ? _value.sauce
          : sauce // ignore: cast_nullable_to_non_nullable
              as SauceSummary,
      cheese: null == cheese
          ? _value.cheese
          : cheese // ignore: cast_nullable_to_non_nullable
              as CheeseSummary,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      totalStars: null == totalStars
          ? _value.totalStars
          : totalStars // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$PizzaTypeSummaryImpl implements _PizzaTypeSummary {
  const _$PizzaTypeSummaryImpl(
      {required this.crust,
      required this.sauce,
      required this.cheese,
      required this.count,
      required this.totalStars,
      required this.averageRating});

  factory _$PizzaTypeSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PizzaTypeSummaryImplFromJson(json);

  @override
  final CrustSummary crust;
  @override
  final SauceSummary sauce;
  @override
  final CheeseSummary cheese;
  @override
  final int count;
  @override
  final int totalStars;
  @override
  final double averageRating;

  @override
  String toString() {
    return 'PizzaTypeSummary(crust: $crust, sauce: $sauce, cheese: $cheese, count: $count, totalStars: $totalStars, averageRating: $averageRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PizzaTypeSummaryImpl &&
            (identical(other.crust, crust) || other.crust == crust) &&
            (identical(other.sauce, sauce) || other.sauce == sauce) &&
            (identical(other.cheese, cheese) || other.cheese == cheese) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.totalStars, totalStars) ||
                other.totalStars == totalStars) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, crust, sauce, cheese, count, totalStars, averageRating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PizzaTypeSummaryImplCopyWith<_$PizzaTypeSummaryImpl> get copyWith =>
      __$$PizzaTypeSummaryImplCopyWithImpl<_$PizzaTypeSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PizzaTypeSummaryImplToJson(
      this,
    );
  }
}

abstract class _PizzaTypeSummary implements PizzaTypeSummary {
  const factory _PizzaTypeSummary(
      {required final CrustSummary crust,
      required final SauceSummary sauce,
      required final CheeseSummary cheese,
      required final int count,
      required final int totalStars,
      required final double averageRating}) = _$PizzaTypeSummaryImpl;

  factory _PizzaTypeSummary.fromJson(Map<String, dynamic> json) =
      _$PizzaTypeSummaryImpl.fromJson;

  @override
  CrustSummary get crust;
  @override
  SauceSummary get sauce;
  @override
  CheeseSummary get cheese;
  @override
  int get count;
  @override
  int get totalStars;
  @override
  double get averageRating;
  @override
  @JsonKey(ignore: true)
  _$$PizzaTypeSummaryImplCopyWith<_$PizzaTypeSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CrustSummary _$CrustSummaryFromJson(Map<String, dynamic> json) {
  return _CrustSummary.fromJson(json);
}

/// @nodoc
mixin _$CrustSummary {
  int get thin => throw _privateConstructorUsedError;
  int get thick => throw _privateConstructorUsedError;
  int get average => throw _privateConstructorUsedError;
  int get crispy =>
      throw _privateConstructorUsedError; // Kept as int because it's a percentage (100 = fully crispy)
  int get dry =>
      throw _privateConstructorUsedError; // Kept as int because it's a percentage
  int get fluffy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrustSummaryCopyWith<CrustSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrustSummaryCopyWith<$Res> {
  factory $CrustSummaryCopyWith(
          CrustSummary value, $Res Function(CrustSummary) then) =
      _$CrustSummaryCopyWithImpl<$Res, CrustSummary>;
  @useResult
  $Res call(
      {int thin, int thick, int average, int crispy, int dry, int fluffy});
}

/// @nodoc
class _$CrustSummaryCopyWithImpl<$Res, $Val extends CrustSummary>
    implements $CrustSummaryCopyWith<$Res> {
  _$CrustSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thin = null,
    Object? thick = null,
    Object? average = null,
    Object? crispy = null,
    Object? dry = null,
    Object? fluffy = null,
  }) {
    return _then(_value.copyWith(
      thin: null == thin
          ? _value.thin
          : thin // ignore: cast_nullable_to_non_nullable
              as int,
      thick: null == thick
          ? _value.thick
          : thick // ignore: cast_nullable_to_non_nullable
              as int,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as int,
      crispy: null == crispy
          ? _value.crispy
          : crispy // ignore: cast_nullable_to_non_nullable
              as int,
      dry: null == dry
          ? _value.dry
          : dry // ignore: cast_nullable_to_non_nullable
              as int,
      fluffy: null == fluffy
          ? _value.fluffy
          : fluffy // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrustSummaryImplCopyWith<$Res>
    implements $CrustSummaryCopyWith<$Res> {
  factory _$$CrustSummaryImplCopyWith(
          _$CrustSummaryImpl value, $Res Function(_$CrustSummaryImpl) then) =
      __$$CrustSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int thin, int thick, int average, int crispy, int dry, int fluffy});
}

/// @nodoc
class __$$CrustSummaryImplCopyWithImpl<$Res>
    extends _$CrustSummaryCopyWithImpl<$Res, _$CrustSummaryImpl>
    implements _$$CrustSummaryImplCopyWith<$Res> {
  __$$CrustSummaryImplCopyWithImpl(
      _$CrustSummaryImpl _value, $Res Function(_$CrustSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thin = null,
    Object? thick = null,
    Object? average = null,
    Object? crispy = null,
    Object? dry = null,
    Object? fluffy = null,
  }) {
    return _then(_$CrustSummaryImpl(
      thin: null == thin
          ? _value.thin
          : thin // ignore: cast_nullable_to_non_nullable
              as int,
      thick: null == thick
          ? _value.thick
          : thick // ignore: cast_nullable_to_non_nullable
              as int,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as int,
      crispy: null == crispy
          ? _value.crispy
          : crispy // ignore: cast_nullable_to_non_nullable
              as int,
      dry: null == dry
          ? _value.dry
          : dry // ignore: cast_nullable_to_non_nullable
              as int,
      fluffy: null == fluffy
          ? _value.fluffy
          : fluffy // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$CrustSummaryImpl implements _CrustSummary {
  const _$CrustSummaryImpl(
      {required this.thin,
      required this.thick,
      required this.average,
      required this.crispy,
      required this.dry,
      required this.fluffy});

  factory _$CrustSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrustSummaryImplFromJson(json);

  @override
  final int thin;
  @override
  final int thick;
  @override
  final int average;
  @override
  final int crispy;
// Kept as int because it's a percentage (100 = fully crispy)
  @override
  final int dry;
// Kept as int because it's a percentage
  @override
  final int fluffy;

  @override
  String toString() {
    return 'CrustSummary(thin: $thin, thick: $thick, average: $average, crispy: $crispy, dry: $dry, fluffy: $fluffy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrustSummaryImpl &&
            (identical(other.thin, thin) || other.thin == thin) &&
            (identical(other.thick, thick) || other.thick == thick) &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.crispy, crispy) || other.crispy == crispy) &&
            (identical(other.dry, dry) || other.dry == dry) &&
            (identical(other.fluffy, fluffy) || other.fluffy == fluffy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, thin, thick, average, crispy, dry, fluffy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrustSummaryImplCopyWith<_$CrustSummaryImpl> get copyWith =>
      __$$CrustSummaryImplCopyWithImpl<_$CrustSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrustSummaryImplToJson(
      this,
    );
  }
}

abstract class _CrustSummary implements CrustSummary {
  const factory _CrustSummary(
      {required final int thin,
      required final int thick,
      required final int average,
      required final int crispy,
      required final int dry,
      required final int fluffy}) = _$CrustSummaryImpl;

  factory _CrustSummary.fromJson(Map<String, dynamic> json) =
      _$CrustSummaryImpl.fromJson;

  @override
  int get thin;
  @override
  int get thick;
  @override
  int get average;
  @override
  int get crispy;
  @override // Kept as int because it's a percentage (100 = fully crispy)
  int get dry;
  @override // Kept as int because it's a percentage
  int get fluffy;
  @override
  @JsonKey(ignore: true)
  _$$CrustSummaryImplCopyWith<_$CrustSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SauceSummary _$SauceSummaryFromJson(Map<String, dynamic> json) {
  return _SauceSummary.fromJson(json);
}

/// @nodoc
mixin _$SauceSummary {
  int get sweet => throw _privateConstructorUsedError;
  int get spicy => throw _privateConstructorUsedError;
  int get noflavour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SauceSummaryCopyWith<SauceSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SauceSummaryCopyWith<$Res> {
  factory $SauceSummaryCopyWith(
          SauceSummary value, $Res Function(SauceSummary) then) =
      _$SauceSummaryCopyWithImpl<$Res, SauceSummary>;
  @useResult
  $Res call({int sweet, int spicy, int noflavour});
}

/// @nodoc
class _$SauceSummaryCopyWithImpl<$Res, $Val extends SauceSummary>
    implements $SauceSummaryCopyWith<$Res> {
  _$SauceSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sweet = null,
    Object? spicy = null,
    Object? noflavour = null,
  }) {
    return _then(_value.copyWith(
      sweet: null == sweet
          ? _value.sweet
          : sweet // ignore: cast_nullable_to_non_nullable
              as int,
      spicy: null == spicy
          ? _value.spicy
          : spicy // ignore: cast_nullable_to_non_nullable
              as int,
      noflavour: null == noflavour
          ? _value.noflavour
          : noflavour // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SauceSummaryImplCopyWith<$Res>
    implements $SauceSummaryCopyWith<$Res> {
  factory _$$SauceSummaryImplCopyWith(
          _$SauceSummaryImpl value, $Res Function(_$SauceSummaryImpl) then) =
      __$$SauceSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sweet, int spicy, int noflavour});
}

/// @nodoc
class __$$SauceSummaryImplCopyWithImpl<$Res>
    extends _$SauceSummaryCopyWithImpl<$Res, _$SauceSummaryImpl>
    implements _$$SauceSummaryImplCopyWith<$Res> {
  __$$SauceSummaryImplCopyWithImpl(
      _$SauceSummaryImpl _value, $Res Function(_$SauceSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sweet = null,
    Object? spicy = null,
    Object? noflavour = null,
  }) {
    return _then(_$SauceSummaryImpl(
      sweet: null == sweet
          ? _value.sweet
          : sweet // ignore: cast_nullable_to_non_nullable
              as int,
      spicy: null == spicy
          ? _value.spicy
          : spicy // ignore: cast_nullable_to_non_nullable
              as int,
      noflavour: null == noflavour
          ? _value.noflavour
          : noflavour // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$SauceSummaryImpl implements _SauceSummary {
  const _$SauceSummaryImpl(
      {required this.sweet, required this.spicy, required this.noflavour});

  factory _$SauceSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SauceSummaryImplFromJson(json);

  @override
  final int sweet;
  @override
  final int spicy;
  @override
  final int noflavour;

  @override
  String toString() {
    return 'SauceSummary(sweet: $sweet, spicy: $spicy, noflavour: $noflavour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SauceSummaryImpl &&
            (identical(other.sweet, sweet) || other.sweet == sweet) &&
            (identical(other.spicy, spicy) || other.spicy == spicy) &&
            (identical(other.noflavour, noflavour) ||
                other.noflavour == noflavour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sweet, spicy, noflavour);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SauceSummaryImplCopyWith<_$SauceSummaryImpl> get copyWith =>
      __$$SauceSummaryImplCopyWithImpl<_$SauceSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SauceSummaryImplToJson(
      this,
    );
  }
}

abstract class _SauceSummary implements SauceSummary {
  const factory _SauceSummary(
      {required final int sweet,
      required final int spicy,
      required final int noflavour}) = _$SauceSummaryImpl;

  factory _SauceSummary.fromJson(Map<String, dynamic> json) =
      _$SauceSummaryImpl.fromJson;

  @override
  int get sweet;
  @override
  int get spicy;
  @override
  int get noflavour;
  @override
  @JsonKey(ignore: true)
  _$$SauceSummaryImplCopyWith<_$SauceSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheeseSummary _$CheeseSummaryFromJson(Map<String, dynamic> json) {
  return _CheeseSummary.fromJson(json);
}

/// @nodoc
mixin _$CheeseSummary {
  int get heavy => throw _privateConstructorUsedError;
  int get light => throw _privateConstructorUsedError;
  int get average => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheeseSummaryCopyWith<CheeseSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheeseSummaryCopyWith<$Res> {
  factory $CheeseSummaryCopyWith(
          CheeseSummary value, $Res Function(CheeseSummary) then) =
      _$CheeseSummaryCopyWithImpl<$Res, CheeseSummary>;
  @useResult
  $Res call({int heavy, int light, int average});
}

/// @nodoc
class _$CheeseSummaryCopyWithImpl<$Res, $Val extends CheeseSummary>
    implements $CheeseSummaryCopyWith<$Res> {
  _$CheeseSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heavy = null,
    Object? light = null,
    Object? average = null,
  }) {
    return _then(_value.copyWith(
      heavy: null == heavy
          ? _value.heavy
          : heavy // ignore: cast_nullable_to_non_nullable
              as int,
      light: null == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as int,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheeseSummaryImplCopyWith<$Res>
    implements $CheeseSummaryCopyWith<$Res> {
  factory _$$CheeseSummaryImplCopyWith(
          _$CheeseSummaryImpl value, $Res Function(_$CheeseSummaryImpl) then) =
      __$$CheeseSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int heavy, int light, int average});
}

/// @nodoc
class __$$CheeseSummaryImplCopyWithImpl<$Res>
    extends _$CheeseSummaryCopyWithImpl<$Res, _$CheeseSummaryImpl>
    implements _$$CheeseSummaryImplCopyWith<$Res> {
  __$$CheeseSummaryImplCopyWithImpl(
      _$CheeseSummaryImpl _value, $Res Function(_$CheeseSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heavy = null,
    Object? light = null,
    Object? average = null,
  }) {
    return _then(_$CheeseSummaryImpl(
      heavy: null == heavy
          ? _value.heavy
          : heavy // ignore: cast_nullable_to_non_nullable
              as int,
      light: null == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as int,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$CheeseSummaryImpl implements _CheeseSummary {
  const _$CheeseSummaryImpl(
      {required this.heavy, required this.light, required this.average});

  factory _$CheeseSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheeseSummaryImplFromJson(json);

  @override
  final int heavy;
  @override
  final int light;
  @override
  final int average;

  @override
  String toString() {
    return 'CheeseSummary(heavy: $heavy, light: $light, average: $average)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheeseSummaryImpl &&
            (identical(other.heavy, heavy) || other.heavy == heavy) &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.average, average) || other.average == average));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, heavy, light, average);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheeseSummaryImplCopyWith<_$CheeseSummaryImpl> get copyWith =>
      __$$CheeseSummaryImplCopyWithImpl<_$CheeseSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheeseSummaryImplToJson(
      this,
    );
  }
}

abstract class _CheeseSummary implements CheeseSummary {
  const factory _CheeseSummary(
      {required final int heavy,
      required final int light,
      required final int average}) = _$CheeseSummaryImpl;

  factory _CheeseSummary.fromJson(Map<String, dynamic> json) =
      _$CheeseSummaryImpl.fromJson;

  @override
  int get heavy;
  @override
  int get light;
  @override
  int get average;
  @override
  @JsonKey(ignore: true)
  _$$CheeseSummaryImplCopyWith<_$CheeseSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  CrustReview? get crust => throw _privateConstructorUsedError;
  SauceReview? get sauce => throw _privateConstructorUsedError;
  CheeseReview? get cheese => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get stars => throw _privateConstructorUsedError;
  String? get pizzaType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String?>? get photos => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  String? get pizzaPlace => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {CrustReview? crust,
      SauceReview? sauce,
      CheeseReview? cheese,
      @JsonKey(name: '_id') String? id,
      int? stars,
      String? pizzaType,
      String? description,
      List<String?>? photos,
      UserModel? user,
      String? pizzaPlace,
      String? createdAt,
      String? updatedAt});

  $CrustReviewCopyWith<$Res>? get crust;
  $SauceReviewCopyWith<$Res>? get sauce;
  $CheeseReviewCopyWith<$Res>? get cheese;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crust = freezed,
    Object? sauce = freezed,
    Object? cheese = freezed,
    Object? id = freezed,
    Object? stars = freezed,
    Object? pizzaType = freezed,
    Object? description = freezed,
    Object? photos = freezed,
    Object? user = freezed,
    Object? pizzaPlace = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      crust: freezed == crust
          ? _value.crust
          : crust // ignore: cast_nullable_to_non_nullable
              as CrustReview?,
      sauce: freezed == sauce
          ? _value.sauce
          : sauce // ignore: cast_nullable_to_non_nullable
              as SauceReview?,
      cheese: freezed == cheese
          ? _value.cheese
          : cheese // ignore: cast_nullable_to_non_nullable
              as CheeseReview?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      stars: freezed == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int?,
      pizzaType: freezed == pizzaType
          ? _value.pizzaType
          : pizzaType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      pizzaPlace: freezed == pizzaPlace
          ? _value.pizzaPlace
          : pizzaPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CrustReviewCopyWith<$Res>? get crust {
    if (_value.crust == null) {
      return null;
    }

    return $CrustReviewCopyWith<$Res>(_value.crust!, (value) {
      return _then(_value.copyWith(crust: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SauceReviewCopyWith<$Res>? get sauce {
    if (_value.sauce == null) {
      return null;
    }

    return $SauceReviewCopyWith<$Res>(_value.sauce!, (value) {
      return _then(_value.copyWith(sauce: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CheeseReviewCopyWith<$Res>? get cheese {
    if (_value.cheese == null) {
      return null;
    }

    return $CheeseReviewCopyWith<$Res>(_value.cheese!, (value) {
      return _then(_value.copyWith(cheese: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CrustReview? crust,
      SauceReview? sauce,
      CheeseReview? cheese,
      @JsonKey(name: '_id') String? id,
      int? stars,
      String? pizzaType,
      String? description,
      List<String?>? photos,
      UserModel? user,
      String? pizzaPlace,
      String? createdAt,
      String? updatedAt});

  @override
  $CrustReviewCopyWith<$Res>? get crust;
  @override
  $SauceReviewCopyWith<$Res>? get sauce;
  @override
  $CheeseReviewCopyWith<$Res>? get cheese;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crust = freezed,
    Object? sauce = freezed,
    Object? cheese = freezed,
    Object? id = freezed,
    Object? stars = freezed,
    Object? pizzaType = freezed,
    Object? description = freezed,
    Object? photos = freezed,
    Object? user = freezed,
    Object? pizzaPlace = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReviewImpl(
      crust: freezed == crust
          ? _value.crust
          : crust // ignore: cast_nullable_to_non_nullable
              as CrustReview?,
      sauce: freezed == sauce
          ? _value.sauce
          : sauce // ignore: cast_nullable_to_non_nullable
              as SauceReview?,
      cheese: freezed == cheese
          ? _value.cheese
          : cheese // ignore: cast_nullable_to_non_nullable
              as CheeseReview?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      stars: freezed == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int?,
      pizzaType: freezed == pizzaType
          ? _value.pizzaType
          : pizzaType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      pizzaPlace: freezed == pizzaPlace
          ? _value.pizzaPlace
          : pizzaPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$ReviewImpl implements _Review {
  const _$ReviewImpl(
      {required this.crust,
      required this.sauce,
      required this.cheese,
      @JsonKey(name: '_id') required this.id,
      required this.stars,
      required this.pizzaType,
      required this.description,
      final List<String?>? photos = const [],
      required this.user,
      required this.pizzaPlace,
      required this.createdAt,
      required this.updatedAt})
      : _photos = photos;

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final CrustReview? crust;
  @override
  final SauceReview? sauce;
  @override
  final CheeseReview? cheese;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? stars;
  @override
  final String? pizzaType;
  @override
  final String? description;
  final List<String?>? _photos;
  @override
  @JsonKey()
  List<String?>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserModel? user;
  @override
  final String? pizzaPlace;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Review(crust: $crust, sauce: $sauce, cheese: $cheese, id: $id, stars: $stars, pizzaType: $pizzaType, description: $description, photos: $photos, user: $user, pizzaPlace: $pizzaPlace, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.crust, crust) || other.crust == crust) &&
            (identical(other.sauce, sauce) || other.sauce == sauce) &&
            (identical(other.cheese, cheese) || other.cheese == cheese) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.pizzaType, pizzaType) ||
                other.pizzaType == pizzaType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.pizzaPlace, pizzaPlace) ||
                other.pizzaPlace == pizzaPlace) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      crust,
      sauce,
      cheese,
      id,
      stars,
      pizzaType,
      description,
      const DeepCollectionEquality().hash(_photos),
      user,
      pizzaPlace,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {required final CrustReview? crust,
      required final SauceReview? sauce,
      required final CheeseReview? cheese,
      @JsonKey(name: '_id') required final String? id,
      required final int? stars,
      required final String? pizzaType,
      required final String? description,
      final List<String?>? photos,
      required final UserModel? user,
      required final String? pizzaPlace,
      required final String? createdAt,
      required final String? updatedAt}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  CrustReview? get crust;
  @override
  SauceReview? get sauce;
  @override
  CheeseReview? get cheese;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  int? get stars;
  @override
  String? get pizzaType;
  @override
  String? get description;
  @override
  List<String?>? get photos;
  @override
  UserModel? get user;
  @override
  String? get pizzaPlace;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CrustReview _$CrustReviewFromJson(Map<String, dynamic> json) {
  return _CrustReview.fromJson(json);
}

/// @nodoc
mixin _$CrustReview {
  String? get thickness => throw _privateConstructorUsedError;
  bool get crispy => throw _privateConstructorUsedError;
  bool? get dry =>
      throw _privateConstructorUsedError; // ✅ Change from `required bool` to `bool?`
  bool? get fluffy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrustReviewCopyWith<CrustReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrustReviewCopyWith<$Res> {
  factory $CrustReviewCopyWith(
          CrustReview value, $Res Function(CrustReview) then) =
      _$CrustReviewCopyWithImpl<$Res, CrustReview>;
  @useResult
  $Res call({String? thickness, bool crispy, bool? dry, bool? fluffy});
}

/// @nodoc
class _$CrustReviewCopyWithImpl<$Res, $Val extends CrustReview>
    implements $CrustReviewCopyWith<$Res> {
  _$CrustReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thickness = freezed,
    Object? crispy = null,
    Object? dry = freezed,
    Object? fluffy = freezed,
  }) {
    return _then(_value.copyWith(
      thickness: freezed == thickness
          ? _value.thickness
          : thickness // ignore: cast_nullable_to_non_nullable
              as String?,
      crispy: null == crispy
          ? _value.crispy
          : crispy // ignore: cast_nullable_to_non_nullable
              as bool,
      dry: freezed == dry
          ? _value.dry
          : dry // ignore: cast_nullable_to_non_nullable
              as bool?,
      fluffy: freezed == fluffy
          ? _value.fluffy
          : fluffy // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrustReviewImplCopyWith<$Res>
    implements $CrustReviewCopyWith<$Res> {
  factory _$$CrustReviewImplCopyWith(
          _$CrustReviewImpl value, $Res Function(_$CrustReviewImpl) then) =
      __$$CrustReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? thickness, bool crispy, bool? dry, bool? fluffy});
}

/// @nodoc
class __$$CrustReviewImplCopyWithImpl<$Res>
    extends _$CrustReviewCopyWithImpl<$Res, _$CrustReviewImpl>
    implements _$$CrustReviewImplCopyWith<$Res> {
  __$$CrustReviewImplCopyWithImpl(
      _$CrustReviewImpl _value, $Res Function(_$CrustReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thickness = freezed,
    Object? crispy = null,
    Object? dry = freezed,
    Object? fluffy = freezed,
  }) {
    return _then(_$CrustReviewImpl(
      thickness: freezed == thickness
          ? _value.thickness
          : thickness // ignore: cast_nullable_to_non_nullable
              as String?,
      crispy: null == crispy
          ? _value.crispy
          : crispy // ignore: cast_nullable_to_non_nullable
              as bool,
      dry: freezed == dry
          ? _value.dry
          : dry // ignore: cast_nullable_to_non_nullable
              as bool?,
      fluffy: freezed == fluffy
          ? _value.fluffy
          : fluffy // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$CrustReviewImpl implements _CrustReview {
  const _$CrustReviewImpl(
      {required this.thickness, required this.crispy, this.dry, this.fluffy});

  factory _$CrustReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrustReviewImplFromJson(json);

  @override
  final String? thickness;
  @override
  final bool crispy;
  @override
  final bool? dry;
// ✅ Change from `required bool` to `bool?`
  @override
  final bool? fluffy;

  @override
  String toString() {
    return 'CrustReview(thickness: $thickness, crispy: $crispy, dry: $dry, fluffy: $fluffy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrustReviewImpl &&
            (identical(other.thickness, thickness) ||
                other.thickness == thickness) &&
            (identical(other.crispy, crispy) || other.crispy == crispy) &&
            (identical(other.dry, dry) || other.dry == dry) &&
            (identical(other.fluffy, fluffy) || other.fluffy == fluffy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, thickness, crispy, dry, fluffy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrustReviewImplCopyWith<_$CrustReviewImpl> get copyWith =>
      __$$CrustReviewImplCopyWithImpl<_$CrustReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrustReviewImplToJson(
      this,
    );
  }
}

abstract class _CrustReview implements CrustReview {
  const factory _CrustReview(
      {required final String? thickness,
      required final bool crispy,
      final bool? dry,
      final bool? fluffy}) = _$CrustReviewImpl;

  factory _CrustReview.fromJson(Map<String, dynamic> json) =
      _$CrustReviewImpl.fromJson;

  @override
  String? get thickness;
  @override
  bool get crispy;
  @override
  bool? get dry;
  @override // ✅ Change from `required bool` to `bool?`
  bool? get fluffy;
  @override
  @JsonKey(ignore: true)
  _$$CrustReviewImplCopyWith<_$CrustReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SauceReview _$SauceReviewFromJson(Map<String, dynamic> json) {
  return _SauceReview.fromJson(json);
}

/// @nodoc
mixin _$SauceReview {
  String? get sweetOrSpicy => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SauceReviewCopyWith<SauceReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SauceReviewCopyWith<$Res> {
  factory $SauceReviewCopyWith(
          SauceReview value, $Res Function(SauceReview) then) =
      _$SauceReviewCopyWithImpl<$Res, SauceReview>;
  @useResult
  $Res call({String? sweetOrSpicy, String? amount});
}

/// @nodoc
class _$SauceReviewCopyWithImpl<$Res, $Val extends SauceReview>
    implements $SauceReviewCopyWith<$Res> {
  _$SauceReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sweetOrSpicy = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      sweetOrSpicy: freezed == sweetOrSpicy
          ? _value.sweetOrSpicy
          : sweetOrSpicy // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SauceReviewImplCopyWith<$Res>
    implements $SauceReviewCopyWith<$Res> {
  factory _$$SauceReviewImplCopyWith(
          _$SauceReviewImpl value, $Res Function(_$SauceReviewImpl) then) =
      __$$SauceReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? sweetOrSpicy, String? amount});
}

/// @nodoc
class __$$SauceReviewImplCopyWithImpl<$Res>
    extends _$SauceReviewCopyWithImpl<$Res, _$SauceReviewImpl>
    implements _$$SauceReviewImplCopyWith<$Res> {
  __$$SauceReviewImplCopyWithImpl(
      _$SauceReviewImpl _value, $Res Function(_$SauceReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sweetOrSpicy = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$SauceReviewImpl(
      sweetOrSpicy: freezed == sweetOrSpicy
          ? _value.sweetOrSpicy
          : sweetOrSpicy // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$SauceReviewImpl implements _SauceReview {
  const _$SauceReviewImpl({required this.sweetOrSpicy, required this.amount});

  factory _$SauceReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$SauceReviewImplFromJson(json);

  @override
  final String? sweetOrSpicy;
  @override
  final String? amount;

  @override
  String toString() {
    return 'SauceReview(sweetOrSpicy: $sweetOrSpicy, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SauceReviewImpl &&
            (identical(other.sweetOrSpicy, sweetOrSpicy) ||
                other.sweetOrSpicy == sweetOrSpicy) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sweetOrSpicy, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SauceReviewImplCopyWith<_$SauceReviewImpl> get copyWith =>
      __$$SauceReviewImplCopyWithImpl<_$SauceReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SauceReviewImplToJson(
      this,
    );
  }
}

abstract class _SauceReview implements SauceReview {
  const factory _SauceReview(
      {required final String? sweetOrSpicy,
      required final String? amount}) = _$SauceReviewImpl;

  factory _SauceReview.fromJson(Map<String, dynamic> json) =
      _$SauceReviewImpl.fromJson;

  @override
  String? get sweetOrSpicy;
  @override
  String? get amount;
  @override
  @JsonKey(ignore: true)
  _$$SauceReviewImplCopyWith<_$SauceReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheeseReview _$CheeseReviewFromJson(Map<String, dynamic> json) {
  return _CheeseReview.fromJson(json);
}

/// @nodoc
mixin _$CheeseReview {
  String? get amount => throw _privateConstructorUsedError;
  String? get taste => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheeseReviewCopyWith<CheeseReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheeseReviewCopyWith<$Res> {
  factory $CheeseReviewCopyWith(
          CheeseReview value, $Res Function(CheeseReview) then) =
      _$CheeseReviewCopyWithImpl<$Res, CheeseReview>;
  @useResult
  $Res call({String? amount, String? taste});
}

/// @nodoc
class _$CheeseReviewCopyWithImpl<$Res, $Val extends CheeseReview>
    implements $CheeseReviewCopyWith<$Res> {
  _$CheeseReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? taste = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      taste: freezed == taste
          ? _value.taste
          : taste // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheeseReviewImplCopyWith<$Res>
    implements $CheeseReviewCopyWith<$Res> {
  factory _$$CheeseReviewImplCopyWith(
          _$CheeseReviewImpl value, $Res Function(_$CheeseReviewImpl) then) =
      __$$CheeseReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? amount, String? taste});
}

/// @nodoc
class __$$CheeseReviewImplCopyWithImpl<$Res>
    extends _$CheeseReviewCopyWithImpl<$Res, _$CheeseReviewImpl>
    implements _$$CheeseReviewImplCopyWith<$Res> {
  __$$CheeseReviewImplCopyWithImpl(
      _$CheeseReviewImpl _value, $Res Function(_$CheeseReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? taste = freezed,
  }) {
    return _then(_$CheeseReviewImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      taste: freezed == taste
          ? _value.taste
          : taste // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$CheeseReviewImpl implements _CheeseReview {
  const _$CheeseReviewImpl({required this.amount, required this.taste});

  factory _$CheeseReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheeseReviewImplFromJson(json);

  @override
  final String? amount;
  @override
  final String? taste;

  @override
  String toString() {
    return 'CheeseReview(amount: $amount, taste: $taste)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheeseReviewImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.taste, taste) || other.taste == taste));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, taste);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheeseReviewImplCopyWith<_$CheeseReviewImpl> get copyWith =>
      __$$CheeseReviewImplCopyWithImpl<_$CheeseReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheeseReviewImplToJson(
      this,
    );
  }
}

abstract class _CheeseReview implements CheeseReview {
  const factory _CheeseReview(
      {required final String? amount,
      required final String? taste}) = _$CheeseReviewImpl;

  factory _CheeseReview.fromJson(Map<String, dynamic> json) =
      _$CheeseReviewImpl.fromJson;

  @override
  String? get amount;
  @override
  String? get taste;
  @override
  @JsonKey(ignore: true)
  _$$CheeseReviewImplCopyWith<_$CheeseReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
