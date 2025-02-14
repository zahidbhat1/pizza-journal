// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestions_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SuggestionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pizzaPlaceId) loadSuggestions,
    required TResult Function(String suggestionId) approveSuggestion,
    required TResult Function(String suggestionId) rejectSuggestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pizzaPlaceId)? loadSuggestions,
    TResult? Function(String suggestionId)? approveSuggestion,
    TResult? Function(String suggestionId)? rejectSuggestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pizzaPlaceId)? loadSuggestions,
    TResult Function(String suggestionId)? approveSuggestion,
    TResult Function(String suggestionId)? rejectSuggestion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSuggestions value) loadSuggestions,
    required TResult Function(ApproveSuggestion value) approveSuggestion,
    required TResult Function(RejectSuggestion value) rejectSuggestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSuggestions value)? loadSuggestions,
    TResult? Function(ApproveSuggestion value)? approveSuggestion,
    TResult? Function(RejectSuggestion value)? rejectSuggestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSuggestions value)? loadSuggestions,
    TResult Function(ApproveSuggestion value)? approveSuggestion,
    TResult Function(RejectSuggestion value)? rejectSuggestion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionsEventCopyWith<$Res> {
  factory $SuggestionsEventCopyWith(
          SuggestionsEvent value, $Res Function(SuggestionsEvent) then) =
      _$SuggestionsEventCopyWithImpl<$Res, SuggestionsEvent>;
}

/// @nodoc
class _$SuggestionsEventCopyWithImpl<$Res, $Val extends SuggestionsEvent>
    implements $SuggestionsEventCopyWith<$Res> {
  _$SuggestionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadSuggestionsImplCopyWith<$Res> {
  factory _$$LoadSuggestionsImplCopyWith(_$LoadSuggestionsImpl value,
          $Res Function(_$LoadSuggestionsImpl) then) =
      __$$LoadSuggestionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pizzaPlaceId});
}

/// @nodoc
class __$$LoadSuggestionsImplCopyWithImpl<$Res>
    extends _$SuggestionsEventCopyWithImpl<$Res, _$LoadSuggestionsImpl>
    implements _$$LoadSuggestionsImplCopyWith<$Res> {
  __$$LoadSuggestionsImplCopyWithImpl(
      _$LoadSuggestionsImpl _value, $Res Function(_$LoadSuggestionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pizzaPlaceId = null,
  }) {
    return _then(_$LoadSuggestionsImpl(
      null == pizzaPlaceId
          ? _value.pizzaPlaceId
          : pizzaPlaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadSuggestionsImpl implements LoadSuggestions {
  const _$LoadSuggestionsImpl(this.pizzaPlaceId);

  @override
  final String pizzaPlaceId;

  @override
  String toString() {
    return 'SuggestionsEvent.loadSuggestions(pizzaPlaceId: $pizzaPlaceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuggestionsImpl &&
            (identical(other.pizzaPlaceId, pizzaPlaceId) ||
                other.pizzaPlaceId == pizzaPlaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pizzaPlaceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuggestionsImplCopyWith<_$LoadSuggestionsImpl> get copyWith =>
      __$$LoadSuggestionsImplCopyWithImpl<_$LoadSuggestionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pizzaPlaceId) loadSuggestions,
    required TResult Function(String suggestionId) approveSuggestion,
    required TResult Function(String suggestionId) rejectSuggestion,
  }) {
    return loadSuggestions(pizzaPlaceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pizzaPlaceId)? loadSuggestions,
    TResult? Function(String suggestionId)? approveSuggestion,
    TResult? Function(String suggestionId)? rejectSuggestion,
  }) {
    return loadSuggestions?.call(pizzaPlaceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pizzaPlaceId)? loadSuggestions,
    TResult Function(String suggestionId)? approveSuggestion,
    TResult Function(String suggestionId)? rejectSuggestion,
    required TResult orElse(),
  }) {
    if (loadSuggestions != null) {
      return loadSuggestions(pizzaPlaceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSuggestions value) loadSuggestions,
    required TResult Function(ApproveSuggestion value) approveSuggestion,
    required TResult Function(RejectSuggestion value) rejectSuggestion,
  }) {
    return loadSuggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSuggestions value)? loadSuggestions,
    TResult? Function(ApproveSuggestion value)? approveSuggestion,
    TResult? Function(RejectSuggestion value)? rejectSuggestion,
  }) {
    return loadSuggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSuggestions value)? loadSuggestions,
    TResult Function(ApproveSuggestion value)? approveSuggestion,
    TResult Function(RejectSuggestion value)? rejectSuggestion,
    required TResult orElse(),
  }) {
    if (loadSuggestions != null) {
      return loadSuggestions(this);
    }
    return orElse();
  }
}

abstract class LoadSuggestions implements SuggestionsEvent {
  const factory LoadSuggestions(final String pizzaPlaceId) =
      _$LoadSuggestionsImpl;

  String get pizzaPlaceId;
  @JsonKey(ignore: true)
  _$$LoadSuggestionsImplCopyWith<_$LoadSuggestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveSuggestionImplCopyWith<$Res> {
  factory _$$ApproveSuggestionImplCopyWith(_$ApproveSuggestionImpl value,
          $Res Function(_$ApproveSuggestionImpl) then) =
      __$$ApproveSuggestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String suggestionId});
}

