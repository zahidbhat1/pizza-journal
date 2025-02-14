import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_history_model.freezed.dart';
part 'version_history_model.g.dart';

@freezed
class VersionHistoryModel with _$VersionHistoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory VersionHistoryModel({
    String? os,
    String? version,
    String? firstLoggedOn,
  }) = _VersionHistoryModel;

  factory VersionHistoryModel.fromJson(Map<String, Object?> json) =>
      _$VersionHistoryModelFromJson(json);

  static VersionHistoryModel fromJsonModel(Object? json) =>
      VersionHistoryModel.fromJson(json as Map<String, dynamic>);
}
