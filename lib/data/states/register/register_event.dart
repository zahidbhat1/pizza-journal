import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.load() = RegisterLoad;

  const factory RegisterEvent.emailOnChanged({
    required String email,
  }) = RegisterEmailOnChanged;

  const factory RegisterEvent.passwordOnChanged({
    required String password,
  }) = RegisterPasswordOnChanged;

  const factory RegisterEvent.nameOnChanged({
    required String name,
  }) = RegisterNameOnChanged;

  const factory RegisterEvent.confirmPasswordOnChanged({
    required String confirmPassword,
  }) = RegisterConfirmPasswordOnChanged;

  const factory RegisterEvent.signup({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) = RegisterSignup;

  const factory RegisterEvent.signIn() = RegisterSignIn;
}
