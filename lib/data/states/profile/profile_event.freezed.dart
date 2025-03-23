// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user) load,
    required TResult Function() logout,
    required TResult Function() refresh,
    required TResult Function(File? image) addProfileImage,
    required TResult Function(Map<String, dynamic> data) updateProfile,
    required TResult Function() loadSearches,
    required TResult Function(String searchId) deleteSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user)? load,
    TResult? Function()? logout,
    TResult? Function()? refresh,
    TResult? Function(File? image)? addProfileImage,
    TResult? Function(Map<String, dynamic> data)? updateProfile,
    TResult? Function()? loadSearches,
    TResult? Function(String searchId)? deleteSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user)? load,
    TResult Function()? logout,
    TResult Function()? refresh,
    TResult Function(File? image)? addProfileImage,
    TResult Function(Map<String, dynamic> data)? updateProfile,
    TResult Function()? loadSearches,
    TResult Function(String searchId)? deleteSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoad value) load,
    required TResult Function(ProfileLogout value) logout,
    required TResult Function(ProfileRefresh value) refresh,
    required TResult Function(AddProfileImage value) addProfileImage,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(LoadSearches value) loadSearches,
    required TResult Function(DeleteSearch value) deleteSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoad value)? load,
    TResult? Function(ProfileLogout value)? logout,
    TResult? Function(ProfileRefresh value)? refresh,
    TResult? Function(AddProfileImage value)? addProfileImage,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(LoadSearches value)? loadSearches,
    TResult? Function(DeleteSearch value)? deleteSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoad value)? load,
    TResult Function(ProfileLogout value)? logout,
    TResult Function(ProfileRefresh value)? refresh,
    TResult Function(AddProfileImage value)? addProfileImage,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(LoadSearches value)? loadSearches,
    TResult Function(DeleteSearch value)? deleteSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileLoadImplCopyWith<$Res> {
  factory _$$ProfileLoadImplCopyWith(
          _$ProfileLoadImpl value, $Res Function(_$ProfileLoadImpl) then) =
      __$$ProfileLoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ProfileLoadImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileLoadImpl>
    implements _$$ProfileLoadImplCopyWith<$Res> {
  __$$ProfileLoadImplCopyWithImpl(
      _$ProfileLoadImpl _value, $Res Function(_$ProfileLoadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ProfileLoadImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$ProfileLoadImpl implements ProfileLoad {
  const _$ProfileLoadImpl({this.user});

  @override
  final UserModel? user;

  @override
  String toString() {
    return 'ProfileEvent.load(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLoadImplCopyWith<_$ProfileLoadImpl> get copyWith =>
      __$$ProfileLoadImplCopyWithImpl<_$ProfileLoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user) load,
    required TResult Function() logout,
    required TResult Function() refresh,
    required TResult Function(File? image) addProfileImage,
    required TResult Function(Map<String, dynamic> data) updateProfile,
    required TResult Function() loadSearches,
    required TResult Function(String searchId) deleteSearch,
  }) {
    return load(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user)? load,
    TResult? Function()? logout,
    TResult? Function()? refresh,
    TResult? Function(File? image)? addProfileImage,
    TResult? Function(Map<String, dynamic> data)? updateProfile,
    TResult? Function()? loadSearches,
    TResult? Function(String searchId)? deleteSearch,
  }) {
    return load?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user)? load,
    TResult Function()? logout,
    TResult Function()? refresh,
    TResult Function(File? image)? addProfileImage,
    TResult Function(Map<String, dynamic> data)? updateProfile,
    TResult Function()? loadSearches,
    TResult Function(String searchId)? deleteSearch,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoad value) load,
    required TResult Function(ProfileLogout value) logout,
    required TResult Function(ProfileRefresh value) refresh,
    required TResult Function(AddProfileImage value) addProfileImage,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(LoadSearches value) loadSearches,
    required TResult Function(DeleteSearch value) deleteSearch,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoad value)? load,
    TResult? Function(ProfileLogout value)? logout,
    TResult? Function(ProfileRefresh value)? refresh,
    TResult? Function(AddProfileImage value)? addProfileImage,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(LoadSearches value)? loadSearches,
    TResult? Function(DeleteSearch value)? deleteSearch,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoad value)? load,
    TResult Function(ProfileLogout value)? logout,
    TResult Function(ProfileRefresh value)? refresh,
    TResult Function(AddProfileImage value)? addProfileImage,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(LoadSearches value)? loadSearches,
    TResult Function(DeleteSearch value)? deleteSearch,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class ProfileLoad implements ProfileEvent {
  const factory ProfileLoad({final UserModel? user}) = _$ProfileLoadImpl;

  UserModel? get user;
  @JsonKey(ignore: true)
  _$$ProfileLoadImplCopyWith<_$ProfileLoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileLogoutImplCopyWith<$Res> {
  factory _$$ProfileLogoutImplCopyWith(
          _$ProfileLogoutImpl value, $Res Function(_$ProfileLogoutImpl) then) =
      __$$ProfileLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileLogoutImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileLogoutImpl>
    implements _$$ProfileLogoutImplCopyWith<$Res> {
  __$$ProfileLogoutImplCopyWithImpl(
      _$ProfileLogoutImpl _value, $Res Function(_$ProfileLogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileLogoutImpl implements ProfileLogout {
  const _$ProfileLogoutImpl();

  @override
  String toString() {
    return 'ProfileEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user) load,
    required TResult Function() logout,
    required TResult Function() refresh,
    required TResult Function(File? image) addProfileImage,
    required TResult Function(Map<String, dynamic> data) updateProfile,
    required TResult Function() loadSearches,
    required TResult Function(String searchId) deleteSearch,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user)? load,
    TResult? Function()? logout,
    TResult? Function()? refresh,
    TResult? Function(File? image)? addProfileImage,
    TResult? Function(Map<String, dynamic> data)? updateProfile,
    TResult? Function()? loadSearches,
    TResult? Function(String searchId)? deleteSearch,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user)? load,
    TResult Function()? logout,
    TResult Function()? refresh,
    TResult Function(File? image)? addProfileImage,
    TResult Function(Map<String, dynamic> data)? updateProfile,
    TResult Function()? loadSearches,
    TResult Function(String searchId)? deleteSearch,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoad value) load,
    required TResult Function(ProfileLogout value) logout,
    required TResult Function(ProfileRefresh value) refresh,
    required TResult Function(AddProfileImage value) addProfileImage,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(LoadSearches value) loadSearches,
    required TResult Function(DeleteSearch value) deleteSearch,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoad value)? load,
    TResult? Function(ProfileLogout value)? logout,
    TResult? Function(ProfileRefresh value)? refresh,
    TResult? Function(AddProfileImage value)? addProfileImage,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(LoadSearches value)? loadSearches,
    TResult? Function(DeleteSearch value)? deleteSearch,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoad value)? load,
    TResult Function(ProfileLogout value)? logout,
    TResult Function(ProfileRefresh value)? refresh,
    TResult Function(AddProfileImage value)? addProfileImage,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(LoadSearches value)? loadSearches,
    TResult Function(DeleteSearch value)? deleteSearch,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class ProfileLogout implements ProfileEvent {
  const factory ProfileLogout() = _$ProfileLogoutImpl;
}

/// @nodoc
abstract class _$$ProfileRefreshImplCopyWith<$Res> {
  factory _$$ProfileRefreshImplCopyWith(_$ProfileRefreshImpl value,
          $Res Function(_$ProfileRefreshImpl) then) =
      __$$ProfileRefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileRefreshImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileRefreshImpl>
    implements _$$ProfileRefreshImplCopyWith<$Res> {
  __$$ProfileRefreshImplCopyWithImpl(
      _$ProfileRefreshImpl _value, $Res Function(_$ProfileRefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileRefreshImpl implements ProfileRefresh {
  const _$ProfileRefreshImpl();

  @override
  String toString() {
    return 'ProfileEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileRefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user) load,
    required TResult Function() logout,
    required TResult Function() refresh,
    required TResult Function(File? image) addProfileImage,
    required TResult Function(Map<String, dynamic> data) updateProfile,
    required TResult Function() loadSearches,
    required TResult Function(String searchId) deleteSearch,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user)? load,
    TResult? Function()? logout,
    TResult? Function()? refresh,
    TResult? Function(File? image)? addProfileImage,
    TResult? Function(Map<String, dynamic> data)? updateProfile,
    TResult? Function()? loadSearches,
    TResult? Function(String searchId)? deleteSearch,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user)? load,
    TResult Function()? logout,
    TResult Function()? refresh,
    TResult Function(File? image)? addProfileImage,
    TResult Function(Map<String, dynamic> data)? updateProfile,
    TResult Function()? loadSearches,
    TResult Function(String searchId)? deleteSearch,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoad value) load,
    required TResult Function(ProfileLogout value) logout,
    required TResult Function(ProfileRefresh value) refresh,
    required TResult Function(AddProfileImage value) addProfileImage,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(LoadSearches value) loadSearches,
    required TResult Function(DeleteSearch value) deleteSearch,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoad value)? load,
    TResult? Function(ProfileLogout value)? logout,
    TResult? Function(ProfileRefresh value)? refresh,
    TResult? Function(AddProfileImage value)? addProfileImage,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(LoadSearches value)? loadSearches,
    TResult? Function(DeleteSearch value)? deleteSearch,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoad value)? load,
    TResult Function(ProfileLogout value)? logout,
    TResult Function(ProfileRefresh value)? refresh,
    TResult Function(AddProfileImage value)? addProfileImage,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(LoadSearches value)? loadSearches,
    TResult Function(DeleteSearch value)? deleteSearch,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class ProfileRefresh implements ProfileEvent {
  const factory ProfileRefresh() = _$ProfileRefreshImpl;
}

/// @nodoc
abstract class _$$AddProfileImageImplCopyWith<$Res> {
  factory _$$AddProfileImageImplCopyWith(_$AddProfileImageImpl value,
          $Res Function(_$AddProfileImageImpl) then) =
      __$$AddProfileImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File? image});
}

/// @nodoc
class __$$AddProfileImageImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$AddProfileImageImpl>
    implements _$$AddProfileImageImplCopyWith<$Res> {
  __$$AddProfileImageImplCopyWithImpl(
      _$AddProfileImageImpl _value, $Res Function(_$AddProfileImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_$AddProfileImageImpl(
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$AddProfileImageImpl implements AddProfileImage {
  const _$AddProfileImageImpl(this.image);

  @override
  final File? image;

  @override
  String toString() {
    return 'ProfileEvent.addProfileImage(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProfileImageImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProfileImageImplCopyWith<_$AddProfileImageImpl> get copyWith =>
      __$$AddProfileImageImplCopyWithImpl<_$AddProfileImageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user) load,
    required TResult Function() logout,
    required TResult Function() refresh,
    required TResult Function(File? image) addProfileImage,
    required TResult Function(Map<String, dynamic> data) updateProfile,
    required TResult Function() loadSearches,
    required TResult Function(String searchId) deleteSearch,
  }) {
    return addProfileImage(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user)? load,
    TResult? Function()? logout,
    TResult? Function()? refresh,
    TResult? Function(File? image)? addProfileImage,
    TResult? Function(Map<String, dynamic> data)? updateProfile,
    TResult? Function()? loadSearches,
    TResult? Function(String searchId)? deleteSearch,
  }) {
    return addProfileImage?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user)? load,
    TResult Function()? logout,
    TResult Function()? refresh,
    TResult Function(File? image)? addProfileImage,
    TResult Function(Map<String, dynamic> data)? updateProfile,
    TResult Function()? loadSearches,
    TResult Function(String searchId)? deleteSearch,
    required TResult orElse(),
  }) {
    if (addProfileImage != null) {
      return addProfileImage(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoad value) load,
    required TResult Function(ProfileLogout value) logout,
    required TResult Function(ProfileRefresh value) refresh,
    required TResult Function(AddProfileImage value) addProfileImage,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(LoadSearches value) loadSearches,
    required TResult Function(DeleteSearch value) deleteSearch,
  }) {
    return addProfileImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoad value)? load,
    TResult? Function(ProfileLogout value)? logout,
    TResult? Function(ProfileRefresh value)? refresh,
    TResult? Function(AddProfileImage value)? addProfileImage,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(LoadSearches value)? loadSearches,
    TResult? Function(DeleteSearch value)? deleteSearch,
  }) {
    return addProfileImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoad value)? load,
    TResult Function(ProfileLogout value)? logout,
    TResult Function(ProfileRefresh value)? refresh,
    TResult Function(AddProfileImage value)? addProfileImage,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(LoadSearches value)? loadSearches,
    TResult Function(DeleteSearch value)? deleteSearch,
    required TResult orElse(),
  }) {
    if (addProfileImage != null) {
      return addProfileImage(this);
    }
    return orElse();
  }
}

