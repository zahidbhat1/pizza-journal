import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/themes.dart';

class DarkAppTheme extends AppTheme {
  DarkAppTheme()
      : super(
          name: 'dark',
          brightness: Brightness.dark,
          colors: const AppThemeColors(
            primarySwatch: Colors.green,
            primary: AppColors.darkGreen,
            secondary: AppColors.green,
            accent: AppColors.lightGreen,
            background: AppColors.black,
            backgroundDark: Color(0xFF1A1A1A),
            disabled: AppColors.grey2,
            information: AppColors.lightGreen2,
            success: AppColors.darkGreen,
            alert: AppColors.lightOrange,
            warning: AppColors.lightOrange,
            error: AppColors.red,
            text: AppColors.white,
            textOnPrimary: AppColors.white,
            border: Color(0xFFF5F5F5),
            hint: Color(0xFFD3D3D3),
          ),
        );
}
