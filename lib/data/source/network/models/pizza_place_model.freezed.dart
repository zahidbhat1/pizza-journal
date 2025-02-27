// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pizza_place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PizzaPlaceModel _$PizzaPlaceModelFromJson(Map<String, dynamic> json) {
  return _PizzaPlaceModel.fromJson(json);
}

/// @nodoc
mixin _$PizzaPlaceModel {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'hoursOpen')
  Map<String, String>? get hoursOpen => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get averageRating => throw _privateConstructorUsedError;
  int? get ratings => throw _privateConstructorUsedError;
  AddressModel? get address => throw _privateConstructorUsedError;
  Map<String, PizzaTypeSummary>? get summary =>
      throw _privateConstructorUsedError;
  List<dynamic> get photos => throw _privateConstructorUsedError;
  Links? get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PizzaPlaceModelCopyWith<PizzaPlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PizzaPlaceModelCopyWith<$Res> {
  factory $PizzaPlaceModelCopyWith(
          PizzaPlaceModel value, $Res Function(PizzaPlaceModel) then) =
      _$PizzaPlaceModelCopyWithImpl<$Res, PizzaPlaceModel>;
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'hoursOpen') Map<String, String>? hoursOpen,
      String? phone,
      String? createdAt,
      @JsonKey(name: '_id') String? id,
      int? averageRating,
      int? ratings,
      AddressModel? address,
      Map<String, PizzaTypeSummary>? summary,
      List<dynamic> photos,
      Links? links});

  $AddressModelCopyWith<$Res>? get address;
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class _$PizzaPlaceModelCopyWithImpl<$Res, $Val extends PizzaPlaceModel>
    implements $PizzaPlaceModelCopyWith<$Res> {
  _$PizzaPlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? hoursOpen = freezed,
    Object? phone = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? averageRating = freezed,
    Object? ratings = freezed,
    Object? address = freezed,
    Object? summary = freezed,
    Object? photos = null,
    Object? links = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursOpen: freezed == hoursOpen
          ? _value.hoursOpen
          : hoursOpen // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as int?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Map<String, PizzaTypeSummary>?,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
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
  $LinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $LinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PizzaPlaceModelImplCopyWith<$Res>
    implements $PizzaPlaceModelCopyWith<$Res> {
  factory _$$PizzaPlaceModelImplCopyWith(_$PizzaPlaceModelImpl value,
          $Res Function(_$PizzaPlaceModelImpl) then) =
      __$$PizzaPlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'hoursOpen') Map<String, String>? hoursOpen,
      String? phone,
      String? createdAt,
      @JsonKey(name: '_id') String? id,
      int? averageRating,
      int? ratings,
      AddressModel? address,
      Map<String, PizzaTypeSummary>? summary,
      List<dynamic> photos,
      Links? links});

  @override
  $AddressModelCopyWith<$Res>? get address;
  @override
  $LinksCopyWith<$Res>? get links;
}

