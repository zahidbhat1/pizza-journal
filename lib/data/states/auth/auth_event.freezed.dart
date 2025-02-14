// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequest,
    required TResult Function(UserModel user) userUpdated,
    required TResult Function(UserModel user) loginCompleted,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequest,
    TResult? Function(UserModel user)? userUpdated,
    TResult? Function(UserModel user)? loginCompleted,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequest,
    TResult Function(UserModel user)? userUpdated,
    TResult Function(UserModel user)? loginCompleted,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequest value) checkRequest,
    required TResult Function(AuthUserUpdated value) userUpdated,
    required TResult Function(AuthLoginCompleted value) loginCompleted,
    required TResult Function(AuthLogout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequest value)? checkRequest,
    TResult? Function(AuthUserUpdated value)? userUpdated,
    TResult? Function(AuthLoginCompleted value)? loginCompleted,
    TResult? Function(AuthLogout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequest value)? checkRequest,
    TResult Function(AuthUserUpdated value)? userUpdated,
    TResult Function(AuthLoginCompleted value)? loginCompleted,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthCheckRequestImplCopyWith<$Res> {
  factory _$$AuthCheckRequestImplCopyWith(_$AuthCheckRequestImpl value,
          $Res Function(_$AuthCheckRequestImpl) then) =
      __$$AuthCheckRequestImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthCheckRequestImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckRequestImpl>
    implements _$$AuthCheckRequestImplCopyWith<$Res> {
  __$$AuthCheckRequestImplCopyWithImpl(_$AuthCheckRequestImpl _value,
      $Res Function(_$AuthCheckRequestImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthCheckRequestImpl implements AuthCheckRequest {
  const _$AuthCheckRequestImpl();

  @override
  String toString() {
    return 'AuthEvent.checkRequest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthCheckRequestImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequest,
    required TResult Function(UserModel user) userUpdated,
    required TResult Function(UserModel user) loginCompleted,
    required TResult Function() logout,
  }) {
    return checkRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequest,
    TResult? Function(UserModel user)? userUpdated,
    TResult? Function(UserModel user)? loginCompleted,
    TResult? Function()? logout,
  }) {
    return checkRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequest,
    TResult Function(UserModel user)? userUpdated,
    TResult Function(UserModel user)? loginCompleted,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (checkRequest != null) {
      return checkRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequest value) checkRequest,
    required TResult Function(AuthUserUpdated value) userUpdated,
    required TResult Function(AuthLoginCompleted value) loginCompleted,
    required TResult Function(AuthLogout value) logout,
  }) {
    return checkRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequest value)? checkRequest,
    TResult? Function(AuthUserUpdated value)? userUpdated,
    TResult? Function(AuthLoginCompleted value)? loginCompleted,
    TResult? Function(AuthLogout value)? logout,
  }) {
    return checkRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequest value)? checkRequest,
    TResult Function(AuthUserUpdated value)? userUpdated,
    TResult Function(AuthLoginCompleted value)? loginCompleted,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) {
    if (checkRequest != null) {
      return checkRequest(this);
    }
    return orElse();
  }
}

abstract class AuthCheckRequest implements AuthEvent {
  const factory AuthCheckRequest() = _$AuthCheckRequestImpl;
}

/// @nodoc
abstract class _$$AuthUserUpdatedImplCopyWith<$Res> {
  factory _$$AuthUserUpdatedImplCopyWith(_$AuthUserUpdatedImpl value,
          $Res Function(_$AuthUserUpdatedImpl) then) =
      __$$AuthUserUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthUserUpdatedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthUserUpdatedImpl>
    implements _$$AuthUserUpdatedImplCopyWith<$Res> {
  __$$AuthUserUpdatedImplCopyWithImpl(
      _$AuthUserUpdatedImpl _value, $Res Function(_$AuthUserUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthUserUpdatedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthUserUpdatedImpl implements AuthUserUpdated {
  const _$AuthUserUpdatedImpl({required this.user});

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthEvent.userUpdated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserUpdatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserUpdatedImplCopyWith<_$AuthUserUpdatedImpl> get copyWith =>
      __$$AuthUserUpdatedImplCopyWithImpl<_$AuthUserUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequest,
    required TResult Function(UserModel user) userUpdated,
    required TResult Function(UserModel user) loginCompleted,
    required TResult Function() logout,
  }) {
    return userUpdated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequest,
    TResult? Function(UserModel user)? userUpdated,
    TResult? Function(UserModel user)? loginCompleted,
    TResult? Function()? logout,
  }) {
    return userUpdated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequest,
    TResult Function(UserModel user)? userUpdated,
    TResult Function(UserModel user)? loginCompleted,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequest value) checkRequest,
    required TResult Function(AuthUserUpdated value) userUpdated,
    required TResult Function(AuthLoginCompleted value) loginCompleted,
    required TResult Function(AuthLogout value) logout,
  }) {
    return userUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequest value)? checkRequest,
    TResult? Function(AuthUserUpdated value)? userUpdated,
    TResult? Function(AuthLoginCompleted value)? loginCompleted,
    TResult? Function(AuthLogout value)? logout,
  }) {
    return userUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequest value)? checkRequest,
    TResult Function(AuthUserUpdated value)? userUpdated,
    TResult Function(AuthLoginCompleted value)? loginCompleted,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(this);
    }
    return orElse();
  }
}

