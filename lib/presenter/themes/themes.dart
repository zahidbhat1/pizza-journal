import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/fonts.gen.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/styles.dart';
import 'package:pizzajournals/presenter/themes/typography.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final String name;
  final String fontFamily;
  final Brightness brightness;
  final AppThemeColors colors;
  final AppThemeTypography typographies;
  final AppThemeStyles styles;

  const AppTheme({
    required this.name,
    required this.brightness,
    required this.colors,
    this.fontFamily = FontFamily.outfit,
    this.typographies = const AppThemeTypography(),
    this.styles = const AppThemeStyles(),
  });

  @override
  AppTheme copyWith({
    String? name,
    Brightness? brightness,
    AppThemeColors? colors,
    AppThemeTypography? typographies,
    AppThemeStyles? styles,
  }) {
    return AppTheme(
      brightness: brightness ?? this.brightness,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      typographies: typographies ?? this.typographies,
      styles: styles ?? this.styles,
    );
  }

  ColorScheme get baseColorScheme =>
      (brightness == Brightness.light) ? const ColorScheme.light() : const ColorScheme.dark();

  ThemeData get themeData => ThemeData(
        useMaterial3: false,
        platform: TargetPlatform.iOS,
        extensions: [this],
        brightness: brightness,
        primarySwatch: colors.primarySwatch,
        primaryColor: colors.primary,
        unselectedWidgetColor: colors.hint,
        disabledColor: colors.disabled,
        scaffoldBackgroundColor: colors.background,
        hintColor: colors.hint,
        dividerColor: colors.border,
        fontFamily: fontFamily,
        colorScheme: baseColorScheme.copyWith(
          primary: colors.primary,
          onPrimary: colors.textOnPrimary,
          secondary: colors.secondary,
          onSecondary: colors.textOnPrimary,
          error: colors.error,
          shadow: colors.border,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: typographies.headingSmall,
          centerTitle: true,
          backgroundColor: colors.background,
          foregroundColor: colors.text,
          surfaceTintColor: colors.text,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: colors.text,
          unselectedLabelColor: colors.text.withOpacity(0.4),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return colors.primary.withOpacity(
                states.contains(MaterialState.disabled) ? 0.4 : 1,
              );
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return AppColors.white.withOpacity(
                states.contains(MaterialState.disabled) ? 0.4 : 1,
              );
            }),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return colors.primary.withOpacity(
                states.contains(MaterialState.disabled) ? 0.4 : 1,
              );
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return AppColors.white.withOpacity(
                states.contains(MaterialState.disabled) ? 0.4 : 1.0,
              );
            }),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: styles.buttonLarge.copyWith(
            side: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? BorderSide(color: colors.disabled)
                  : null;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return colors.primary.withOpacity(
                states.contains(MaterialState.disabled) ? 0.4 : 1,
              );
            }),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              return null;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              return colors.primary.withOpacity(
                states.contains(MaterialState.disabled) ? 0.4 : 1,
              );
            }),
          ),
        ),
      );

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this;

    return AppTheme(
      name: name,
      brightness: brightness,
      colors: colors.lerp(other.colors, t),
      typographies: typographies.lerp(other.typographies, t),
      styles: styles,
    );
  }
}
