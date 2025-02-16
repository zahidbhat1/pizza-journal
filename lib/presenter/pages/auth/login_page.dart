import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/login/login_bloc.dart';
import 'package:pizzajournals/data/states/login/login_event.dart';
import 'package:pizzajournals/data/states/login/login_selector.dart';
import 'package:pizzajournals/di.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_button.dart';
import 'package:pizzajournals/presenter/widgets/custom_text_icon_button.dart';
import 'package:pizzajournals/presenter/widgets/text_form_field_input.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        router: getIt(),
        alertManager: getIt(),
        userRepository: getIt(),
        authBloc: getIt(),
      ),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc get _loginBloc => context.read<LoginBloc>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

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
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pizza Journal',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: AppColors.main),
          )
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
            "Login",
            style: typographies.heading,
          ),
          Text(
            "Message",
            style: typographies.body,
          ),
          const SizedBox(height: 24),
          TextFormFieldInput(
            title: "Email",
            hint: "Email",
            controller: _emailController,
            obscureText: false,
            onChanged: (text) => _loginBloc.add(
              LoginEmailOnChanged(email: text.trim()),
            ),
            onSubmitted: (text) => _loginBloc.add(
              LoginEmailOnChanged(email: text.trim()),
            ),
          ),
          const SizedBox(height: 12),
          TextFormFieldInput(
            title: "Password",
            hint: "Password",
            controller: _passwordController,
            obscureText: true,
            onChanged: (text) => _loginBloc.add(
              LoginPasswordOnChanged(password: text.trim()),
            ),
            onSubmitted: (text) => _loginBloc.add(
              LoginPasswordOnChanged(password: text.trim()),
            ),
          ),
          Row(
            children: [
              CustomTextIconButton(
                buttonTitle: "Forgot Password?",
                buttonTextStyle:
                    typographies.bodySmall.withColor(AppColors.main).copyWith(
                          decoration: TextDecoration.underline,
                        ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                onPressed: () => _loginBloc.add(const LoginForgotPassword()),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LoginLoginSelector(
            builder: (state) {
              final isLoginLoading = state.$1;
              final isLoginEnable = state.$2;
              return CustomButton(
                buttonTitle: "Login",
                buttonColor: AppColors.main,
                textStyle: typographies.body,
                enable: isLoginEnable,
                disabledTitleOpacity: 1,
                loading: isLoginLoading,
                onPressed: () => _loginBloc.add(
                  LoginLogin(
                    email: _loginBloc.state.email ?? '',
                    password: _loginBloc.state.password ?? '',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "Don't have an account?",
              style: typographies.bodyExtraSmall.withColor(AppColors.grey),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: CustomTextIconButton(
              buttonTitle: "SignUp",
              buttonTextStyle: typographies.bodySmall.copyWith(
                decoration: TextDecoration.underline,
              ),
              buttonColor: AppColors.main,
              onPressed: () => _loginBloc.add(const LoginSignUp()),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _initialize() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    scheduleMicrotask(() async {
      _loginBloc.add(const LoginLoad());
    });
  }
}
