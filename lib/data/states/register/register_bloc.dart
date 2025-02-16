import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/repositories/user_repository.dart';
import 'package:pizzajournals/data/source/network/extensions/app_error_extension.dart';
import 'package:pizzajournals/data/states/register/register_event.dart';
import 'package:pizzajournals/data/states/register/register_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/utils/alert_manager.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AppRouter _router;
  final AlertManager _alertManager;
  final UserRepository _userRepository;

  RegisterBloc({
    required AppRouter router,
    required AlertManager alertManager,
    required UserRepository userRepository,
  })  : _router = router,
        _alertManager = alertManager,
        _userRepository = userRepository,
        super(const RegisterState()) {
    on<RegisterLoad>(_onLoad);
    on<RegisterEmailOnChanged>(_onEmailOnChanged);
    on<RegisterPasswordOnChanged>(_onPasswordOnChanged);
    on<RegisterNameOnChanged>(_onNameOnChanged);
    on<RegisterConfirmPasswordOnChanged>(_onConfirmPasswordOnChanged);
    on<RegisterSignup>(_onSignup);
    on<RegisterSignIn>(_onSignIn);
  }

  bool get emailIsNotEmpty => state.email?.isNotEmpty ?? false;

  bool get passwordIsNotEmpty => state.password?.isNotEmpty ?? false;

  bool get confirmPasswordIsNotEmpty =>
      state.confirmPassword?.isNotEmpty ?? false;

  bool get isSignupEnable =>
      emailIsNotEmpty && passwordIsNotEmpty && confirmPasswordIsNotEmpty;

  bool get isContinueWithAppleShow => Platform.isIOS;

  void _onLoad(
    RegisterLoad event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isContinueWithAppleShow: isContinueWithAppleShow));
  }

  void _onEmailOnChanged(
    RegisterEmailOnChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
    emit(state.copyWith(isSignupEnable: isSignupEnable));
  }

  void _onPasswordOnChanged(
    RegisterPasswordOnChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
    emit(state.copyWith(isSignupEnable: isSignupEnable));
  }

  void _onNameOnChanged(
    RegisterNameOnChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(name: event.name));
    emit(state.copyWith(isSignupEnable: isSignupEnable));
  }

  void _onConfirmPasswordOnChanged(
    RegisterConfirmPasswordOnChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
    emit(state.copyWith(isSignupEnable: isSignupEnable));
  }

  void _onSignup(
    RegisterSignup event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(state.copyWith(isSignupLoading: true));

      // Call the validateUser method
      await _userRepository.validateUser(
        email: event.email,
        name: event.name,
        password: event.password,
        confirmPassword: event.confirmPassword,
      );

      // If no exception is thrown, registration is successful
      // Navigate to the login screen or home screen
      await _router.replace(const LoginRoute());
    } catch (e) {
      // Handle exceptions (e.g., validation errors, network errors)
      _alertManager.showError(message: e.errorMessage);
    } finally {
      emit(state.copyWith(isSignupLoading: false));
    }
  }

  void _onSignIn(
    RegisterSignIn event,
    Emitter<RegisterState> emit,
  ) async {
    await _router.replace(const LoginRoute());
  }
}
