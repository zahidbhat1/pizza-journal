import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/styles.dart';
import 'package:pizzajournals/presenter/themes/themes.dart';
import 'package:pizzajournals/presenter/themes/themes/themes.light.dart';
import 'package:pizzajournals/presenter/themes/typography.dart';

extension AppThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>() ?? const LightAppTheme();

  AppThemeTypography get typographies => appTheme.typographies;

  AppThemeColors get colors => appTheme.colors;

  AppThemeStyles get styles => appTheme.styles;

  Size get deviceSize => MediaQuery.of(this).size;

  double get statusBarHeight => MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single,
      ).padding.top;

  double get appBarHeight => AppBar().preferredSize.height;

  double get contentHeight {
    return deviceSize.height -
        statusBarHeight -
        appBarHeight -
        MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single)
            .padding
            .bottom -
        kBottomNavigationBarHeight;
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color? color) => copyWith(color: color);

  TextStyle withSize(double? size) => copyWith(fontSize: size);

  // Use [merge] instead of [copyWith] as a workaround for this issue:
  // https://github.com/material-foundation/flutter-packages/issues/141
  TextStyle withWeight(FontWeight? weight) => merge(TextStyle(fontWeight: weight));
}
