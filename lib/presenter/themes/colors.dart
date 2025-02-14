import 'package:flutter/material.dart';

class AppThemeColors {
  final MaterialColor primarySwatch;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color backgroundDark;
  final Color disabled;
  final Color information;
  final Color success;
  final Color alert;
  final Color warning;
  final Color error;
  final Color text;
  final Color textOnPrimary;
  final Color border;
  final Color hint;

  const AppThemeColors({
    required this.primarySwatch,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.backgroundDark,
    required this.disabled,
    required this.information,
    required this.success,
    required this.alert,
    required this.warning,
    required this.error,
    required this.text,
    required this.textOnPrimary,
    required this.border,
    required this.hint,
  });

  AppThemeColors copyWith({
    MaterialColor? primarySwatch,
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? background,
    Color? backgroundDark,
    Color? disabled,
    Color? information,
    Color? success,
    Color? alert,
    Color? warning,
    Color? error,
    Color? text,
    Color? textOnPrimary,
    Color? border,
    Color? hint,
  }) {
    return AppThemeColors(
      primarySwatch: primarySwatch ?? this.primarySwatch,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      disabled: disabled ?? this.disabled,
      information: information ?? this.information,
      success: success ?? this.success,
      alert: alert ?? this.alert,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      text: text ?? this.text,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      border: border ?? this.border,
      hint: hint ?? this.hint,
    );
  }

  AppThemeColors lerp(covariant dynamic other, double t) {
    if (other is! AppThemeColors) return this;

    return AppThemeColors(
      primarySwatch: primarySwatch,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      information: Color.lerp(information, other.information, t)!,
      success: Color.lerp(success, other.success, t)!,
      alert: Color.lerp(alert, other.alert, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      text: Color.lerp(text, other.text, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      border: Color.lerp(border, other.border, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
    );
  }
}

abstract class AppColors {
  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);
  static const Color lightBlack = Color(0x21000000);

  static const Color darkGreen = Color(0xFF12B576);
  static const Color green = Color(0xFF20E096);
  static const Color lightGreen = Color(0xFF88FF50);
  static const Color lightGreen2 = Color(0x4D20E096);
  static const Color lightGreen3 = Color(0x9920E096);

  static const Color red = Color(0xFFE81717);
  static const Color red2 = Color(0xFFFF2C2C);

  static const Color grey = Color(0xFF8F8F8F);
  static const Color grey2 = Color(0xFFE4E4E4);
  static const Color lightGrey = Color(0xFFF3F3F6);

  static const Color blue = Color(0xFF579AFF);
  static const Color blue2 = Color(0xFF5BA7FF);
  static const Color blue3 = Color(0xFF2972E1);

  static const Color orange = Color(0xFFF7A050);
  static const Color lightOrange = Color(0xFFFFF3E1);
    static const Color main = Color(0xFFFF6347);
}
