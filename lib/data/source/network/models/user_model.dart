import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  factory UserModel({
    @JsonKey(name: '_id') String? id,
    String? userName,
    String? name,
    String? screenName,
    String? email,
    String? picture,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  static UserModel fromJsonModel(Object? json) =>
      UserModel.fromJson(json as Map<String, dynamic>);
}
