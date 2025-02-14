// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationLoad value) load,
    required TResult Function(NotificationOpen value) open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationLoad value)? load,
    TResult? Function(NotificationOpen value)? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationLoad value)? load,
    TResult Function(NotificationOpen value)? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotificationLoadImplCopyWith<$Res> {
  factory _$$NotificationLoadImplCopyWith(_$NotificationLoadImpl value,
          $Res Function(_$NotificationLoadImpl) then) =
      __$$NotificationLoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationLoadImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$NotificationLoadImpl>
    implements _$$NotificationLoadImplCopyWith<$Res> {
  __$$NotificationLoadImplCopyWithImpl(_$NotificationLoadImpl _value,
      $Res Function(_$NotificationLoadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationLoadImpl implements NotificationLoad {
  const _$NotificationLoadImpl();

  @override
  String toString() {
    return 'NotificationEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotificationLoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() open,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? open,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? open,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationLoad value) load,
    required TResult Function(NotificationOpen value) open,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationLoad value)? load,
    TResult? Function(NotificationOpen value)? open,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationLoad value)? load,
    TResult Function(NotificationOpen value)? open,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class NotificationLoad implements NotificationEvent {
  const factory NotificationLoad() = _$NotificationLoadImpl;
}

/// @nodoc
abstract class _$$NotificationOpenImplCopyWith<$Res> {
  factory _$$NotificationOpenImplCopyWith(_$NotificationOpenImpl value,
          $Res Function(_$NotificationOpenImpl) then) =
      __$$NotificationOpenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationOpenImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$NotificationOpenImpl>
    implements _$$NotificationOpenImplCopyWith<$Res> {
  __$$NotificationOpenImplCopyWithImpl(_$NotificationOpenImpl _value,
      $Res Function(_$NotificationOpenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationOpenImpl implements NotificationOpen {
  const _$NotificationOpenImpl();

  @override
  String toString() {
    return 'NotificationEvent.open()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotificationOpenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() open,
  }) {
    return open();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? open,
  }) {
    return open?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationLoad value) load,
    required TResult Function(NotificationOpen value) open,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationLoad value)? load,
    TResult? Function(NotificationOpen value)? open,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationLoad value)? load,
    TResult Function(NotificationOpen value)? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class NotificationOpen implements NotificationEvent {
  const factory NotificationOpen() = _$NotificationOpenImpl;
}
