// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  UserModel? get user => throw _privateConstructorUsedError;
  File? get selectedImage => throw _privateConstructorUsedError;
  String? get uploadedImageUrl => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get isLoadingSearches => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<UserSearch> get searches => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {UserModel? user,
      File? selectedImage,
      String? uploadedImageUrl,
      bool isUpdating,
      bool isLoadingSearches,
      String? error,
      List<UserSearch> searches});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? selectedImage = freezed,
    Object? uploadedImageUrl = freezed,
    Object? isUpdating = null,
    Object? isLoadingSearches = null,
    Object? error = freezed,
    Object? searches = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as File?,
      uploadedImageUrl: freezed == uploadedImageUrl
          ? _value.uploadedImageUrl
          : uploadedImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingSearches: null == isLoadingSearches
          ? _value.isLoadingSearches
          : isLoadingSearches // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      searches: null == searches
          ? _value.searches
          : searches // ignore: cast_nullable_to_non_nullable
              as List<UserSearch>,
    ) as $Val);
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
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel? user,
      File? selectedImage,
      String? uploadedImageUrl,
      bool isUpdating,
      bool isLoadingSearches,
      String? error,
      List<UserSearch> searches});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? selectedImage = freezed,
    Object? uploadedImageUrl = freezed,
    Object? isUpdating = null,
    Object? isLoadingSearches = null,
    Object? error = freezed,
    Object? searches = null,
  }) {
    return _then(_$ProfileStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as File?,
      uploadedImageUrl: freezed == uploadedImageUrl
          ? _value.uploadedImageUrl
          : uploadedImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingSearches: null == isLoadingSearches
          ? _value.isLoadingSearches
          : isLoadingSearches // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      searches: null == searches
          ? _value._searches
          : searches // ignore: cast_nullable_to_non_nullable
              as List<UserSearch>,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.user,
      this.selectedImage,
      this.uploadedImageUrl,
      this.isUpdating = false,
      this.isLoadingSearches = false,
      this.error,
      final List<UserSearch> searches = const []})
      : _searches = searches;

  @override
  final UserModel? user;
  @override
  final File? selectedImage;
  @override
  final String? uploadedImageUrl;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool isLoadingSearches;
  @override
  final String? error;
  final List<UserSearch> _searches;
  @override
  @JsonKey()
  List<UserSearch> get searches {
    if (_searches is EqualUnmodifiableListView) return _searches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searches);
  }

  @override
  String toString() {
    return 'ProfileState(user: $user, selectedImage: $selectedImage, uploadedImageUrl: $uploadedImageUrl, isUpdating: $isUpdating, isLoadingSearches: $isLoadingSearches, error: $error, searches: $searches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage) &&
            (identical(other.uploadedImageUrl, uploadedImageUrl) ||
                other.uploadedImageUrl == uploadedImageUrl) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isLoadingSearches, isLoadingSearches) ||
                other.isLoadingSearches == isLoadingSearches) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._searches, _searches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      selectedImage,
      uploadedImageUrl,
      isUpdating,
      isLoadingSearches,
      error,
      const DeepCollectionEquality().hash(_searches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final UserModel? user,
      final File? selectedImage,
      final String? uploadedImageUrl,
      final bool isUpdating,
      final bool isLoadingSearches,
      final String? error,
      final List<UserSearch> searches}) = _$ProfileStateImpl;

  @override
  UserModel? get user;
  @override
  File? get selectedImage;
  @override
  String? get uploadedImageUrl;
  @override
  bool get isUpdating;
  @override
  bool get isLoadingSearches;
  @override
  String? get error;
  @override
  List<UserSearch> get searches;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
