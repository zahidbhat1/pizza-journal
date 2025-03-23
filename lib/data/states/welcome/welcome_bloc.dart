import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/welcome/welcome_event.dart';
import 'package:pizzajournals/data/states/welcome/welcome_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AppRouter _router;

  WelcomeBloc({
    required AppRouter router,
  })  : _router = router,
        super(const WelcomeState()) {
    on<WelcomeLoad>(_onLoad);
    on<WelcomeLoginSignup>(_onLoginSignup);
    on<WelcomeSkip>(_onSkip);
  }

  void _onLoad(
    WelcomeLoad event,
    Emitter<WelcomeState> emit,
  ) async {}

  void _onLoginSignup(
    WelcomeLoginSignup event,
    Emitter<WelcomeState> emit,
  ) async {
    await _router.replace(const LoginRoute());
  }

  void _onSkip(
    WelcomeSkip event,
    Emitter<WelcomeState> emit,
  ) async {
    await _router.replaceAll([ DiscoverRoute()]);
  }
}
