import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory LoginModel({
    String? token,
    UserModel? user,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) => _$LoginModelFromJson(json);

  static LoginModel fromJsonModel(Object? json) => LoginModel.fromJson(json as Map<String, dynamic>);
}
