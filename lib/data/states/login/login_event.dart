import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.load() = LoginLoad;
  const factory LoginEvent.emailOnChanged({
    required String email,
  }) = LoginEmailOnChanged;
  const factory LoginEvent.passwordOnChanged({
    required String password,
  }) = LoginPasswordOnChanged;
  const factory LoginEvent.login({
    required String email,
    required String password,
  }) = LoginLogin;
  const factory LoginEvent.forgotPassword() = LoginForgotPassword;
  const factory LoginEvent.continueWithApple() = LoginContinueWithApple;
  const factory LoginEvent.continueWithFacebook() = LoginContinueWithFacebook;
  const factory LoginEvent.continueWithGoogle() = LoginContinueWithGoogle;
  const factory LoginEvent.signUp() = LoginSignUp;
}