/// @nodoc
class __$$ApproveSuggestionImplCopyWithImpl<$Res>
    extends _$SuggestionsEventCopyWithImpl<$Res, _$ApproveSuggestionImpl>
    implements _$$ApproveSuggestionImplCopyWith<$Res> {
  __$$ApproveSuggestionImplCopyWithImpl(_$ApproveSuggestionImpl _value,
      $Res Function(_$ApproveSuggestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestionId = null,
  }) {
    return _then(_$ApproveSuggestionImpl(
      null == suggestionId
          ? _value.suggestionId
          : suggestionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApproveSuggestionImpl implements ApproveSuggestion {
  const _$ApproveSuggestionImpl(this.suggestionId);

  @override
  final String suggestionId;

  @override
  String toString() {
    return 'SuggestionsEvent.approveSuggestion(suggestionId: $suggestionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveSuggestionImpl &&
            (identical(other.suggestionId, suggestionId) ||
                other.suggestionId == suggestionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, suggestionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveSuggestionImplCopyWith<_$ApproveSuggestionImpl> get copyWith =>
      __$$ApproveSuggestionImplCopyWithImpl<_$ApproveSuggestionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pizzaPlaceId) loadSuggestions,
    required TResult Function(String suggestionId) approveSuggestion,
    required TResult Function(String suggestionId) rejectSuggestion,
  }) {
    return approveSuggestion(suggestionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pizzaPlaceId)? loadSuggestions,
    TResult? Function(String suggestionId)? approveSuggestion,
    TResult? Function(String suggestionId)? rejectSuggestion,
  }) {
    return approveSuggestion?.call(suggestionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pizzaPlaceId)? loadSuggestions,
    TResult Function(String suggestionId)? approveSuggestion,
    TResult Function(String suggestionId)? rejectSuggestion,
    required TResult orElse(),
  }) {
    if (approveSuggestion != null) {
      return approveSuggestion(suggestionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSuggestions value) loadSuggestions,
    required TResult Function(ApproveSuggestion value) approveSuggestion,
    required TResult Function(RejectSuggestion value) rejectSuggestion,
  }) {
    return approveSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSuggestions value)? loadSuggestions,
    TResult? Function(ApproveSuggestion value)? approveSuggestion,
    TResult? Function(RejectSuggestion value)? rejectSuggestion,
  }) {
    return approveSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSuggestions value)? loadSuggestions,
    TResult Function(ApproveSuggestion value)? approveSuggestion,
    TResult Function(RejectSuggestion value)? rejectSuggestion,
    required TResult orElse(),
  }) {
    if (approveSuggestion != null) {
      return approveSuggestion(this);
    }
    return orElse();
  }
}

abstract class ApproveSuggestion implements SuggestionsEvent {
  const factory ApproveSuggestion(final String suggestionId) =
      _$ApproveSuggestionImpl;

  String get suggestionId;
  @JsonKey(ignore: true)
  _$$ApproveSuggestionImplCopyWith<_$ApproveSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectSuggestionImplCopyWith<$Res> {
  factory _$$RejectSuggestionImplCopyWith(_$RejectSuggestionImpl value,
          $Res Function(_$RejectSuggestionImpl) then) =
      __$$RejectSuggestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String suggestionId});
}

/// @nodoc
class __$$RejectSuggestionImplCopyWithImpl<$Res>
    extends _$SuggestionsEventCopyWithImpl<$Res, _$RejectSuggestionImpl>
    implements _$$RejectSuggestionImplCopyWith<$Res> {
  __$$RejectSuggestionImplCopyWithImpl(_$RejectSuggestionImpl _value,
      $Res Function(_$RejectSuggestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestionId = null,
  }) {
    return _then(_$RejectSuggestionImpl(
      null == suggestionId
          ? _value.suggestionId
          : suggestionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectSuggestionImpl implements RejectSuggestion {
  const _$RejectSuggestionImpl(this.suggestionId);

  @override
  final String suggestionId;

  @override
  String toString() {
    return 'SuggestionsEvent.rejectSuggestion(suggestionId: $suggestionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectSuggestionImpl &&
            (identical(other.suggestionId, suggestionId) ||
                other.suggestionId == suggestionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, suggestionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectSuggestionImplCopyWith<_$RejectSuggestionImpl> get copyWith =>
      __$$RejectSuggestionImplCopyWithImpl<_$RejectSuggestionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pizzaPlaceId) loadSuggestions,
    required TResult Function(String suggestionId) approveSuggestion,
    required TResult Function(String suggestionId) rejectSuggestion,
  }) {
    return rejectSuggestion(suggestionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pizzaPlaceId)? loadSuggestions,
    TResult? Function(String suggestionId)? approveSuggestion,
    TResult? Function(String suggestionId)? rejectSuggestion,
  }) {
    return rejectSuggestion?.call(suggestionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pizzaPlaceId)? loadSuggestions,
    TResult Function(String suggestionId)? approveSuggestion,
    TResult Function(String suggestionId)? rejectSuggestion,
    required TResult orElse(),
  }) {
    if (rejectSuggestion != null) {
      return rejectSuggestion(suggestionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSuggestions value) loadSuggestions,
    required TResult Function(ApproveSuggestion value) approveSuggestion,
    required TResult Function(RejectSuggestion value) rejectSuggestion,
  }) {
    return rejectSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSuggestions value)? loadSuggestions,
    TResult? Function(ApproveSuggestion value)? approveSuggestion,
    TResult? Function(RejectSuggestion value)? rejectSuggestion,
  }) {
    return rejectSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSuggestions value)? loadSuggestions,
    TResult Function(ApproveSuggestion value)? approveSuggestion,
    TResult Function(RejectSuggestion value)? rejectSuggestion,
    required TResult orElse(),
  }) {
    if (rejectSuggestion != null) {
      return rejectSuggestion(this);
    }
    return orElse();
  }
}

abstract class RejectSuggestion implements SuggestionsEvent {
  const factory RejectSuggestion(final String suggestionId) =
      _$RejectSuggestionImpl;

  String get suggestionId;
  @JsonKey(ignore: true)
  _$$RejectSuggestionImplCopyWith<_$RejectSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
