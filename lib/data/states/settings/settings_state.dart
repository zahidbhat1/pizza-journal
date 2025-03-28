import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/presenter/themes/themes.dart';
import 'package:pizzajournals/presenter/themes/themes/themes.light.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(LightAppTheme()) AppTheme theme,
  }) = _SettingsState;
}
