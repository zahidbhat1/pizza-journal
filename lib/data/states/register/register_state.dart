import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    String? email,
    String? password,
    String? name,
    String? confirmPassword,
    @Default(false) bool isSignupLoading,
    @Default(false) bool isSignupEnable,
    @Default(false) bool isContinueWithAppleLoading,
    @Default(false) bool isContinueWithAppleShow,
    @Default(false) bool isContinueWithFacebookLoading,
    @Default(false) bool isContinueWithGoogleLoading,
  }) = _RegisterState;
}
