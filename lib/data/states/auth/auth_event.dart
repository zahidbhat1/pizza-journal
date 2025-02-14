import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkRequest() = AuthCheckRequest;
  const factory AuthEvent.userUpdated({
    required UserModel user,
  }) = AuthUserUpdated;
  const factory AuthEvent.loginCompleted({
    required UserModel user,
  }) = AuthLoginCompleted;
  const factory AuthEvent.logout() = AuthLogout;
}
