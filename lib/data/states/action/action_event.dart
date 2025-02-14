import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_event.freezed.dart';

@freezed
class ActionEvent with _$ActionEvent {
  const factory ActionEvent.showLoginSignup() = ActionShowLoginSignup;
  const factory ActionEvent.loginSignup() = ActionLoginSignup;
  const factory ActionEvent.closeLoginSignup() = ActionCloseLoginSignup;
  const factory ActionEvent.loginSignupNow() = ActionLoginSignupNow;
}
