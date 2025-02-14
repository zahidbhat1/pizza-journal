import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/repositories/user_repository.dart';
import 'package:pizzajournals/data/source/network/extensions/app_error_extension.dart';
import 'package:pizzajournals/data/states/auth/auth_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_event.dart';
import 'package:pizzajournals/data/states/login/login_event.dart';
import 'package:pizzajournals/data/states/login/login_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/utils/alert_manager.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppRouter _router;
  final AlertManager _alertManager;
  final UserRepository _userRepository;
  final AuthBloc _authBloc;

  LoginBloc({
    required AppRouter router,
    required AlertManager alertManager,
    required UserRepository userRepository,
    required AuthBloc authBloc,
  })  : _router = router,
        _alertManager = alertManager,
        _userRepository = userRepository,
        _authBloc = authBloc,
        super(const LoginState()) {
    on<LoginLoad>(_onLoad);
    on<LoginEmailOnChanged>(_onEmailOnChanged);
    on<LoginPasswordOnChanged>(_onPasswordOnChanged);
    on<LoginForgotPassword>(_onForgotPassword);
    on<LoginLogin>(_onLogin);
    on<LoginContinueWithApple>(_onContinueWithApple);
    on<LoginContinueWithFacebook>(_onContinueWithFacebook);
    on<LoginContinueWithGoogle>(_onContinueWithGoogle);
    on<LoginSignUp>(_onSignUp);
  }

  bool get emailIsNotEmpty => state.email?.isNotEmpty ?? false;
  bool get passwordIsNotEmpty => state.password?.isNotEmpty ?? false;
  bool get isLoginEnable => emailIsNotEmpty && passwordIsNotEmpty;

  bool get isContinueWithAppleShow => Platform.isIOS;

  void _onLoad(
    LoginLoad event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isContinueWithAppleShow: isContinueWithAppleShow));
  }

  void _onEmailOnChanged(
    LoginEmailOnChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
    emit(state.copyWith(isLoginEnable: isLoginEnable));
  }

  void _onPasswordOnChanged(
    LoginPasswordOnChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
    emit(state.copyWith(isLoginEnable: isLoginEnable));
  }

  void _onForgotPassword(
    LoginForgotPassword event,
    Emitter<LoginState> emit,
  ) async {
    // TODO
    _alertManager.showFeatureNotAvailable();
  }

  void _onLogin(
    LoginLogin event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoginLoading: true));

      final user = await _userRepository.login(
        email: state.email ?? '',
        password: state.password ?? '',
      );

      _authBloc.add(AuthLoginCompleted(user: user));
    } catch (e) {
      _alertManager.showError(message: e.errorMessage);
    } finally {
      emit(state.copyWith(isLoginLoading: false));
    }
  }

  void _onContinueWithApple(
    LoginContinueWithApple event,
    Emitter<LoginState> emit,
  ) async {
    // TODO
    _alertManager.showFeatureNotAvailable();
  }

  void _onContinueWithFacebook(
    LoginContinueWithFacebook event,
    Emitter<LoginState> emit,
  ) async {
    // TODO
    _alertManager.showFeatureNotAvailable();
  }

  void _onContinueWithGoogle(
    LoginContinueWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    // TODO
    _alertManager.showFeatureNotAvailable();
  }

  void _onSignUp(
    LoginSignUp event,
    Emitter<LoginState> emit,
  ) async {
    await _router.replace(const RegisterRoute());
  }
}
