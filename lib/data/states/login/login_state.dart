import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    String? email,
    String? password,
    @Default(false) bool isLoginLoading,
    @Default(false) bool isLoginEnable,
    @Default(false) bool isContinueWithAppleLoading,
    @Default(false) bool isContinueWithAppleShow,
    @Default(false) bool isContinueWithFacebookLoading,
    @Default(false) bool isContinueWithGoogleLoading,
  }) = _LoginState;
}
