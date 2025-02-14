import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/utils/app_devices.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Color? fillColor;
  final bool obscureText;
  final int minLine;
  final int maxLine;
  final bool readOnly;
  final Widget? leadingIcon;
  // Suffix Icon
  final bool showDropdownIcon;
  // Hint
  final String? hintText;
  final TextStyle? hintTextStyle;
  // Keyboard Type
  final TextInputType? keyboardType;
  // Action
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;
  final VoidCallback? onPressed;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.fillColor,
    this.obscureText = false,
    this.minLine = 1,
    this.maxLine = 1,
    this.readOnly = false,
    this.leadingIcon,
    this.showDropdownIcon = false,
    this.hintText,
    this.hintTextStyle,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      borderSide: (borderColor != null)
          ? BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? colors.border,
            )
          : BorderSide.none,
    );
    return TextFormField(
      controller: controller,
      style: textStyle,
      textAlign: textAlign,
      obscureText: obscureText,
      onTapOutside: (_) => AppDevices.removeFocus(),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onPressed,
      minLines: minLine,
      maxLines: maxLine,
      readOnly: readOnly,
      keyboardType: keyboardType,
      scrollPadding: const EdgeInsets.only(bottom: 150),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle,
        errorBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border,
        disabledBorder: border,
        enabledBorder: border,
        border: border,
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        suffixIcon: (showDropdownIcon) ? Padding(
          padding: const EdgeInsets.all(12.0), // Adjust padding as needed
          child: Image(
            image: Assets.images.dropdownSmall.provider(),
            width: 24, // Set the width
            height: 24, // Set the height
          ),
        ) : null,
        prefixIcon: (leadingIcon != null) ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: leadingIcon,
        ) : null
      ),
    );
  }
}
