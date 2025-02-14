import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_event.dart';
import 'package:pizzajournals/gen/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthBloc get _authBloc => context.read<AuthBloc>();

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.main,
        child: Center(
          child: Image(
            image: Assets.images.icLogo.provider(),
          ),
        ),
      ),
    );
  }

  void _initialize() {
    scheduleMicrotask(() async {
      await Future.delayed(const Duration(milliseconds: 10));
      if (context.mounted) {
        _authBloc.add(const AuthCheckRequest());
      }
    });
  }
}
