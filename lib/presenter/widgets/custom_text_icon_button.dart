import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/circular_loading.dart';

class CustomTextIconButton extends StatelessWidget {
  // Button
  final String? buttonTitle;
  final Color? buttonColor;
  final TextStyle? buttonTextStyle;
  final Widget? buttonIcon;
  final EdgeInsetsGeometry? padding;
  final bool enable;
  // Loading
  final bool loading;
  final Color? loadingColor;
  // Action
  final VoidCallback? onPressed;

  const CustomTextIconButton({
    super.key,
    this.buttonTitle,
    this.buttonColor,
    this.buttonTextStyle,
    this.buttonIcon,
    this.padding,
    this.enable = true,
    this.loading = false,
    this.loadingColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typographies = context.typographies;
    final disabled = loading || !enable;
    return TextButton(
      onPressed: disabled ? null : onPressed,
      style: TextButton.styleFrom(
        padding: padding,
        shape: const RoundedRectangleBorder(),
        foregroundColor: buttonColor,
        disabledForegroundColor: buttonColor?.withOpacity(0.4),
      ),
      child: Opacity(
        opacity: disabled ? 0.4 : 1,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (buttonIcon != null) ...[
              buttonIcon!,
              const SizedBox(width: 4),
            ],
            if (buttonTitle?.isNotEmpty ?? false)
              Text(
                buttonTitle ?? '',
                style: buttonTextStyle ?? typographies.captionExtraLarge,
              ),
            if (loading)
              Container(
                margin: const EdgeInsets.only(left: 6),
                child: CircularLoading(
                  size: CircularLoadingSize.small,
                  color: loadingColor ?? colors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
