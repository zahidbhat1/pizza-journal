// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) {
  return _DeviceModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceModel {
  int? get userId => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get currentOs => throw _privateConstructorUsedError;
  String? get currentVersion => throw _privateConstructorUsedError;
  List<VersionHistoryModel>? get versionHistory =>
      throw _privateConstructorUsedError;
  UnseenNotificationCountModel? get unseenPnCount =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceModelCopyWith<DeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceModelCopyWith<$Res> {
  factory $DeviceModelCopyWith(
          DeviceModel value, $Res Function(DeviceModel) then) =
      _$DeviceModelCopyWithImpl<$Res, DeviceModel>;
  @useResult
  $Res call(
      {int? userId,
      String? uuid,
      String? model,
      String? type,
      String? currentOs,
      String? currentVersion,
      List<VersionHistoryModel>? versionHistory,
      UnseenNotificationCountModel? unseenPnCount});

  $UnseenNotificationCountModelCopyWith<$Res>? get unseenPnCount;
}

/// @nodoc
class _$DeviceModelCopyWithImpl<$Res, $Val extends DeviceModel>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? uuid = freezed,
    Object? model = freezed,
    Object? type = freezed,
    Object? currentOs = freezed,
    Object? currentVersion = freezed,
    Object? versionHistory = freezed,
    Object? unseenPnCount = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOs: freezed == currentOs
          ? _value.currentOs
          : currentOs // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVersion: freezed == currentVersion
          ? _value.currentVersion
          : currentVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      versionHistory: freezed == versionHistory
          ? _value.versionHistory
          : versionHistory // ignore: cast_nullable_to_non_nullable
              as List<VersionHistoryModel>?,
      unseenPnCount: freezed == unseenPnCount
          ? _value.unseenPnCount
          : unseenPnCount // ignore: cast_nullable_to_non_nullable
              as UnseenNotificationCountModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnseenNotificationCountModelCopyWith<$Res>? get unseenPnCount {
    if (_value.unseenPnCount == null) {
      return null;
    }

    return $UnseenNotificationCountModelCopyWith<$Res>(_value.unseenPnCount!,
        (value) {
      return _then(_value.copyWith(unseenPnCount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceModelImplCopyWith<$Res>
    implements $DeviceModelCopyWith<$Res> {
  factory _$$DeviceModelImplCopyWith(
          _$DeviceModelImpl value, $Res Function(_$DeviceModelImpl) then) =
      __$$DeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? userId,
      String? uuid,
      String? model,
      String? type,
      String? currentOs,
      String? currentVersion,
      List<VersionHistoryModel>? versionHistory,
      UnseenNotificationCountModel? unseenPnCount});

  @override
  $UnseenNotificationCountModelCopyWith<$Res>? get unseenPnCount;
}

/// @nodoc
class __$$DeviceModelImplCopyWithImpl<$Res>
    extends _$DeviceModelCopyWithImpl<$Res, _$DeviceModelImpl>
    implements _$$DeviceModelImplCopyWith<$Res> {
  __$$DeviceModelImplCopyWithImpl(
      _$DeviceModelImpl _value, $Res Function(_$DeviceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? uuid = freezed,
    Object? model = freezed,
    Object? type = freezed,
    Object? currentOs = freezed,
    Object? currentVersion = freezed,
    Object? versionHistory = freezed,
    Object? unseenPnCount = freezed,
  }) {
    return _then(_$DeviceModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOs: freezed == currentOs
          ? _value.currentOs
          : currentOs // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVersion: freezed == currentVersion
          ? _value.currentVersion
          : currentVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      versionHistory: freezed == versionHistory
          ? _value._versionHistory
          : versionHistory // ignore: cast_nullable_to_non_nullable
              as List<VersionHistoryModel>?,
      unseenPnCount: freezed == unseenPnCount
          ? _value.unseenPnCount
          : unseenPnCount // ignore: cast_nullable_to_non_nullable
              as UnseenNotificationCountModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceModelImpl implements _DeviceModel {
  _$DeviceModelImpl(
      {this.userId,
      this.uuid,
      this.model,
      this.type,
      this.currentOs,
      this.currentVersion,
      final List<VersionHistoryModel>? versionHistory,
      this.unseenPnCount})
      : _versionHistory = versionHistory;

  factory _$DeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceModelImplFromJson(json);

  @override
  final int? userId;
  @override
  final String? uuid;
  @override
  final String? model;
  @override
  final String? type;
  @override
  final String? currentOs;
  @override
  final String? currentVersion;
  final List<VersionHistoryModel>? _versionHistory;
  @override
  List<VersionHistoryModel>? get versionHistory {
    final value = _versionHistory;
    if (value == null) return null;
    if (_versionHistory is EqualUnmodifiableListView) return _versionHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UnseenNotificationCountModel? unseenPnCount;

  @override
  String toString() {
    return 'DeviceModel(userId: $userId, uuid: $uuid, model: $model, type: $type, currentOs: $currentOs, currentVersion: $currentVersion, versionHistory: $versionHistory, unseenPnCount: $unseenPnCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currentOs, currentOs) ||
                other.currentOs == currentOs) &&
            (identical(other.currentVersion, currentVersion) ||
                other.currentVersion == currentVersion) &&
            const DeepCollectionEquality()
                .equals(other._versionHistory, _versionHistory) &&
            (identical(other.unseenPnCount, unseenPnCount) ||
                other.unseenPnCount == unseenPnCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      uuid,
      model,
      type,
      currentOs,
      currentVersion,
      const DeepCollectionEquality().hash(_versionHistory),
      unseenPnCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceModelImplCopyWith<_$DeviceModelImpl> get copyWith =>
      __$$DeviceModelImplCopyWithImpl<_$DeviceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceModel implements DeviceModel {
  factory _DeviceModel(
      {final int? userId,
      final String? uuid,
      final String? model,
      final String? type,
      final String? currentOs,
      final String? currentVersion,
      final List<VersionHistoryModel>? versionHistory,
      final UnseenNotificationCountModel? unseenPnCount}) = _$DeviceModelImpl;

  factory _DeviceModel.fromJson(Map<String, dynamic> json) =
      _$DeviceModelImpl.fromJson;

  @override
  int? get userId;
  @override
  String? get uuid;
  @override
  String? get model;
  @override
  String? get type;
  @override
  String? get currentOs;
  @override
  String? get currentVersion;
  @override
  List<VersionHistoryModel>? get versionHistory;
  @override
  UnseenNotificationCountModel? get unseenPnCount;
  @override
  @JsonKey(ignore: true)
  _$$DeviceModelImplCopyWith<_$DeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
