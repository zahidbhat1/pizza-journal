import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';

class LocationItem extends StatelessWidget {
  final String? image;
  final String? title;
  final bool? selected;
  final bool? showIndicator;
  final VoidCallback? onPressed;

  const LocationItem({
    super.key,
    this.image,
    this.title,
    this.selected,
    this.showIndicator,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: (selected ?? false) ? AppColors.lightGrey : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            if (image != null)
              Container(
                margin: const EdgeInsets.only(right: 24),
                child: Image.asset(
                  image ?? '',
                  width: 28,
                ),
              ),
            if (title?.isNotEmpty ?? false)
              Expanded(
                child: Text(
                  title ?? '',
                  style: typographies.body,
                ),
              ),
            if (selected != null && showIndicator == true)
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: Image(
                  image: ((selected ?? false) ? Assets.images.checkGreen : Assets.images.arrowRight)
                      .provider(),
                  width: 24,
                ),
              ),

            if (selected != null && showIndicator == true)
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: Image(
                  image: Assets.images.checkGreen.provider(),
                  width: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}