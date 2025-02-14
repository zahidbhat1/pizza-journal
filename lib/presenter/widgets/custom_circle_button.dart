import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';

class CustomCircleButton extends StatelessWidget {
  final Widget buttonImage;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  const CustomCircleButton({
    super.key,
    required this.buttonImage,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 4,
                ),
            child: buttonImage,
          ),
        ),
      ),
    );
  }
}
