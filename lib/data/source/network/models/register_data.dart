import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_data.freezed.dart';

enum RegisterMethodType {
  email('email'),
  facebook('facebook'),
  apple('apple'),
  google('google');

  final String name;

  const RegisterMethodType(this.name);
}

@freezed
class RegisterData with _$RegisterData {
  const factory RegisterData({
    RegisterMethodType? registerMethodType,
    String? email,
    String? password,
    String? profilePicture,
    String? displayName,
    String? birthday,
    String? otherSource,
    String? sourceCountry,
  }) = _RegisterData;
}
