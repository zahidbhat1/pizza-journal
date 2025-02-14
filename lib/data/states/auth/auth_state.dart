import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

part 'auth_state.freezed.dart';

enum AuthStateStatus {
  initial,
  authenticated,
  unauthenticated,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStateStatus.initial) AuthStateStatus status,
    UserModel? user,
    @Default(true) bool isCheckRequestLoading,
    @Default(false) bool isLogoutLoading,
  }) = _AuthState;
}
