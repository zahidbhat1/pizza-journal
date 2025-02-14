// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unseen_notification_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnseenNotificationCountModel _$UnseenNotificationCountModelFromJson(
    Map<String, dynamic> json) {
  return _UnseenNotificationCountModel.fromJson(json);
}

/// @nodoc
mixin _$UnseenNotificationCountModel {
  int? get activities => throw _privateConstructorUsedError;
  int? get news => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnseenNotificationCountModelCopyWith<UnseenNotificationCountModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnseenNotificationCountModelCopyWith<$Res> {
  factory $UnseenNotificationCountModelCopyWith(
          UnseenNotificationCountModel value,
          $Res Function(UnseenNotificationCountModel) then) =
      _$UnseenNotificationCountModelCopyWithImpl<$Res,
          UnseenNotificationCountModel>;
  @useResult
  $Res call({int? activities, int? news});
}

/// @nodoc
class _$UnseenNotificationCountModelCopyWithImpl<$Res,
        $Val extends UnseenNotificationCountModel>
    implements $UnseenNotificationCountModelCopyWith<$Res> {
  _$UnseenNotificationCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = freezed,
    Object? news = freezed,
  }) {
    return _then(_value.copyWith(
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as int?,
      news: freezed == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnseenNotificationCountModelImplCopyWith<$Res>
    implements $UnseenNotificationCountModelCopyWith<$Res> {
  factory _$$UnseenNotificationCountModelImplCopyWith(
          _$UnseenNotificationCountModelImpl value,
          $Res Function(_$UnseenNotificationCountModelImpl) then) =
      __$$UnseenNotificationCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? activities, int? news});
}

/// @nodoc
class __$$UnseenNotificationCountModelImplCopyWithImpl<$Res>
    extends _$UnseenNotificationCountModelCopyWithImpl<$Res,
        _$UnseenNotificationCountModelImpl>
    implements _$$UnseenNotificationCountModelImplCopyWith<$Res> {
  __$$UnseenNotificationCountModelImplCopyWithImpl(
      _$UnseenNotificationCountModelImpl _value,
      $Res Function(_$UnseenNotificationCountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = freezed,
    Object? news = freezed,
  }) {
    return _then(_$UnseenNotificationCountModelImpl(
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as int?,
      news: freezed == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UnseenNotificationCountModelImpl
    implements _UnseenNotificationCountModel {
  _$UnseenNotificationCountModelImpl({this.activities, this.news});

  factory _$UnseenNotificationCountModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UnseenNotificationCountModelImplFromJson(json);

  @override
  final int? activities;
  @override
  final int? news;

  @override
  String toString() {
    return 'UnseenNotificationCountModel(activities: $activities, news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnseenNotificationCountModelImpl &&
            (identical(other.activities, activities) ||
                other.activities == activities) &&
            (identical(other.news, news) || other.news == news));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, activities, news);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnseenNotificationCountModelImplCopyWith<
          _$UnseenNotificationCountModelImpl>
      get copyWith => __$$UnseenNotificationCountModelImplCopyWithImpl<
          _$UnseenNotificationCountModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnseenNotificationCountModelImplToJson(
      this,
    );
  }
}

abstract class _UnseenNotificationCountModel
    implements UnseenNotificationCountModel {
  factory _UnseenNotificationCountModel(
      {final int? activities,
      final int? news}) = _$UnseenNotificationCountModelImpl;

  factory _UnseenNotificationCountModel.fromJson(Map<String, dynamic> json) =
      _$UnseenNotificationCountModelImpl.fromJson;

  @override
  int? get activities;
  @override
  int? get news;
  @override
  @JsonKey(ignore: true)
  _$$UnseenNotificationCountModelImplCopyWith<
          _$UnseenNotificationCountModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
