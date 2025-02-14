import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/register/register_bloc.dart';
import 'package:pizzajournals/data/states/register/register_state.dart';

class RegisterSelector<T> extends BlocSelector<RegisterBloc, RegisterState, T> {
  RegisterSelector({
    super.key,
    required super.selector,
    required Widget Function(T) builder,
  }) : super(
          builder: (_, value) => builder(value),
        );
}

class RegisterSignupSelector extends RegisterSelector<(bool, bool)> {
  RegisterSignupSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => (
            state.isSignupLoading,
            state.isSignupEnable,
          ),
        );
}

class RegisterContinueWithAppleSelector extends RegisterSelector<(bool, bool)> {
  RegisterContinueWithAppleSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => (state.isContinueWithAppleLoading, state.isContinueWithAppleShow),
        );
}

class RegisterContinueWithFacebookLoadingSelector extends RegisterSelector<bool> {
  RegisterContinueWithFacebookLoadingSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => state.isContinueWithFacebookLoading,
        );
}

class RegisterContinueWithGoogleLoadingSelector extends RegisterSelector<bool> {
  RegisterContinueWithGoogleLoadingSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => state.isContinueWithGoogleLoading,
        );
}
