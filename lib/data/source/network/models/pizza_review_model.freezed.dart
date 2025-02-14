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
  Summary? get summary => throw _privateConstructorUsedError;
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
  $Res call({Summary? summary, List<Review?>? reviews, String? userId});

  $SummaryCopyWith<$Res>? get summary;
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
    Object? summary = freezed,
    Object? reviews = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary?,
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

  @override
  @pragma('vm:prefer-inline')
  $SummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $SummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
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
  $Res call({Summary? summary, List<Review?>? reviews, String? userId});

  @override
  $SummaryCopyWith<$Res>? get summary;
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
    Object? summary = freezed,
    Object? reviews = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$PizzaReviewModelImpl(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary?,
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
      {required this.summary,
      final List<Review?>? reviews = const [],
      required this.userId})
      : _reviews = reviews;

  factory _$PizzaReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PizzaReviewModelImplFromJson(json);

  @override
  final Summary? summary;
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
    return 'PizzaReviewModel(summary: $summary, reviews: $reviews, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PizzaReviewModelImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, summary,
      const DeepCollectionEquality().hash(_reviews), userId);

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
      {required final Summary? summary,
      final List<Review?>? reviews,
      required final String? userId}) = _$PizzaReviewModelImpl;

  factory _PizzaReviewModel.fromJson(Map<String, dynamic> json) =
      _$PizzaReviewModelImpl.fromJson;

  @override
  Summary? get summary;
  @override
  List<Review?>? get reviews;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$PizzaReviewModelImplCopyWith<_$PizzaReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

