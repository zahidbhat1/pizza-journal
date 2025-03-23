// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSearchesResponse _$UserSearchesResponseFromJson(Map<String, dynamic> json) {
  return _UserSearchesResponse.fromJson(json);
}

/// @nodoc
mixin _$UserSearchesResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<UserSearch> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSearchesResponseCopyWith<UserSearchesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchesResponseCopyWith<$Res> {
  factory $UserSearchesResponseCopyWith(UserSearchesResponse value,
          $Res Function(UserSearchesResponse) then) =
      _$UserSearchesResponseCopyWithImpl<$Res, UserSearchesResponse>;
  @useResult
  $Res call({bool success, String message, List<UserSearch> data});
}

/// @nodoc
class _$UserSearchesResponseCopyWithImpl<$Res,
        $Val extends UserSearchesResponse>
    implements $UserSearchesResponseCopyWith<$Res> {
  _$UserSearchesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserSearch>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSearchesResponseImplCopyWith<$Res>
    implements $UserSearchesResponseCopyWith<$Res> {
  factory _$$UserSearchesResponseImplCopyWith(_$UserSearchesResponseImpl value,
          $Res Function(_$UserSearchesResponseImpl) then) =
      __$$UserSearchesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<UserSearch> data});
}

/// @nodoc
class __$$UserSearchesResponseImplCopyWithImpl<$Res>
    extends _$UserSearchesResponseCopyWithImpl<$Res, _$UserSearchesResponseImpl>
    implements _$$UserSearchesResponseImplCopyWith<$Res> {
  __$$UserSearchesResponseImplCopyWithImpl(_$UserSearchesResponseImpl _value,
      $Res Function(_$UserSearchesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$UserSearchesResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserSearch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSearchesResponseImpl implements _UserSearchesResponse {
  const _$UserSearchesResponseImpl(
      {required this.success,
      required this.message,
      required final List<UserSearch> data})
      : _data = data;

  factory _$UserSearchesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSearchesResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<UserSearch> _data;
  @override
  List<UserSearch> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'UserSearchesResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchesResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchesResponseImplCopyWith<_$UserSearchesResponseImpl>
      get copyWith =>
          __$$UserSearchesResponseImplCopyWithImpl<_$UserSearchesResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSearchesResponseImplToJson(
      this,
    );
  }
}

abstract class _UserSearchesResponse implements UserSearchesResponse {
  const factory _UserSearchesResponse(
      {required final bool success,
      required final String message,
      required final List<UserSearch> data}) = _$UserSearchesResponseImpl;

  factory _UserSearchesResponse.fromJson(Map<String, dynamic> json) =
      _$UserSearchesResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<UserSearch> get data;
  @override
  @JsonKey(ignore: true)
  _$$UserSearchesResponseImplCopyWith<_$UserSearchesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserSearch _$UserSearchFromJson(Map<String, dynamic> json) {
  return _UserSearch.fromJson(json);
}

/// @nodoc
mixin _$UserSearch {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get searchCustomName => throw _privateConstructorUsedError;
  String? get placeName => throw _privateConstructorUsedError;
  String? get pizzaType => throw _privateConstructorUsedError;
  int? get minRating => throw _privateConstructorUsedError;
  String? get sauceSweetOrSpicy => throw _privateConstructorUsedError;
  String? get sauceAmount => throw _privateConstructorUsedError;
  String? get cheeseAmount => throw _privateConstructorUsedError;
  String? get cheeseTaste => throw _privateConstructorUsedError;
  String? get crustThickness => throw _privateConstructorUsedError;
  bool? get crustCrispy => throw _privateConstructorUsedError;
  bool? get crustDry => throw _privateConstructorUsedError;
  bool? get crustFluffy => throw _privateConstructorUsedError;
  String? get screenName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSearchCopyWith<UserSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchCopyWith<$Res> {
  factory $UserSearchCopyWith(
          UserSearch value, $Res Function(UserSearch) then) =
      _$UserSearchCopyWithImpl<$Res, UserSearch>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String userId,
      String? searchCustomName,
      String? placeName,
      String? pizzaType,
      int? minRating,
      String? sauceSweetOrSpicy,
      String? sauceAmount,
      String? cheeseAmount,
      String? cheeseTaste,
      String? crustThickness,
      bool? crustCrispy,
      bool? crustDry,
      bool? crustFluffy,
      String? screenName,
      DateTime createdAt,
      @JsonKey(name: '__v') int version});
}

/// @nodoc
class _$UserSearchCopyWithImpl<$Res, $Val extends UserSearch>
    implements $UserSearchCopyWith<$Res> {
  _$UserSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? searchCustomName = freezed,
    Object? placeName = freezed,
    Object? pizzaType = freezed,
    Object? minRating = freezed,
    Object? sauceSweetOrSpicy = freezed,
    Object? sauceAmount = freezed,
    Object? cheeseAmount = freezed,
    Object? cheeseTaste = freezed,
    Object? crustThickness = freezed,
    Object? crustCrispy = freezed,
    Object? crustDry = freezed,
    Object? crustFluffy = freezed,
    Object? screenName = freezed,
    Object? createdAt = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      searchCustomName: freezed == searchCustomName
          ? _value.searchCustomName
          : searchCustomName // ignore: cast_nullable_to_non_nullable
              as String?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      pizzaType: freezed == pizzaType
          ? _value.pizzaType
          : pizzaType // ignore: cast_nullable_to_non_nullable
              as String?,
      minRating: freezed == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as int?,
      sauceSweetOrSpicy: freezed == sauceSweetOrSpicy
          ? _value.sauceSweetOrSpicy
          : sauceSweetOrSpicy // ignore: cast_nullable_to_non_nullable
              as String?,
      sauceAmount: freezed == sauceAmount
          ? _value.sauceAmount
          : sauceAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      cheeseAmount: freezed == cheeseAmount
          ? _value.cheeseAmount
          : cheeseAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      cheeseTaste: freezed == cheeseTaste
          ? _value.cheeseTaste
          : cheeseTaste // ignore: cast_nullable_to_non_nullable
              as String?,
      crustThickness: freezed == crustThickness
          ? _value.crustThickness
          : crustThickness // ignore: cast_nullable_to_non_nullable
              as String?,
      crustCrispy: freezed == crustCrispy
          ? _value.crustCrispy
          : crustCrispy // ignore: cast_nullable_to_non_nullable
              as bool?,
      crustDry: freezed == crustDry
          ? _value.crustDry
          : crustDry // ignore: cast_nullable_to_non_nullable
              as bool?,
      crustFluffy: freezed == crustFluffy
          ? _value.crustFluffy
          : crustFluffy // ignore: cast_nullable_to_non_nullable
              as bool?,
      screenName: freezed == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSearchImplCopyWith<$Res>
    implements $UserSearchCopyWith<$Res> {
  factory _$$UserSearchImplCopyWith(
          _$UserSearchImpl value, $Res Function(_$UserSearchImpl) then) =
      __$$UserSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String userId,
      String? searchCustomName,
      String? placeName,
      String? pizzaType,
      int? minRating,
      String? sauceSweetOrSpicy,
      String? sauceAmount,
      String? cheeseAmount,
      String? cheeseTaste,
      String? crustThickness,
      bool? crustCrispy,
      bool? crustDry,
      bool? crustFluffy,
      String? screenName,
      DateTime createdAt,
      @JsonKey(name: '__v') int version});
}

/// @nodoc
class __$$UserSearchImplCopyWithImpl<$Res>
    extends _$UserSearchCopyWithImpl<$Res, _$UserSearchImpl>
    implements _$$UserSearchImplCopyWith<$Res> {
  __$$UserSearchImplCopyWithImpl(
      _$UserSearchImpl _value, $Res Function(_$UserSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? searchCustomName = freezed,
    Object? placeName = freezed,
    Object? pizzaType = freezed,
    Object? minRating = freezed,
    Object? sauceSweetOrSpicy = freezed,
    Object? sauceAmount = freezed,
    Object? cheeseAmount = freezed,
    Object? cheeseTaste = freezed,
    Object? crustThickness = freezed,
    Object? crustCrispy = freezed,
    Object? crustDry = freezed,
    Object? crustFluffy = freezed,
    Object? screenName = freezed,
    Object? createdAt = null,
    Object? version = null,
  }) {
    return _then(_$UserSearchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      searchCustomName: freezed == searchCustomName
          ? _value.searchCustomName
          : searchCustomName // ignore: cast_nullable_to_non_nullable
              as String?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      pizzaType: freezed == pizzaType
          ? _value.pizzaType
          : pizzaType // ignore: cast_nullable_to_non_nullable
              as String?,
      minRating: freezed == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as int?,
      sauceSweetOrSpicy: freezed == sauceSweetOrSpicy
          ? _value.sauceSweetOrSpicy
          : sauceSweetOrSpicy // ignore: cast_nullable_to_non_nullable
              as String?,
      sauceAmount: freezed == sauceAmount
          ? _value.sauceAmount
          : sauceAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      cheeseAmount: freezed == cheeseAmount
          ? _value.cheeseAmount
          : cheeseAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      cheeseTaste: freezed == cheeseTaste
          ? _value.cheeseTaste
          : cheeseTaste // ignore: cast_nullable_to_non_nullable
              as String?,
      crustThickness: freezed == crustThickness
          ? _value.crustThickness
          : crustThickness // ignore: cast_nullable_to_non_nullable
              as String?,
      crustCrispy: freezed == crustCrispy
          ? _value.crustCrispy
          : crustCrispy // ignore: cast_nullable_to_non_nullable
              as bool?,
      crustDry: freezed == crustDry
          ? _value.crustDry
          : crustDry // ignore: cast_nullable_to_non_nullable
              as bool?,
      crustFluffy: freezed == crustFluffy
          ? _value.crustFluffy
          : crustFluffy // ignore: cast_nullable_to_non_nullable
              as bool?,
      screenName: freezed == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSearchImpl implements _UserSearch {
  const _$UserSearchImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.userId,
      this.searchCustomName,
      this.placeName,
      this.pizzaType,
      this.minRating,
      this.sauceSweetOrSpicy,
      this.sauceAmount,
      this.cheeseAmount,
      this.cheeseTaste,
      this.crustThickness,
      this.crustCrispy,
      this.crustDry,
      this.crustFluffy,
      this.screenName,
      required this.createdAt,
      @JsonKey(name: '__v') required this.version});

  factory _$UserSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSearchImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String userId;
  @override
  final String? searchCustomName;
  @override
  final String? placeName;
  @override
  final String? pizzaType;
  @override
  final int? minRating;
  @override
  final String? sauceSweetOrSpicy;
  @override
  final String? sauceAmount;
  @override
  final String? cheeseAmount;
  @override
  final String? cheeseTaste;
  @override
  final String? crustThickness;
  @override
  final bool? crustCrispy;
  @override
  final bool? crustDry;
  @override
  final bool? crustFluffy;
  @override
  final String? screenName;
  @override
  final DateTime createdAt;
  @override
  @JsonKey(name: '__v')
  final int version;

  @override
  String toString() {
    return 'UserSearch(id: $id, userId: $userId, searchCustomName: $searchCustomName, placeName: $placeName, pizzaType: $pizzaType, minRating: $minRating, sauceSweetOrSpicy: $sauceSweetOrSpicy, sauceAmount: $sauceAmount, cheeseAmount: $cheeseAmount, cheeseTaste: $cheeseTaste, crustThickness: $crustThickness, crustCrispy: $crustCrispy, crustDry: $crustDry, crustFluffy: $crustFluffy, screenName: $screenName, createdAt: $createdAt, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.searchCustomName, searchCustomName) ||
                other.searchCustomName == searchCustomName) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.pizzaType, pizzaType) ||
                other.pizzaType == pizzaType) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.sauceSweetOrSpicy, sauceSweetOrSpicy) ||
                other.sauceSweetOrSpicy == sauceSweetOrSpicy) &&
            (identical(other.sauceAmount, sauceAmount) ||
                other.sauceAmount == sauceAmount) &&
            (identical(other.cheeseAmount, cheeseAmount) ||
                other.cheeseAmount == cheeseAmount) &&
            (identical(other.cheeseTaste, cheeseTaste) ||
                other.cheeseTaste == cheeseTaste) &&
            (identical(other.crustThickness, crustThickness) ||
                other.crustThickness == crustThickness) &&
            (identical(other.crustCrispy, crustCrispy) ||
                other.crustCrispy == crustCrispy) &&
            (identical(other.crustDry, crustDry) ||
                other.crustDry == crustDry) &&
            (identical(other.crustFluffy, crustFluffy) ||
                other.crustFluffy == crustFluffy) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      searchCustomName,
      placeName,
      pizzaType,
      minRating,
      sauceSweetOrSpicy,
      sauceAmount,
      cheeseAmount,
      cheeseTaste,
      crustThickness,
      crustCrispy,
      crustDry,
      crustFluffy,
      screenName,
      createdAt,
      version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchImplCopyWith<_$UserSearchImpl> get copyWith =>
      __$$UserSearchImplCopyWithImpl<_$UserSearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSearchImplToJson(
      this,
    );
  }
}

