import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/register/register_bloc.dart';
import 'package:pizzajournals/data/states/register/register_event.dart';
import 'package:pizzajournals/data/states/register/register_selector.dart';
import 'package:pizzajournals/di.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_button.dart';
import 'package:pizzajournals/presenter/widgets/custom_text_icon_button.dart';
import 'package:pizzajournals/presenter/widgets/text_form_field_input.dart';

@RoutePage()
class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(
        router: getIt(),
        alertManager: getIt(),
        userRepository: getIt(),
      ),
      child: this,
    );
  }
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc get _registerBloc => context.read<RegisterBloc>();
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pizza Journals",
            style: TextStyle(
                color: AppColors.main,
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final typographies = context.typographies;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Register",
            style: typographies.heading,
          ),
          const SizedBox(height: 24),
          TextFormFieldInput(
            title: "Email",
            hint: "Email",
            controller: _emailController,
            obscureText: false,
            onChanged: (text) => _registerBloc.add(
              RegisterEmailOnChanged(email: text),
            ),
            onSubmitted: (text) => _registerBloc.add(
              RegisterEmailOnChanged(email: text),
            ),
          ),
          const SizedBox(height: 12),
          TextFormFieldInput(
            title: "Name",
            hint: "Name",
            controller: _nameController,
            obscureText: false,
            onChanged: (text) => _registerBloc.add(
              RegisterNameOnChanged(name: text),
            ),
            onSubmitted: (text) => _registerBloc.add(
              RegisterNameOnChanged(name: text),
            ),
          ),
          const SizedBox(height: 12),
          TextFormFieldInput(
            title: "Password",
            hint: "Password",
            controller: _passwordController,
            obscureText: true,
            onChanged: (text) => _registerBloc.add(
              RegisterPasswordOnChanged(password: text),
            ),
            onSubmitted: (text) => _registerBloc.add(
              RegisterPasswordOnChanged(password: text),
            ),
          ),
          const SizedBox(height: 12),
          TextFormFieldInput(
            title: "Confirm Password",
            hint: "Confirm Password",
            controller: _confirmPasswordController,
            obscureText: true,
            onChanged: (text) => _registerBloc.add(
              RegisterConfirmPasswordOnChanged(confirmPassword: text),
            ),
            onSubmitted: (text) => _registerBloc.add(
              RegisterConfirmPasswordOnChanged(confirmPassword: text),
            ),
          ),
          const SizedBox(height: 20),
          RegisterSignupSelector(
            builder: (state) {
              final isSignupLoading = state.$1;
              final isSignupEnable = state.$2;
              return CustomButton(
                buttonTitle: "Signup",
                buttonColor: AppColors.green,
                textStyle: typographies.body,
                enable: isSignupEnable,
                disabledTitleOpacity: 1,
                loading: isSignupLoading,
                onPressed: () => _registerBloc.add(
                  RegisterSignup(
                    email: _registerBloc.state.email ?? '',
                    password: _registerBloc.state.password ?? '',
                    name: _registerBloc.state.name ?? '',
                    confirmPassword: _registerBloc.state.confirmPassword ?? '',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            "OR",
            style: typographies.body,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              "Already Have an Account?",
              style: typographies.bodyExtraSmall.withColor(AppColors.grey),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: CustomTextIconButton(
              buttonTitle: "SignIn",
              buttonTextStyle: typographies.bodySmall.copyWith(
                decoration: TextDecoration.underline,
              ),
              buttonColor: AppColors.darkGreen,
              onPressed: () => _registerBloc.add(const RegisterSignIn()),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _initialize() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    scheduleMicrotask(() async {
      _registerBloc.add(const RegisterLoad());
    });
  }
}