abstract class AddProfileImage implements ProfileEvent {
  const factory AddProfileImage(final File? image) = _$AddProfileImageImpl;

  File? get image;
  @JsonKey(ignore: true)
  _$$AddProfileImageImplCopyWith<_$AddProfileImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileImplCopyWith<$Res> {
  factory _$$UpdateProfileImplCopyWith(
          _$UpdateProfileImpl value, $Res Function(_$UpdateProfileImpl) then) =
      __$$UpdateProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$UpdateProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateProfileImpl>
    implements _$$UpdateProfileImplCopyWith<$Res> {
  __$$UpdateProfileImplCopyWithImpl(
      _$UpdateProfileImpl _value, $Res Function(_$UpdateProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UpdateProfileImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UpdateProfileImpl implements UpdateProfile {
  const _$UpdateProfileImpl(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ProfileEvent.updateProfile(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileImplCopyWith<_$UpdateProfileImpl> get copyWith =>
      __$$UpdateProfileImplCopyWithImpl<_$UpdateProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user) load,
    required TResult Function() logout,
    required TResult Function() refresh,
    required TResult Function(File? image) addProfileImage,
    required TResult Function(Map<String, dynamic> data) updateProfile,
    required TResult Function() loadSearches,
    required TResult Function(String searchId) deleteSearch,
  }) {
    return updateProfile(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user)? load,
    TResult? Function()? logout,
    TResult? Function()? refresh,
    TResult? Function(File? image)? addProfileImage,
    TResult? Function(Map<String, dynamic> data)? updateProfile,
    TResult? Function()? loadSearches,
    TResult? Function(String searchId)? deleteSearch,
  }) {
    return updateProfile?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user)? load,
    TResult Function()? logout,
    TResult Function()? refresh,
    TResult Function(File? image)? addProfileImage,
    TResult Function(Map<String, dynamic> data)? updateProfile,
    TResult Function()? loadSearches,
    TResult Function(String searchId)? deleteSearch,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoad value) load,
    required TResult Function(ProfileLogout value) logout,
    required TResult Function(ProfileRefresh value) refresh,
    required TResult Function(AddProfileImage value) addProfileImage,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(LoadSearches value) loadSearches,
    required TResult Function(DeleteSearch value) deleteSearch,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoad value)? load,
    TResult? Function(ProfileLogout value)? logout,
    TResult? Function(ProfileRefresh value)? refresh,
    TResult? Function(AddProfileImage value)? addProfileImage,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(LoadSearches value)? loadSearches,
    TResult? Function(DeleteSearch value)? deleteSearch,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoad value)? load,
    TResult Function(ProfileLogout value)? logout,
    TResult Function(ProfileRefresh value)? refresh,
    TResult Function(AddProfileImage value)? addProfileImage,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(LoadSearches value)? loadSearches,
    TResult Function(DeleteSearch value)? deleteSearch,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class UpdateProfile implements ProfileEvent {
  const factory UpdateProfile(final Map<String, dynamic> data) =
      _$UpdateProfileImpl;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$UpdateProfileImplCopyWith<_$UpdateProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSearchesImplCopyWith<$Res> {
  factory _$$LoadSearchesImplCopyWith(
          _$LoadSearchesImpl value, $Res Function(_$LoadSearchesImpl) then) =
      __$$LoadSearchesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadSearchesImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$LoadSearchesImpl>
    implements _$$LoadSearchesImplCopyWith<$Res> {
  __$$LoadSearchesImplCopyWithImpl(
      _$LoadSearchesImpl _value, $Res Function(_$LoadSearchesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadSearchesImpl implements LoadSearches {
  const _$LoadSearchesImpl();

  @override
  String toString() {
    return 'ProfileEvent.loadSearches()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadSearchesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user) load,
    required TResult Function() logout,
    required TResult Function() refresh,
    required TResult Function(File? image) addProfileImage,
    required TResult Function(Map<String, dynamic> data) updateProfile,
    required TResult Function() loadSearches,
    required TResult Function(String searchId) deleteSearch,
  }) {
    return loadSearches();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user)? load,
    TResult? Function()? logout,
    TResult? Function()? refresh,
    TResult? Function(File? image)? addProfileImage,
    TResult? Function(Map<String, dynamic> data)? updateProfile,
    TResult? Function()? loadSearches,
    TResult? Function(String searchId)? deleteSearch,
  }) {
    return loadSearches?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user)? load,
    TResult Function()? logout,
    TResult Function()? refresh,
    TResult Function(File? image)? addProfileImage,
    TResult Function(Map<String, dynamic> data)? updateProfile,
    TResult Function()? loadSearches,
    TResult Function(String searchId)? deleteSearch,
    required TResult orElse(),
  }) {
    if (loadSearches != null) {
      return loadSearches();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoad value) load,
    required TResult Function(ProfileLogout value) logout,
    required TResult Function(ProfileRefresh value) refresh,
    required TResult Function(AddProfileImage value) addProfileImage,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(LoadSearches value) loadSearches,
    required TResult Function(DeleteSearch value) deleteSearch,
  }) {
    return loadSearches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoad value)? load,
    TResult? Function(ProfileLogout value)? logout,
    TResult? Function(ProfileRefresh value)? refresh,
    TResult? Function(AddProfileImage value)? addProfileImage,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(LoadSearches value)? loadSearches,
    TResult? Function(DeleteSearch value)? deleteSearch,
  }) {
    return loadSearches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoad value)? load,
    TResult Function(ProfileLogout value)? logout,
    TResult Function(ProfileRefresh value)? refresh,
    TResult Function(AddProfileImage value)? addProfileImage,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(LoadSearches value)? loadSearches,
    TResult Function(DeleteSearch value)? deleteSearch,
    required TResult orElse(),
  }) {
    if (loadSearches != null) {
      return loadSearches(this);
    }
    return orElse();
  }
}

