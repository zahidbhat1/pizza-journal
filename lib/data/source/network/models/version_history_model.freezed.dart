// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VersionHistoryModel _$VersionHistoryModelFromJson(Map<String, dynamic> json) {
  return _VersionHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$VersionHistoryModel {
  String? get os => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get firstLoggedOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionHistoryModelCopyWith<VersionHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionHistoryModelCopyWith<$Res> {
  factory $VersionHistoryModelCopyWith(
          VersionHistoryModel value, $Res Function(VersionHistoryModel) then) =
      _$VersionHistoryModelCopyWithImpl<$Res, VersionHistoryModel>;
  @useResult
  $Res call({String? os, String? version, String? firstLoggedOn});
}

/// @nodoc
class _$VersionHistoryModelCopyWithImpl<$Res, $Val extends VersionHistoryModel>
    implements $VersionHistoryModelCopyWith<$Res> {
  _$VersionHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? os = freezed,
    Object? version = freezed,
    Object? firstLoggedOn = freezed,
  }) {
    return _then(_value.copyWith(
      os: freezed == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      firstLoggedOn: freezed == firstLoggedOn
          ? _value.firstLoggedOn
          : firstLoggedOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionHistoryModelImplCopyWith<$Res>
    implements $VersionHistoryModelCopyWith<$Res> {
  factory _$$VersionHistoryModelImplCopyWith(_$VersionHistoryModelImpl value,
          $Res Function(_$VersionHistoryModelImpl) then) =
      __$$VersionHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? os, String? version, String? firstLoggedOn});
}

/// @nodoc
class __$$VersionHistoryModelImplCopyWithImpl<$Res>
    extends _$VersionHistoryModelCopyWithImpl<$Res, _$VersionHistoryModelImpl>
    implements _$$VersionHistoryModelImplCopyWith<$Res> {
  __$$VersionHistoryModelImplCopyWithImpl(_$VersionHistoryModelImpl _value,
      $Res Function(_$VersionHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? os = freezed,
    Object? version = freezed,
    Object? firstLoggedOn = freezed,
  }) {
    return _then(_$VersionHistoryModelImpl(
      os: freezed == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      firstLoggedOn: freezed == firstLoggedOn
          ? _value.firstLoggedOn
          : firstLoggedOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$VersionHistoryModelImpl implements _VersionHistoryModel {
  _$VersionHistoryModelImpl({this.os, this.version, this.firstLoggedOn});

  factory _$VersionHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionHistoryModelImplFromJson(json);

  @override
  final String? os;
  @override
  final String? version;
  @override
  final String? firstLoggedOn;

  @override
  String toString() {
    return 'VersionHistoryModel(os: $os, version: $version, firstLoggedOn: $firstLoggedOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionHistoryModelImpl &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.firstLoggedOn, firstLoggedOn) ||
                other.firstLoggedOn == firstLoggedOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, os, version, firstLoggedOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionHistoryModelImplCopyWith<_$VersionHistoryModelImpl> get copyWith =>
      __$$VersionHistoryModelImplCopyWithImpl<_$VersionHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _VersionHistoryModel implements VersionHistoryModel {
  factory _VersionHistoryModel(
      {final String? os,
      final String? version,
      final String? firstLoggedOn}) = _$VersionHistoryModelImpl;

  factory _VersionHistoryModel.fromJson(Map<String, dynamic> json) =
      _$VersionHistoryModelImpl.fromJson;

  @override
  String? get os;
  @override
  String? get version;
  @override
  String? get firstLoggedOn;
  @override
  @JsonKey(ignore: true)
  _$$VersionHistoryModelImplCopyWith<_$VersionHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
