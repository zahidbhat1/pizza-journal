// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SuggestionsState {
  List<PlaceSuggestion> get suggestions => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestionsStateCopyWith<SuggestionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionsStateCopyWith<$Res> {
  factory $SuggestionsStateCopyWith(
          SuggestionsState value, $Res Function(SuggestionsState) then) =
      _$SuggestionsStateCopyWithImpl<$Res, SuggestionsState>;
  @useResult
  $Res call({List<PlaceSuggestion> suggestions, bool isLoading, String? error});
}

/// @nodoc
class _$SuggestionsStateCopyWithImpl<$Res, $Val extends SuggestionsState>
    implements $SuggestionsStateCopyWith<$Res> {
  _$SuggestionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<PlaceSuggestion>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionsStateImplCopyWith<$Res>
    implements $SuggestionsStateCopyWith<$Res> {
  factory _$$SuggestionsStateImplCopyWith(_$SuggestionsStateImpl value,
          $Res Function(_$SuggestionsStateImpl) then) =
      __$$SuggestionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlaceSuggestion> suggestions, bool isLoading, String? error});
}

/// @nodoc
class __$$SuggestionsStateImplCopyWithImpl<$Res>
    extends _$SuggestionsStateCopyWithImpl<$Res, _$SuggestionsStateImpl>
    implements _$$SuggestionsStateImplCopyWith<$Res> {
  __$$SuggestionsStateImplCopyWithImpl(_$SuggestionsStateImpl _value,
      $Res Function(_$SuggestionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$SuggestionsStateImpl(
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<PlaceSuggestion>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SuggestionsStateImpl implements _SuggestionsState {
  const _$SuggestionsStateImpl(
      {final List<PlaceSuggestion> suggestions = const [],
      this.isLoading = false,
      this.error})
      : _suggestions = suggestions;

  final List<PlaceSuggestion> _suggestions;
  @override
  @JsonKey()
  List<PlaceSuggestion> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'SuggestionsState(suggestions: $suggestions, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_suggestions), isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionsStateImplCopyWith<_$SuggestionsStateImpl> get copyWith =>
      __$$SuggestionsStateImplCopyWithImpl<_$SuggestionsStateImpl>(
          this, _$identity);
}

abstract class _SuggestionsState implements SuggestionsState {
  const factory _SuggestionsState(
      {final List<PlaceSuggestion> suggestions,
      final bool isLoading,
      final String? error}) = _$SuggestionsStateImpl;

  @override
  List<PlaceSuggestion> get suggestions;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionsStateImplCopyWith<_$SuggestionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
