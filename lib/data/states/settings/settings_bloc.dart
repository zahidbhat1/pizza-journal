import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/settings/settings_event.dart';
import 'package:pizzajournals/data/states/settings/settings_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(
    SettingsThemeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(theme: event.theme));
  }
}
