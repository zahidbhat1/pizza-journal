import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/themes.dart';

class LightAppTheme extends AppTheme {
  const LightAppTheme()
      : super(
          name: 'light',
          brightness: Brightness.light,
          colors: const AppThemeColors(
            primarySwatch: Colors.green,
            primary: AppColors.darkGreen,
            secondary: AppColors.green,
            accent: AppColors.lightGreen,
            background: AppColors.white,
            backgroundDark: AppColors.lightGrey,
            disabled: AppColors.grey2,
            information: AppColors.lightGreen2,
            success: AppColors.darkGreen,
            alert: AppColors.lightOrange,
            warning: AppColors.lightOrange,
            error: AppColors.red,
            text: AppColors.black,
            textOnPrimary: AppColors.black,
            border: AppColors.grey2,
            hint: AppColors.grey,
          ),
        );
}
