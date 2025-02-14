import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_state.freezed.dart';

@freezed
class ActionState with _$ActionState {
  const factory ActionState({
    @Default(false) bool showLoginSignup,
  }) = _AuthState;
}
