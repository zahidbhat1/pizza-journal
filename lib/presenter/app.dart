import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/action/action_bloc.dart';
import 'package:pizzajournals/data/states/action/action_event.dart';
import 'package:pizzajournals/data/states/action/action_state.dart';
import 'package:pizzajournals/di.dart';
import 'package:pizzajournals/presenter/modals/login_signup_modal.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';

class PizzaJournalsApp extends StatelessWidget {
  AppRouter get _router => getIt<AppRouter>();

  const PizzaJournalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Halal Navi',
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
      builder: (context, child) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ActionBloc, ActionState>(
              listenWhen: (previous, current) =>
                  previous.showLoginSignup != current.showLoginSignup,
              listener: (context, state) {
                if (state.showLoginSignup) {
                  _showLoginSignup();
                }
              },
            ),
          ],
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }

  void _showLoginSignup() async {
    final context = _router.navigatorKey.currentContext;
    if (context != null) {
      final actionBloc = context.read<ActionBloc>();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoginSignupModal(
            onLoginSignupPressed: () => actionBloc.add(
              const ActionLoginSignup(),
            ),
          );
        },
      );
      actionBloc.add(const ActionCloseLoginSignup());
    }
  }
}
