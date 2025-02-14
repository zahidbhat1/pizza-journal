import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_event.freezed.dart';

@freezed
class WelcomeEvent with _$WelcomeEvent {
  const factory WelcomeEvent.load() = WelcomeLoad;
  const factory WelcomeEvent.loginSignup() = WelcomeLoginSignup;
  const factory WelcomeEvent.skip() = WelcomeSkip;
}
