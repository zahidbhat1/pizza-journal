import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/widgets/cached_image.dart';

class FeedPhotoItem extends StatelessWidget {
  final String? image;
  final int? index;
  final bool? isLastRow;
  final VoidCallback? onPressed;

  const FeedPhotoItem({
    super.key,
    this.image,
    this.index,
    this.isLastRow,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    EdgeInsets margin;
    if ((index ?? 0) % 3 == 0) {
      margin = EdgeInsets.only(right: 1, bottom: (isLastRow ?? false) ? 0 : 1);
    } else if ((index ?? 0) % 3 == 2) {
      margin = EdgeInsets.only(left: 1, bottom: (isLastRow ?? false) ? 0 : 1);
    } else {
      margin = EdgeInsets.only(bottom: (isLastRow ?? false) ? 0 : 1);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Card(
        margin: margin,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: CachedImage(
          imageUrl: image ?? '',
          placeholderImageAsset: Assets.images.placeholderRestaurant,
        ),
      ),
    );
  }
}