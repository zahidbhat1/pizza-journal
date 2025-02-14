import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/unseen_notification_count_model.dart';
import 'package:pizzajournals/data/source/network/models/version_history_model.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
class DeviceModel with _$DeviceModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory DeviceModel({
    int? userId,
    String? uuid,
    String? model,
    String? type,
    String? currentOs,
    String? currentVersion,
    List<VersionHistoryModel>? versionHistory,
    UnseenNotificationCountModel? unseenPnCount,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, Object?> json) => _$DeviceModelFromJson(json);

  static DeviceModel fromJsonModel(Object? json) =>
      DeviceModel.fromJson(json as Map<String, dynamic>);
}