/// @nodoc
class __$$PizzaPlaceModelImplCopyWithImpl<$Res>
    extends _$PizzaPlaceModelCopyWithImpl<$Res, _$PizzaPlaceModelImpl>
    implements _$$PizzaPlaceModelImplCopyWith<$Res> {
  __$$PizzaPlaceModelImplCopyWithImpl(
      _$PizzaPlaceModelImpl _value, $Res Function(_$PizzaPlaceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? hoursOpen = freezed,
    Object? phone = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? averageRating = freezed,
    Object? ratings = freezed,
    Object? address = freezed,
    Object? summary = freezed,
    Object? photos = null,
    Object? links = freezed,
  }) {
    return _then(_$PizzaPlaceModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursOpen: freezed == hoursOpen
          ? _value._hoursOpen
          : hoursOpen // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as int?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      summary: freezed == summary
          ? _value._summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Map<String, PizzaTypeSummary>?,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PizzaPlaceModelImpl implements _PizzaPlaceModel {
  _$PizzaPlaceModelImpl(
      {this.name,
      @JsonKey(name: 'hoursOpen') final Map<String, String>? hoursOpen,
      this.phone,
      this.createdAt,
      @JsonKey(name: '_id') this.id,
      this.averageRating,
      this.ratings,
      this.address,
      final Map<String, PizzaTypeSummary>? summary,
      final List<dynamic> photos = const [],
      this.links})
      : _hoursOpen = hoursOpen,
        _summary = summary,
        _photos = photos;

  factory _$PizzaPlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PizzaPlaceModelImplFromJson(json);

  @override
  final String? name;
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

  @override
  final String? phone;
  @override
  final String? createdAt;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? averageRating;
  @override
  final int? ratings;
  @override
  final AddressModel? address;
  final Map<String, PizzaTypeSummary>? _summary;
  @override
  Map<String, PizzaTypeSummary>? get summary {
    final value = _summary;
    if (value == null) return null;
    if (_summary is EqualUnmodifiableMapView) return _summary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<dynamic> _photos;
  @override
  @JsonKey()
  List<dynamic> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final Links? links;

  @override
  String toString() {
    return 'PizzaPlaceModel(name: $name, hoursOpen: $hoursOpen, phone: $phone, createdAt: $createdAt, id: $id, averageRating: $averageRating, ratings: $ratings, address: $address, summary: $summary, photos: $photos, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PizzaPlaceModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._hoursOpen, _hoursOpen) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._summary, _summary) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_hoursOpen),
      phone,
      createdAt,
      id,
      averageRating,
      ratings,
      address,
      const DeepCollectionEquality().hash(_summary),
      const DeepCollectionEquality().hash(_photos),
      links);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PizzaPlaceModelImplCopyWith<_$PizzaPlaceModelImpl> get copyWith =>
      __$$PizzaPlaceModelImplCopyWithImpl<_$PizzaPlaceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PizzaPlaceModelImplToJson(
      this,
    );
  }
}

abstract class _PizzaPlaceModel implements PizzaPlaceModel {
  factory _PizzaPlaceModel(
      {final String? name,
      @JsonKey(name: 'hoursOpen') final Map<String, String>? hoursOpen,
      final String? phone,
      final String? createdAt,
      @JsonKey(name: '_id') final String? id,
      final int? averageRating,
      final int? ratings,
      final AddressModel? address,
      final Map<String, PizzaTypeSummary>? summary,
      final List<dynamic> photos,
      final Links? links}) = _$PizzaPlaceModelImpl;

  factory _PizzaPlaceModel.fromJson(Map<String, dynamic> json) =
      _$PizzaPlaceModelImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'hoursOpen')
  Map<String, String>? get hoursOpen;
  @override
  String? get phone;
  @override
  String? get createdAt;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  int? get averageRating;
  @override
  int? get ratings;
  @override
  AddressModel? get address;
  @override
  Map<String, PizzaTypeSummary>? get summary;
  @override
  List<dynamic> get photos;
  @override
  Links? get links;
  @override
  @JsonKey(ignore: true)
  _$$PizzaPlaceModelImplCopyWith<_$PizzaPlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  String? get social => throw _privateConstructorUsedError;
  String? get maps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call({String? social, String? maps});
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? social = freezed,
    Object? maps = freezed,
  }) {
    return _then(_value.copyWith(
      social: freezed == social
          ? _value.social
          : social // ignore: cast_nullable_to_non_nullable
              as String?,
      maps: freezed == maps
          ? _value.maps
          : maps // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksImplCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$LinksImplCopyWith(
          _$LinksImpl value, $Res Function(_$LinksImpl) then) =
      __$$LinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? social, String? maps});
}

/// @nodoc
class __$$LinksImplCopyWithImpl<$Res>
    extends _$LinksCopyWithImpl<$Res, _$LinksImpl>
    implements _$$LinksImplCopyWith<$Res> {
  __$$LinksImplCopyWithImpl(
      _$LinksImpl _value, $Res Function(_$LinksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? social = freezed,
    Object? maps = freezed,
  }) {
    return _then(_$LinksImpl(
      social: freezed == social
          ? _value.social
          : social // ignore: cast_nullable_to_non_nullable
              as String?,
      maps: freezed == maps
          ? _value.maps
          : maps // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinksImpl implements _Links {
  _$LinksImpl({this.social, this.maps});

  factory _$LinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksImplFromJson(json);

  @override
  final String? social;
  @override
  final String? maps;

  @override
  String toString() {
    return 'Links(social: $social, maps: $maps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinksImpl &&
            (identical(other.social, social) || other.social == social) &&
            (identical(other.maps, maps) || other.maps == maps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, social, maps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      __$$LinksImplCopyWithImpl<_$LinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksImplToJson(
      this,
    );
  }
}

abstract class _Links implements Links {
  factory _Links({final String? social, final String? maps}) = _$LinksImpl;

  factory _Links.fromJson(Map<String, dynamic> json) = _$LinksImpl.fromJson;

  @override
  String? get social;
  @override
  String? get maps;
  @override
  @JsonKey(ignore: true)
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
