import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';

enum CircularLoadingSize {
  small(14, 2),
  medium(18, 3),
  large(22, 4),
  extraLarge(30, 5);

  final double size;
  final double strokeWidth;

  const CircularLoadingSize(
    this.size,
    this.strokeWidth,
  );
}

class CircularLoading extends StatelessWidget {
  final CircularLoadingSize size;
  final Color? color;

  const CircularLoading({
    super.key,
    this.size = CircularLoadingSize.medium,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      width: size.size,
      height: size.size,
      child: CircularProgressIndicator(
        backgroundColor: (color ?? colors.primary).withOpacity(0.4),
        color: color ?? colors.primary,
        strokeWidth: size.strokeWidth,
      ),
    );
  }
}