abstract class AuthUserUpdated implements AuthEvent {
  const factory AuthUserUpdated({required final UserModel user}) =
      _$AuthUserUpdatedImpl;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$AuthUserUpdatedImplCopyWith<_$AuthUserUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLoginCompletedImplCopyWith<$Res> {
  factory _$$AuthLoginCompletedImplCopyWith(_$AuthLoginCompletedImpl value,
          $Res Function(_$AuthLoginCompletedImpl) then) =
      __$$AuthLoginCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthLoginCompletedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLoginCompletedImpl>
    implements _$$AuthLoginCompletedImplCopyWith<$Res> {
  __$$AuthLoginCompletedImplCopyWithImpl(_$AuthLoginCompletedImpl _value,
      $Res Function(_$AuthLoginCompletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthLoginCompletedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthLoginCompletedImpl implements AuthLoginCompleted {
  const _$AuthLoginCompletedImpl({required this.user});

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthEvent.loginCompleted(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginCompletedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginCompletedImplCopyWith<_$AuthLoginCompletedImpl> get copyWith =>
      __$$AuthLoginCompletedImplCopyWithImpl<_$AuthLoginCompletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequest,
    required TResult Function(UserModel user) userUpdated,
    required TResult Function(UserModel user) loginCompleted,
    required TResult Function() logout,
  }) {
    return loginCompleted(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequest,
    TResult? Function(UserModel user)? userUpdated,
    TResult? Function(UserModel user)? loginCompleted,
    TResult? Function()? logout,
  }) {
    return loginCompleted?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequest,
    TResult Function(UserModel user)? userUpdated,
    TResult Function(UserModel user)? loginCompleted,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (loginCompleted != null) {
      return loginCompleted(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequest value) checkRequest,
    required TResult Function(AuthUserUpdated value) userUpdated,
    required TResult Function(AuthLoginCompleted value) loginCompleted,
    required TResult Function(AuthLogout value) logout,
  }) {
    return loginCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequest value)? checkRequest,
    TResult? Function(AuthUserUpdated value)? userUpdated,
    TResult? Function(AuthLoginCompleted value)? loginCompleted,
    TResult? Function(AuthLogout value)? logout,
  }) {
    return loginCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequest value)? checkRequest,
    TResult Function(AuthUserUpdated value)? userUpdated,
    TResult Function(AuthLoginCompleted value)? loginCompleted,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) {
    if (loginCompleted != null) {
      return loginCompleted(this);
    }
    return orElse();
  }
}

abstract class AuthLoginCompleted implements AuthEvent {
  const factory AuthLoginCompleted({required final UserModel user}) =
      _$AuthLoginCompletedImpl;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$AuthLoginCompletedImplCopyWith<_$AuthLoginCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLogoutImplCopyWith<$Res> {
  factory _$$AuthLogoutImplCopyWith(
          _$AuthLogoutImpl value, $Res Function(_$AuthLogoutImpl) then) =
      __$$AuthLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogoutImpl>
    implements _$$AuthLogoutImplCopyWith<$Res> {
  __$$AuthLogoutImplCopyWithImpl(
      _$AuthLogoutImpl _value, $Res Function(_$AuthLogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogoutImpl implements AuthLogout {
  const _$AuthLogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequest,
    required TResult Function(UserModel user) userUpdated,
    required TResult Function(UserModel user) loginCompleted,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequest,
    TResult? Function(UserModel user)? userUpdated,
    TResult? Function(UserModel user)? loginCompleted,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequest,
    TResult Function(UserModel user)? userUpdated,
    TResult Function(UserModel user)? loginCompleted,
    TResult Function()? logout,
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
    required TResult Function(AuthCheckRequest value) checkRequest,
    required TResult Function(AuthUserUpdated value) userUpdated,
    required TResult Function(AuthLoginCompleted value) loginCompleted,
    required TResult Function(AuthLogout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequest value)? checkRequest,
    TResult? Function(AuthUserUpdated value)? userUpdated,
    TResult? Function(AuthLoginCompleted value)? loginCompleted,
    TResult? Function(AuthLogout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequest value)? checkRequest,
    TResult Function(AuthUserUpdated value)? userUpdated,
    TResult Function(AuthLoginCompleted value)? loginCompleted,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AuthLogout implements AuthEvent {
  const factory AuthLogout() = _$AuthLogoutImpl;
}
