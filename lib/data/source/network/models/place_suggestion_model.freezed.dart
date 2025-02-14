// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_suggestion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceSuggestionsResponse _$PlaceSuggestionsResponseFromJson(
    Map<String, dynamic> json) {
  return _PlaceSuggestionsResponse.fromJson(json);
}

/// @nodoc
mixin _$PlaceSuggestionsResponse {
  String get status => throw _privateConstructorUsedError;
  PlaceSuggestionsData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceSuggestionsResponseCopyWith<PlaceSuggestionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceSuggestionsResponseCopyWith<$Res> {
  factory $PlaceSuggestionsResponseCopyWith(PlaceSuggestionsResponse value,
          $Res Function(PlaceSuggestionsResponse) then) =
      _$PlaceSuggestionsResponseCopyWithImpl<$Res, PlaceSuggestionsResponse>;
  @useResult
  $Res call({String status, PlaceSuggestionsData data});

  $PlaceSuggestionsDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PlaceSuggestionsResponseCopyWithImpl<$Res,
        $Val extends PlaceSuggestionsResponse>
    implements $PlaceSuggestionsResponseCopyWith<$Res> {
  _$PlaceSuggestionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PlaceSuggestionsData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceSuggestionsDataCopyWith<$Res> get data {
    return $PlaceSuggestionsDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceSuggestionsResponseImplCopyWith<$Res>
    implements $PlaceSuggestionsResponseCopyWith<$Res> {
  factory _$$PlaceSuggestionsResponseImplCopyWith(
          _$PlaceSuggestionsResponseImpl value,
          $Res Function(_$PlaceSuggestionsResponseImpl) then) =
      __$$PlaceSuggestionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, PlaceSuggestionsData data});

  @override
  $PlaceSuggestionsDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PlaceSuggestionsResponseImplCopyWithImpl<$Res>
    extends _$PlaceSuggestionsResponseCopyWithImpl<$Res,
        _$PlaceSuggestionsResponseImpl>
    implements _$$PlaceSuggestionsResponseImplCopyWith<$Res> {
  __$$PlaceSuggestionsResponseImplCopyWithImpl(
      _$PlaceSuggestionsResponseImpl _value,
      $Res Function(_$PlaceSuggestionsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$PlaceSuggestionsResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PlaceSuggestionsData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceSuggestionsResponseImpl implements _PlaceSuggestionsResponse {
  const _$PlaceSuggestionsResponseImpl(
      {required this.status, required this.data});

  factory _$PlaceSuggestionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceSuggestionsResponseImplFromJson(json);

  @override
  final String status;
  @override
  final PlaceSuggestionsData data;

  @override
  String toString() {
    return 'PlaceSuggestionsResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceSuggestionsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceSuggestionsResponseImplCopyWith<_$PlaceSuggestionsResponseImpl>
      get copyWith => __$$PlaceSuggestionsResponseImplCopyWithImpl<
          _$PlaceSuggestionsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceSuggestionsResponseImplToJson(
      this,
    );
  }
}

abstract class _PlaceSuggestionsResponse implements PlaceSuggestionsResponse {
  const factory _PlaceSuggestionsResponse(
          {required final String status,
          required final PlaceSuggestionsData data}) =
      _$PlaceSuggestionsResponseImpl;

  factory _PlaceSuggestionsResponse.fromJson(Map<String, dynamic> json) =
      _$PlaceSuggestionsResponseImpl.fromJson;

  @override
  String get status;
  @override
  PlaceSuggestionsData get data;
  @override
  @JsonKey(ignore: true)
  _$$PlaceSuggestionsResponseImplCopyWith<_$PlaceSuggestionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PlaceSuggestionsData _$PlaceSuggestionsDataFromJson(Map<String, dynamic> json) {
  return _PlaceSuggestionsData.fromJson(json);
}

/// @nodoc
mixin _$PlaceSuggestionsData {
  List<PlaceSuggestion> get suggestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceSuggestionsDataCopyWith<PlaceSuggestionsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceSuggestionsDataCopyWith<$Res> {
  factory $PlaceSuggestionsDataCopyWith(PlaceSuggestionsData value,
          $Res Function(PlaceSuggestionsData) then) =
      _$PlaceSuggestionsDataCopyWithImpl<$Res, PlaceSuggestionsData>;
  @useResult
  $Res call({List<PlaceSuggestion> suggestions});
}

/// @nodoc
class _$PlaceSuggestionsDataCopyWithImpl<$Res,
        $Val extends PlaceSuggestionsData>
    implements $PlaceSuggestionsDataCopyWith<$Res> {
  _$PlaceSuggestionsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
  }) {
    return _then(_value.copyWith(
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<PlaceSuggestion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceSuggestionsDataImplCopyWith<$Res>
    implements $PlaceSuggestionsDataCopyWith<$Res> {
  factory _$$PlaceSuggestionsDataImplCopyWith(_$PlaceSuggestionsDataImpl value,
          $Res Function(_$PlaceSuggestionsDataImpl) then) =
      __$$PlaceSuggestionsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlaceSuggestion> suggestions});
}

/// @nodoc
class __$$PlaceSuggestionsDataImplCopyWithImpl<$Res>
    extends _$PlaceSuggestionsDataCopyWithImpl<$Res, _$PlaceSuggestionsDataImpl>
    implements _$$PlaceSuggestionsDataImplCopyWith<$Res> {
  __$$PlaceSuggestionsDataImplCopyWithImpl(_$PlaceSuggestionsDataImpl _value,
      $Res Function(_$PlaceSuggestionsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
  }) {
    return _then(_$PlaceSuggestionsDataImpl(
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<PlaceSuggestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceSuggestionsDataImpl implements _PlaceSuggestionsData {
  const _$PlaceSuggestionsDataImpl(
      {required final List<PlaceSuggestion> suggestions})
      : _suggestions = suggestions;

  factory _$PlaceSuggestionsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceSuggestionsDataImplFromJson(json);

  final List<PlaceSuggestion> _suggestions;
  @override
  List<PlaceSuggestion> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  String toString() {
    return 'PlaceSuggestionsData(suggestions: $suggestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceSuggestionsDataImpl &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_suggestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceSuggestionsDataImplCopyWith<_$PlaceSuggestionsDataImpl>
      get copyWith =>
          __$$PlaceSuggestionsDataImplCopyWithImpl<_$PlaceSuggestionsDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceSuggestionsDataImplToJson(
      this,
    );
  }
}

abstract class _PlaceSuggestionsData implements PlaceSuggestionsData {
  const factory _PlaceSuggestionsData(
          {required final List<PlaceSuggestion> suggestions}) =
      _$PlaceSuggestionsDataImpl;

  factory _PlaceSuggestionsData.fromJson(Map<String, dynamic> json) =
      _$PlaceSuggestionsDataImpl.fromJson;

  @override
  List<PlaceSuggestion> get suggestions;
  @override
  @JsonKey(ignore: true)
  _$$PlaceSuggestionsDataImplCopyWith<_$PlaceSuggestionsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PlaceSuggestion _$PlaceSuggestionFromJson(Map<String, dynamic> json) {
  return _PlaceSuggestion.fromJson(json);
}

/// @nodoc
mixin _$PlaceSuggestion {
  AddressModel? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'hoursOpen')
  Map<String, String>? get hoursOpen => throw _privateConstructorUsedError;
  Map<String, dynamic>? get location => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  String? get pizzaPlace => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceSuggestionCopyWith<PlaceSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceSuggestionCopyWith<$Res> {
  factory $PlaceSuggestionCopyWith(
          PlaceSuggestion value, $Res Function(PlaceSuggestion) then) =
      _$PlaceSuggestionCopyWithImpl<$Res, PlaceSuggestion>;
  @useResult
  $Res call(
      {AddressModel? address,
      @JsonKey(name: 'hoursOpen') Map<String, String>? hoursOpen,
      Map<String, dynamic>? location,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? phone,
      String? website,
      UserModel? user,
      String? pizzaPlace,
      DateTime? createdAt,
      DateTime? updatedAt});

  $AddressModelCopyWith<$Res>? get address;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$PlaceSuggestionCopyWithImpl<$Res, $Val extends PlaceSuggestion>
    implements $PlaceSuggestionCopyWith<$Res> {
  _$PlaceSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? hoursOpen = freezed,
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? website = freezed,
    Object? user = freezed,
    Object? pizzaPlace = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      hoursOpen: freezed == hoursOpen
          ? _value.hoursOpen
          : hoursOpen // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
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
abstract class _$$PlaceSuggestionImplCopyWith<$Res>
    implements $PlaceSuggestionCopyWith<$Res> {
  factory _$$PlaceSuggestionImplCopyWith(_$PlaceSuggestionImpl value,
          $Res Function(_$PlaceSuggestionImpl) then) =
      __$$PlaceSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddressModel? address,
      @JsonKey(name: 'hoursOpen') Map<String, String>? hoursOpen,
      Map<String, dynamic>? location,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? phone,
      String? website,
      UserModel? user,
      String? pizzaPlace,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $AddressModelCopyWith<$Res>? get address;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$PlaceSuggestionImplCopyWithImpl<$Res>
    extends _$PlaceSuggestionCopyWithImpl<$Res, _$PlaceSuggestionImpl>
    implements _$$PlaceSuggestionImplCopyWith<$Res> {
  __$$PlaceSuggestionImplCopyWithImpl(
      _$PlaceSuggestionImpl _value, $Res Function(_$PlaceSuggestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? hoursOpen = freezed,
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? website = freezed,
    Object? user = freezed,
    Object? pizzaPlace = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PlaceSuggestionImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      hoursOpen: freezed == hoursOpen
          ? _value._hoursOpen
          : hoursOpen // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      location: freezed == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceSuggestionImpl implements _PlaceSuggestion {
  const _$PlaceSuggestionImpl(
      {this.address,
      @JsonKey(name: 'hoursOpen') final Map<String, String>? hoursOpen,
      final Map<String, dynamic>? location,
      @JsonKey(name: '_id') this.id,
      this.name,
      this.phone,
      this.website,
      this.user,
      this.pizzaPlace,
      this.createdAt,
      this.updatedAt})
      : _hoursOpen = hoursOpen,
        _location = location;

  factory _$PlaceSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceSuggestionImplFromJson(json);

  @override
  final AddressModel? address;
  final Map<String, String>? _hoursOpen;
  @override
  @JsonKey(name: 'hoursOpen')
  Map<String, String>? get hoursOpen {
    final value = _hoursOpen;
    if (value == null) return null;
    if (_hoursOpen is EqualUnmodifiableMapView) return _hoursOpen;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _location;
  @override
  Map<String, dynamic>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableMapView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? website;
  @override
  final UserModel? user;
  @override
  final String? pizzaPlace;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PlaceSuggestion(address: $address, hoursOpen: $hoursOpen, location: $location, id: $id, name: $name, phone: $phone, website: $website, user: $user, pizzaPlace: $pizzaPlace, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceSuggestionImpl &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._hoursOpen, _hoursOpen) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.website, website) || other.website == website) &&
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
      address,
      const DeepCollectionEquality().hash(_hoursOpen),
      const DeepCollectionEquality().hash(_location),
      id,
      name,
      phone,
      website,
      user,
      pizzaPlace,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceSuggestionImplCopyWith<_$PlaceSuggestionImpl> get copyWith =>
      __$$PlaceSuggestionImplCopyWithImpl<_$PlaceSuggestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceSuggestionImplToJson(
      this,
    );
  }
}

abstract class _PlaceSuggestion implements PlaceSuggestion {
  const factory _PlaceSuggestion(
      {final AddressModel? address,
      @JsonKey(name: 'hoursOpen') final Map<String, String>? hoursOpen,
      final Map<String, dynamic>? location,
      @JsonKey(name: '_id') final String? id,
      final String? name,
      final String? phone,
      final String? website,
      final UserModel? user,
      final String? pizzaPlace,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PlaceSuggestionImpl;

  factory _PlaceSuggestion.fromJson(Map<String, dynamic> json) =
      _$PlaceSuggestionImpl.fromJson;

  @override
  AddressModel? get address;
  @override
  @JsonKey(name: 'hoursOpen')
  Map<String, String>? get hoursOpen;
  @override
  Map<String, dynamic>? get location;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get website;
  @override
  UserModel? get user;
  @override
  String? get pizzaPlace;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PlaceSuggestionImplCopyWith<_$PlaceSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
