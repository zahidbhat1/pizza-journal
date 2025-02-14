import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/action/action_event.dart';
import 'package:pizzajournals/data/states/action/action_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:injectable/injectable.dart';

@singleton
class ActionBloc extends Bloc<ActionEvent, ActionState> {
  final AppRouter _router;

  ActionBloc({
    required AppRouter router,
  })  : _router = router,
        super(const ActionState()) {
    on<ActionShowLoginSignup>(_onShowLoginSignup);
    on<ActionLoginSignup>(_onLoginSignup);
    on<ActionCloseLoginSignup>(_onCloseLoginSignup);
    on<ActionLoginSignupNow>(_onLoginSignupNow);
  }

  void _onShowLoginSignup(
    ActionShowLoginSignup event,
    Emitter<ActionState> emit,
  ) async {
    emit(state.copyWith(showLoginSignup: true));
  }

  void _onLoginSignup(
    ActionLoginSignup event,
    Emitter<ActionState> emit,
  ) async {
    await _router.pop();
    await _router.push(const WelcomeRoute());
  }

  void _onCloseLoginSignup(
    ActionCloseLoginSignup event,
    Emitter<ActionState> emit,
  ) async {
    emit(state.copyWith(showLoginSignup: false));
  }

  void _onLoginSignupNow(
    ActionLoginSignupNow event,
    Emitter<ActionState> emit,
  ) async {
    await _router.push(const LoginRoute());
  }
}
