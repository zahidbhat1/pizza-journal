import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/circular_loading.dart';

class CustomButton extends StatelessWidget {
  // Button
  final String? buttonTitle;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final bool? circle;
  final bool enable;
  final Color? disabledButtonColor;
  final double disabledTitleOpacity;
  // Leading
  final Widget? leadingIcon;
  // Trailing
  final Widget? trailingIcon;
  // Loading
  final bool loading;
  final Color? loadingColor;
  // Action
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.buttonTitle,
    this.buttonColor,
    this.textStyle,
    this.textColor,
    this.splashColor,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.circle,
    this.enable = true,
    this.disabledButtonColor,
    this.disabledTitleOpacity = 0.4,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.loadingColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final elevatedButtonTheme = context.appTheme.themeData.elevatedButtonTheme;
    final typographies = context.typographies;
    final disabled = loading || !enable;
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          final isDisabled = states.contains(MaterialState.disabled);
          if (isDisabled && disabledButtonColor != null) {
            return disabledButtonColor!;
          }
          if (buttonColor != null && (buttonColor == Colors.transparent)) {
            return buttonColor!;
          }
          return (buttonColor ??
                  elevatedButtonTheme.style?.backgroundColor?.resolve(states) ??
                  colors.primary)
              .withOpacity(
            isDisabled ? 0.4 : 1.0,
          );
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            return (textColor ??
                    elevatedButtonTheme.style?.foregroundColor?.resolve(states) ??
                    AppColors.white)
                .withOpacity(
              states.contains(MaterialState.disabled) ? disabledTitleOpacity : 1.0,
            );
          },
        ),
        overlayColor: (splashColor != null)
            ? MaterialStateProperty.resolveWith<Color>(
                (states) {
                  return splashColor!;
                },
              )
            : null,
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (states) {
            return textStyle ?? typographies.body;
          },
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (states) {
            return padding ??
                elevatedButtonTheme.style?.padding?.resolve(states) ??
                const EdgeInsets.all(12);
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) {
            final borderSide = (borderColor != null)
                ? BorderSide(
                    width: borderWidth ?? 1,
                    color: (borderColor ?? Colors.white).withOpacity(
                      states.contains(MaterialState.disabled) ? 0.4 : 1.0,
                    ),
                  )
                : BorderSide.none;
            if (circle ?? false) {
              return (borderSide != BorderSide.none)
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: borderSide,
                    )
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide.none,
                    );
            }
            return (borderRadius != null)
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 0),
                    side: borderSide,
                  )
                : elevatedButtonTheme.style?.shape?.resolve(states)?.copyWith(
                          side: borderSide,
                        ) ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide.none,
                    );
          },
        ),
      ),
      child: (leadingIcon != null || trailingIcon != null)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null)
                  Container(
                    margin: EdgeInsets.only(
                      right: (buttonTitle?.isNotEmpty ?? false) ? 8 : 0,
                    ),
                    child: leadingIcon!,
                  ),
                if (buttonTitle?.isNotEmpty ?? false)
                  Text(
                    buttonTitle ?? '',
                    textAlign: TextAlign.center,
                    style: textStyle ?? typographies.body,
                  ),
                if (trailingIcon != null)
                  Container(
                    margin: EdgeInsets.only(
                      left: (buttonTitle?.isNotEmpty ?? false) ? 8 : 0,
                    ),
                    child: trailingIcon!,
                  ),
                if (loading)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: CircularLoading(
                      size: CircularLoadingSize.small,
                      color: loadingColor ?? Colors.white,
                    ),
                  ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (buttonTitle?.isNotEmpty ?? false)
                  Text(
                    buttonTitle ?? '',
                    textAlign: TextAlign.center,
                    style: textStyle ?? typographies.body,
                  ),
                if (loading)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: CircularLoading(
                      size: CircularLoadingSize.small,
                      color: loadingColor ?? Colors.white,
                    ),
                  ),
              ],
            ),
    );
  }
}