abstract class LoadSearches implements ProfileEvent {
  const factory LoadSearches() = _$LoadSearchesImpl;
}

/// @nodoc
abstract class _$$DeleteSearchImplCopyWith<$Res> {
  factory _$$DeleteSearchImplCopyWith(
          _$DeleteSearchImpl value, $Res Function(_$DeleteSearchImpl) then) =
      __$$DeleteSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchId});
}

/// @nodoc
class __$$DeleteSearchImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$DeleteSearchImpl>
    implements _$$DeleteSearchImplCopyWith<$Res> {
  __$$DeleteSearchImplCopyWithImpl(
      _$DeleteSearchImpl _value, $Res Function(_$DeleteSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchId = null,
  }) {
    return _then(_$DeleteSearchImpl(
      null == searchId
          ? _value.searchId
          : searchId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteSearchImpl implements DeleteSearch {
  const _$DeleteSearchImpl(this.searchId);

  @override
  final String searchId;

  @override
  String toString() {
    return 'ProfileEvent.deleteSearch(searchId: $searchId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSearchImpl &&
            (identical(other.searchId, searchId) ||
                other.searchId == searchId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSearchImplCopyWith<_$DeleteSearchImpl> get copyWith =>
      __$$DeleteSearchImplCopyWithImpl<_$DeleteSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user) load,
    required TResult Function() logout,
    required TResult Function() refresh,
    required TResult Function(File? image) addProfileImage,
    required TResult Function(Map<String, dynamic> data) updateProfile,
    required TResult Function() loadSearches,
    required TResult Function(String searchId) deleteSearch,
  }) {
    return deleteSearch(searchId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user)? load,
    TResult? Function()? logout,
    TResult? Function()? refresh,
    TResult? Function(File? image)? addProfileImage,
    TResult? Function(Map<String, dynamic> data)? updateProfile,
    TResult? Function()? loadSearches,
    TResult? Function(String searchId)? deleteSearch,
  }) {
    return deleteSearch?.call(searchId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user)? load,
    TResult Function()? logout,
    TResult Function()? refresh,
    TResult Function(File? image)? addProfileImage,
    TResult Function(Map<String, dynamic> data)? updateProfile,
    TResult Function()? loadSearches,
    TResult Function(String searchId)? deleteSearch,
    required TResult orElse(),
  }) {
    if (deleteSearch != null) {
      return deleteSearch(searchId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoad value) load,
    required TResult Function(ProfileLogout value) logout,
    required TResult Function(ProfileRefresh value) refresh,
    required TResult Function(AddProfileImage value) addProfileImage,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(LoadSearches value) loadSearches,
    required TResult Function(DeleteSearch value) deleteSearch,
  }) {
    return deleteSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoad value)? load,
    TResult? Function(ProfileLogout value)? logout,
    TResult? Function(ProfileRefresh value)? refresh,
    TResult? Function(AddProfileImage value)? addProfileImage,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(LoadSearches value)? loadSearches,
    TResult? Function(DeleteSearch value)? deleteSearch,
  }) {
    return deleteSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoad value)? load,
    TResult Function(ProfileLogout value)? logout,
    TResult Function(ProfileRefresh value)? refresh,
    TResult Function(AddProfileImage value)? addProfileImage,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(LoadSearches value)? loadSearches,
    TResult Function(DeleteSearch value)? deleteSearch,
    required TResult orElse(),
  }) {
    if (deleteSearch != null) {
      return deleteSearch(this);
    }
    return orElse();
  }
}

abstract class DeleteSearch implements ProfileEvent {
  const factory DeleteSearch(final String searchId) = _$DeleteSearchImpl;

  String get searchId;
  @JsonKey(ignore: true)
  _$$DeleteSearchImplCopyWith<_$DeleteSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