abstract class _UserSearch implements UserSearch {
  const factory _UserSearch(
      {@JsonKey(name: '_id') required final String id,
      required final String userId,
      final String? searchCustomName,
      final String? placeName,
      final String? pizzaType,
      final int? minRating,
      final String? sauceSweetOrSpicy,
      final String? sauceAmount,
      final String? cheeseAmount,
      final String? cheeseTaste,
      final String? crustThickness,
      final bool? crustCrispy,
      final bool? crustDry,
      final bool? crustFluffy,
      final String? screenName,
      required final DateTime createdAt,
      @JsonKey(name: '__v') required final int version}) = _$UserSearchImpl;

  factory _UserSearch.fromJson(Map<String, dynamic> json) =
      _$UserSearchImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get userId;
  @override
  String? get searchCustomName;
  @override
  String? get placeName;
  @override
  String? get pizzaType;
  @override
  int? get minRating;
  @override
  String? get sauceSweetOrSpicy;
  @override
  String? get sauceAmount;
  @override
  String? get cheeseAmount;
  @override
  String? get cheeseTaste;
  @override
  String? get crustThickness;
  @override
  bool? get crustCrispy;
  @override
  bool? get crustDry;
  @override
  bool? get crustFluffy;
  @override
  String? get screenName;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(name: '__v')
  int get version;
  @override
  @JsonKey(ignore: true)
  _$$UserSearchImplCopyWith<_$UserSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
