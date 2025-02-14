import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/login/login_bloc.dart';
import 'package:pizzajournals/data/states/login/login_state.dart';

class LoginSelector<T> extends BlocSelector<LoginBloc, LoginState, T> {
  LoginSelector({
    super.key,
    required super.selector,
    required Widget Function(T) builder,
  }) : super(
          builder: (_, value) => builder(value),
        );
}

class LoginLoginSelector extends LoginSelector<(bool, bool)> {
  LoginLoginSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => (
            state.isLoginLoading,
            state.isLoginEnable,
          ),
        );
}

class LoginContinueWithAppleSelector extends LoginSelector<(bool, bool)> {
  LoginContinueWithAppleSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => (state.isContinueWithAppleLoading, state.isContinueWithAppleShow),
        );
}

class LoginContinueWithFacebookLoadingSelector extends LoginSelector<bool> {
  LoginContinueWithFacebookLoadingSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => state.isContinueWithFacebookLoading,
        );
}

class LoginContinueWithGoogleLoadingSelector extends LoginSelector<bool> {
  LoginContinueWithGoogleLoadingSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => state.isContinueWithGoogleLoading,
        );
}