/// @nodoc
mixin _$Summary {
  Sauce? get sauce => throw _privateConstructorUsedError;
  Cheese? get cheese => throw _privateConstructorUsedError;
  Crust? get crust => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryCopyWith<Summary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res, Summary>;
  @useResult
  $Res call({Sauce? sauce, Cheese? cheese, Crust? crust});

  $SauceCopyWith<$Res>? get sauce;
  $CheeseCopyWith<$Res>? get cheese;
  $CrustCopyWith<$Res>? get crust;
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res, $Val extends Summary>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sauce = freezed,
    Object? cheese = freezed,
    Object? crust = freezed,
  }) {
    return _then(_value.copyWith(
      sauce: freezed == sauce
          ? _value.sauce
          : sauce // ignore: cast_nullable_to_non_nullable
              as Sauce?,
      cheese: freezed == cheese
          ? _value.cheese
          : cheese // ignore: cast_nullable_to_non_nullable
              as Cheese?,
      crust: freezed == crust
          ? _value.crust
          : crust // ignore: cast_nullable_to_non_nullable
              as Crust?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SauceCopyWith<$Res>? get sauce {
    if (_value.sauce == null) {
      return null;
    }

    return $SauceCopyWith<$Res>(_value.sauce!, (value) {
      return _then(_value.copyWith(sauce: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CheeseCopyWith<$Res>? get cheese {
    if (_value.cheese == null) {
      return null;
    }

    return $CheeseCopyWith<$Res>(_value.cheese!, (value) {
      return _then(_value.copyWith(cheese: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CrustCopyWith<$Res>? get crust {
    if (_value.crust == null) {
      return null;
    }

    return $CrustCopyWith<$Res>(_value.crust!, (value) {
      return _then(_value.copyWith(crust: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SummaryImplCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$$SummaryImplCopyWith(
          _$SummaryImpl value, $Res Function(_$SummaryImpl) then) =
      __$$SummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Sauce? sauce, Cheese? cheese, Crust? crust});

  @override
  $SauceCopyWith<$Res>? get sauce;
  @override
  $CheeseCopyWith<$Res>? get cheese;
  @override
  $CrustCopyWith<$Res>? get crust;
}

/// @nodoc
class __$$SummaryImplCopyWithImpl<$Res>
    extends _$SummaryCopyWithImpl<$Res, _$SummaryImpl>
    implements _$$SummaryImplCopyWith<$Res> {
  __$$SummaryImplCopyWithImpl(
      _$SummaryImpl _value, $Res Function(_$SummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sauce = freezed,
    Object? cheese = freezed,
    Object? crust = freezed,
  }) {
    return _then(_$SummaryImpl(
      sauce: freezed == sauce
          ? _value.sauce
          : sauce // ignore: cast_nullable_to_non_nullable
              as Sauce?,
      cheese: freezed == cheese
          ? _value.cheese
          : cheese // ignore: cast_nullable_to_non_nullable
              as Cheese?,
      crust: freezed == crust
          ? _value.crust
          : crust // ignore: cast_nullable_to_non_nullable
              as Crust?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$SummaryImpl implements _Summary {
  const _$SummaryImpl(
      {required this.sauce, required this.cheese, required this.crust});

  factory _$SummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImplFromJson(json);

  @override
  final Sauce? sauce;
  @override
  final Cheese? cheese;
  @override
  final Crust? crust;

  @override
  String toString() {
    return 'Summary(sauce: $sauce, cheese: $cheese, crust: $crust)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.sauce, sauce) || other.sauce == sauce) &&
            (identical(other.cheese, cheese) || other.cheese == cheese) &&
            (identical(other.crust, crust) || other.crust == crust));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sauce, cheese, crust);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      __$$SummaryImplCopyWithImpl<_$SummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryImplToJson(
      this,
    );
  }
}

abstract class _Summary implements Summary {
  const factory _Summary(
      {required final Sauce? sauce,
      required final Cheese? cheese,
      required final Crust? crust}) = _$SummaryImpl;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$SummaryImpl.fromJson;

  @override
  Sauce? get sauce;
  @override
  Cheese? get cheese;
  @override
  Crust? get crust;
  @override
  @JsonKey(ignore: true)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Sauce _$SauceFromJson(Map<String, dynamic> json) {
  return _Sauce.fromJson(json);
}

/// @nodoc
mixin _$Sauce {
  int? get sauceSweet => throw _privateConstructorUsedError;
  int? get sauceSpicy => throw _privateConstructorUsedError;
  int? get sauceNoFlavour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SauceCopyWith<Sauce> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SauceCopyWith<$Res> {
  factory $SauceCopyWith(Sauce value, $Res Function(Sauce) then) =
      _$SauceCopyWithImpl<$Res, Sauce>;
  @useResult
  $Res call({int? sauceSweet, int? sauceSpicy, int? sauceNoFlavour});
}

/// @nodoc
class _$SauceCopyWithImpl<$Res, $Val extends Sauce>
    implements $SauceCopyWith<$Res> {
  _$SauceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sauceSweet = freezed,
    Object? sauceSpicy = freezed,
    Object? sauceNoFlavour = freezed,
  }) {
    return _then(_value.copyWith(
      sauceSweet: freezed == sauceSweet
          ? _value.sauceSweet
          : sauceSweet // ignore: cast_nullable_to_non_nullable
              as int?,
      sauceSpicy: freezed == sauceSpicy
          ? _value.sauceSpicy
          : sauceSpicy // ignore: cast_nullable_to_non_nullable
              as int?,
      sauceNoFlavour: freezed == sauceNoFlavour
          ? _value.sauceNoFlavour
          : sauceNoFlavour // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SauceImplCopyWith<$Res> implements $SauceCopyWith<$Res> {
  factory _$$SauceImplCopyWith(
          _$SauceImpl value, $Res Function(_$SauceImpl) then) =
      __$$SauceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? sauceSweet, int? sauceSpicy, int? sauceNoFlavour});
}

/// @nodoc
class __$$SauceImplCopyWithImpl<$Res>
    extends _$SauceCopyWithImpl<$Res, _$SauceImpl>
    implements _$$SauceImplCopyWith<$Res> {
  __$$SauceImplCopyWithImpl(
      _$SauceImpl _value, $Res Function(_$SauceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sauceSweet = freezed,
    Object? sauceSpicy = freezed,
    Object? sauceNoFlavour = freezed,
  }) {
    return _then(_$SauceImpl(
      sauceSweet: freezed == sauceSweet
          ? _value.sauceSweet
          : sauceSweet // ignore: cast_nullable_to_non_nullable
              as int?,
      sauceSpicy: freezed == sauceSpicy
          ? _value.sauceSpicy
          : sauceSpicy // ignore: cast_nullable_to_non_nullable
              as int?,
      sauceNoFlavour: freezed == sauceNoFlavour
          ? _value.sauceNoFlavour
          : sauceNoFlavour // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$SauceImpl implements _Sauce {
  const _$SauceImpl(
      {required this.sauceSweet,
      required this.sauceSpicy,
      required this.sauceNoFlavour});

  factory _$SauceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SauceImplFromJson(json);

  @override
  final int? sauceSweet;
  @override
  final int? sauceSpicy;
  @override
  final int? sauceNoFlavour;

  @override
  String toString() {
    return 'Sauce(sauceSweet: $sauceSweet, sauceSpicy: $sauceSpicy, sauceNoFlavour: $sauceNoFlavour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SauceImpl &&
            (identical(other.sauceSweet, sauceSweet) ||
                other.sauceSweet == sauceSweet) &&
            (identical(other.sauceSpicy, sauceSpicy) ||
                other.sauceSpicy == sauceSpicy) &&
            (identical(other.sauceNoFlavour, sauceNoFlavour) ||
                other.sauceNoFlavour == sauceNoFlavour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sauceSweet, sauceSpicy, sauceNoFlavour);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SauceImplCopyWith<_$SauceImpl> get copyWith =>
      __$$SauceImplCopyWithImpl<_$SauceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SauceImplToJson(
      this,
    );
  }
}

abstract class _Sauce implements Sauce {
  const factory _Sauce(
      {required final int? sauceSweet,
      required final int? sauceSpicy,
      required final int? sauceNoFlavour}) = _$SauceImpl;

  factory _Sauce.fromJson(Map<String, dynamic> json) = _$SauceImpl.fromJson;

  @override
  int? get sauceSweet;
  @override
  int? get sauceSpicy;
  @override
  int? get sauceNoFlavour;
  @override
  @JsonKey(ignore: true)
  _$$SauceImplCopyWith<_$SauceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cheese _$CheeseFromJson(Map<String, dynamic> json) {
  return _Cheese.fromJson(json);
}

/// @nodoc
mixin _$Cheese {
  int? get cheeseGreat => throw _privateConstructorUsedError;
  int? get cheeseEhh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheeseCopyWith<Cheese> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheeseCopyWith<$Res> {
  factory $CheeseCopyWith(Cheese value, $Res Function(Cheese) then) =
      _$CheeseCopyWithImpl<$Res, Cheese>;
  @useResult
  $Res call({int? cheeseGreat, int? cheeseEhh});
}

/// @nodoc
class _$CheeseCopyWithImpl<$Res, $Val extends Cheese>
    implements $CheeseCopyWith<$Res> {
  _$CheeseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cheeseGreat = freezed,
    Object? cheeseEhh = freezed,
  }) {
    return _then(_value.copyWith(
      cheeseGreat: freezed == cheeseGreat
          ? _value.cheeseGreat
          : cheeseGreat // ignore: cast_nullable_to_non_nullable
              as int?,
      cheeseEhh: freezed == cheeseEhh
          ? _value.cheeseEhh
          : cheeseEhh // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheeseImplCopyWith<$Res> implements $CheeseCopyWith<$Res> {
  factory _$$CheeseImplCopyWith(
          _$CheeseImpl value, $Res Function(_$CheeseImpl) then) =
      __$$CheeseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? cheeseGreat, int? cheeseEhh});
}

/// @nodoc
class __$$CheeseImplCopyWithImpl<$Res>
    extends _$CheeseCopyWithImpl<$Res, _$CheeseImpl>
    implements _$$CheeseImplCopyWith<$Res> {
  __$$CheeseImplCopyWithImpl(
      _$CheeseImpl _value, $Res Function(_$CheeseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cheeseGreat = freezed,
    Object? cheeseEhh = freezed,
  }) {
    return _then(_$CheeseImpl(
      cheeseGreat: freezed == cheeseGreat
          ? _value.cheeseGreat
          : cheeseGreat // ignore: cast_nullable_to_non_nullable
              as int?,
      cheeseEhh: freezed == cheeseEhh
          ? _value.cheeseEhh
          : cheeseEhh // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$CheeseImpl implements _Cheese {
  const _$CheeseImpl({required this.cheeseGreat, required this.cheeseEhh});

  factory _$CheeseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheeseImplFromJson(json);

  @override
  final int? cheeseGreat;
  @override
  final int? cheeseEhh;

  @override
  String toString() {
    return 'Cheese(cheeseGreat: $cheeseGreat, cheeseEhh: $cheeseEhh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheeseImpl &&
            (identical(other.cheeseGreat, cheeseGreat) ||
                other.cheeseGreat == cheeseGreat) &&
            (identical(other.cheeseEhh, cheeseEhh) ||
                other.cheeseEhh == cheeseEhh));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cheeseGreat, cheeseEhh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheeseImplCopyWith<_$CheeseImpl> get copyWith =>
      __$$CheeseImplCopyWithImpl<_$CheeseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheeseImplToJson(
      this,
    );
  }
}

abstract class _Cheese implements Cheese {
  const factory _Cheese(
      {required final int? cheeseGreat,
      required final int? cheeseEhh}) = _$CheeseImpl;

  factory _Cheese.fromJson(Map<String, dynamic> json) = _$CheeseImpl.fromJson;

  @override
  int? get cheeseGreat;
  @override
  int? get cheeseEhh;
  @override
  @JsonKey(ignore: true)
  _$$CheeseImplCopyWith<_$CheeseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Crust _$CrustFromJson(Map<String, dynamic> json) {
  return _Crust.fromJson(json);
}

/// @nodoc
mixin _$Crust {
  int? get crustAverage => throw _privateConstructorUsedError;
  int? get crustThick => throw _privateConstructorUsedError;
  int? get crustThin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrustCopyWith<Crust> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrustCopyWith<$Res> {
  factory $CrustCopyWith(Crust value, $Res Function(Crust) then) =
      _$CrustCopyWithImpl<$Res, Crust>;
  @useResult
  $Res call({int? crustAverage, int? crustThick, int? crustThin});
}

/// @nodoc
class _$CrustCopyWithImpl<$Res, $Val extends Crust>
    implements $CrustCopyWith<$Res> {
  _$CrustCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crustAverage = freezed,
    Object? crustThick = freezed,
    Object? crustThin = freezed,
  }) {
    return _then(_value.copyWith(
      crustAverage: freezed == crustAverage
          ? _value.crustAverage
          : crustAverage // ignore: cast_nullable_to_non_nullable
              as int?,
      crustThick: freezed == crustThick
          ? _value.crustThick
          : crustThick // ignore: cast_nullable_to_non_nullable
              as int?,
      crustThin: freezed == crustThin
          ? _value.crustThin
          : crustThin // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrustImplCopyWith<$Res> implements $CrustCopyWith<$Res> {
  factory _$$CrustImplCopyWith(
          _$CrustImpl value, $Res Function(_$CrustImpl) then) =
      __$$CrustImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? crustAverage, int? crustThick, int? crustThin});
}

/// @nodoc
class __$$CrustImplCopyWithImpl<$Res>
    extends _$CrustCopyWithImpl<$Res, _$CrustImpl>
    implements _$$CrustImplCopyWith<$Res> {
  __$$CrustImplCopyWithImpl(
      _$CrustImpl _value, $Res Function(_$CrustImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crustAverage = freezed,
    Object? crustThick = freezed,
    Object? crustThin = freezed,
  }) {
    return _then(_$CrustImpl(
      crustAverage: freezed == crustAverage
          ? _value.crustAverage
          : crustAverage // ignore: cast_nullable_to_non_nullable
              as int?,
      crustThick: freezed == crustThick
          ? _value.crustThick
          : crustThick // ignore: cast_nullable_to_non_nullable
              as int?,
      crustThin: freezed == crustThin
          ? _value.crustThin
          : crustThin // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$CrustImpl implements _Crust {
  const _$CrustImpl(
      {required this.crustAverage,
      required this.crustThick,
      required this.crustThin});

  factory _$CrustImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrustImplFromJson(json);

  @override
  final int? crustAverage;
  @override
  final int? crustThick;
  @override
  final int? crustThin;

  @override
  String toString() {
    return 'Crust(crustAverage: $crustAverage, crustThick: $crustThick, crustThin: $crustThin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrustImpl &&
            (identical(other.crustAverage, crustAverage) ||
                other.crustAverage == crustAverage) &&
            (identical(other.crustThick, crustThick) ||
                other.crustThick == crustThick) &&
            (identical(other.crustThin, crustThin) ||
                other.crustThin == crustThin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, crustAverage, crustThick, crustThin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrustImplCopyWith<_$CrustImpl> get copyWith =>
      __$$CrustImplCopyWithImpl<_$CrustImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrustImplToJson(
      this,
    );
  }
}

abstract class _Crust implements Crust {
  const factory _Crust(
      {required final int? crustAverage,
      required final int? crustThick,
      required final int? crustThin}) = _$CrustImpl;

  factory _Crust.fromJson(Map<String, dynamic> json) = _$CrustImpl.fromJson;

  @override
  int? get crustAverage;
  @override
  int? get crustThick;
  @override
  int? get crustThin;
  @override
  @JsonKey(ignore: true)
  _$$CrustImplCopyWith<_$CrustImpl> get copyWith =>
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
      String? id,
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
      String? id,
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
      required this.id,
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
      required final String? id,
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
  List<String?>? get thickness => throw _privateConstructorUsedError;
  bool get crispy => throw _privateConstructorUsedError;

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
  $Res call({List<String?>? thickness, bool crispy});
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
  }) {
    return _then(_value.copyWith(
      thickness: freezed == thickness
          ? _value.thickness
          : thickness // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      crispy: null == crispy
          ? _value.crispy
          : crispy // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({List<String?>? thickness, bool crispy});
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
  }) {
    return _then(_$CrustReviewImpl(
      thickness: freezed == thickness
          ? _value._thickness
          : thickness // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      crispy: null == crispy
          ? _value.crispy
          : crispy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$CrustReviewImpl implements _CrustReview {
  const _$CrustReviewImpl(
      {final List<String?>? thickness = const [], required this.crispy})
      : _thickness = thickness;

  factory _$CrustReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrustReviewImplFromJson(json);

  final List<String?>? _thickness;
  @override
  @JsonKey()
  List<String?>? get thickness {
    final value = _thickness;
    if (value == null) return null;
    if (_thickness is EqualUnmodifiableListView) return _thickness;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool crispy;

  @override
  String toString() {
    return 'CrustReview(thickness: $thickness, crispy: $crispy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrustReviewImpl &&
            const DeepCollectionEquality()
                .equals(other._thickness, _thickness) &&
            (identical(other.crispy, crispy) || other.crispy == crispy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_thickness), crispy);

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
      {final List<String?>? thickness,
      required final bool crispy}) = _$CrustReviewImpl;

  factory _CrustReview.fromJson(Map<String, dynamic> json) =
      _$CrustReviewImpl.fromJson;

  @override
  List<String?>? get thickness;
  @override
  bool get crispy;
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
