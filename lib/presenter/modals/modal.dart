import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';

class Modal extends StatelessWidget {
  final String? title;
  final bool showLeftBackButton;
  final VoidCallback? onLeftBackButtonPressed;
  final bool showLeftExitButton;
  final VoidCallback? onLeftExitButtonPressed;
  final bool showRightExitButton;
  final VoidCallback? onRightExitButtonPressed;
  final Widget? child;

  const Modal({
    super.key,
    this.title,
    this.showLeftBackButton = false,
    this.onLeftBackButtonPressed,
    this.showLeftExitButton = false,
    this.onLeftExitButtonPressed,
    this.showRightExitButton = false,
    this.onRightExitButtonPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (_) {
                if (showLeftBackButton) {
                  return _buildButton(
                    image: Assets.images.back.provider(),
                    onPressed: onLeftBackButtonPressed,
                  );
                } else if (showLeftExitButton) {
                  return _buildButton(
                    image: Assets.images.close.provider(),
                    onPressed: onLeftExitButtonPressed,
                  );
                }
                return const SizedBox(width: 48);
              }),
              if (title?.isNotEmpty ?? false)
                Expanded(
                  child: Text(
                    title ?? '',
                    style: typographies.captionExtraLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              Builder(builder: (_) {
                if (showRightExitButton) {
                  return _buildButton(
                    image: Assets.images.close.provider(),
                    onPressed: onRightExitButtonPressed,
                  );
                }
                return const SizedBox(width: 48);
              }),
            ],
          ),
          if (child != null) Expanded(child: child!),
        ],
      ),
    );
  }

  Widget _buildButton({
    required ImageProvider image,
    VoidCallback? onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashRadius: 24,
        icon: Image(
          image: image,
          fit: BoxFit.contain,
          width: 28,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
