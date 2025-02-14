import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/data/repositories/user_repository.dart';
import 'package:pizzajournals/data/states/auth/auth_event.dart';
import 'package:pizzajournals/data/states/auth/auth_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppRouter _router;
  final UserRepository _userRepository;

  AuthBloc({
    required AppRouter router,
    required UserRepository userRepository,
  })  : _router = router,
        _userRepository = userRepository,
        super(const AuthState()) {
    on<AuthCheckRequest>(_onCheckRequest);
    on<AuthUserUpdated>(_onUserUpdated);
    on<AuthLoginCompleted>(_onLoginCompleted);
    on<AuthLogout>(_onLogout);
  }

  void _onCheckRequest(
    AuthCheckRequest event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: AuthStateStatus.initial,
        isCheckRequestLoading: true,
      ));

      final user = await _userRepository.getLocalUser();

      emit(state.copyWith(
        status: (user != null)
            ? AuthStateStatus.authenticated
            : AuthStateStatus.unauthenticated,
        user: user,
      ));
      _routeAfterAuthentication();
    } catch (_) {
      emit(state.copyWith(
        status: AuthStateStatus.unauthenticated,
        user: null,
      ));
      _routeAfterAuthentication();
    } finally {
      emit(state.copyWith(isCheckRequestLoading: false));

      await _userRepository.saveDeviceInfo();

      await _userRepository.saveDeviceToken();
    }
  }

  void _onUserUpdated(
    AuthUserUpdated event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(user: event.user));
  }

  void _onLoginCompleted(
    AuthLoginCompleted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: AuthStateStatus.authenticated,
      user: event.user,
    ));
    _routeAfterAuthentication();
  }

  void _onLogout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLogoutLoading: true));

      await _userRepository.logout();
    } catch (_) {
    } finally {
      emit(state.copyWith(
        status: AuthStateStatus.unauthenticated,
        user: null,
        isLogoutLoading: false,
      ));
      _routeAfterAuthentication();
    }
  }

  Future<void> _routeAfterAuthentication() async {
    switch (state.status) {
      case AuthStateStatus.authenticated || AuthStateStatus.unauthenticated:
        await _router.replaceAll([const MainRoute()]);
      default:
        break;
    }
  }
}
