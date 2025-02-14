import 'package:freezed_annotation/freezed_annotation.dart';

part 'unseen_notification_count_model.freezed.dart';
part 'unseen_notification_count_model.g.dart';

@freezed
class UnseenNotificationCountModel with _$UnseenNotificationCountModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory UnseenNotificationCountModel({
    int? activities,
    int? news,
  }) = _UnseenNotificationCountModel;

  factory UnseenNotificationCountModel.fromJson(Map<String, Object?> json) =>
      _$UnseenNotificationCountModelFromJson(json);

  static UnseenNotificationCountModel fromJsonModel(Object? json) =>
      UnseenNotificationCountModel.fromJson(json as Map<String, dynamic>);
}
