import 'package:flutter/material.dart';

class AppThemeStyles {
  final List<BoxShadow> shadow;
  final ButtonStyle buttonSmall;
  final ButtonStyle buttonMedium;
  final ButtonStyle buttonLarge;

  const AppThemeStyles({
    this.shadow = const [
      BoxShadow(
        color: Color(0x26000000),
        offset: Offset(0, 3),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ],
    this.buttonSmall = const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size.zero),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    this.buttonMedium = const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size.zero),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    this.buttonLarge = const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size.zero),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ),
  });
}
