import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool circle;
  final AssetGenImage? placeholderImageAsset;
  final VoidCallback? onPressed;

  const CachedImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.circle = false,
    this.placeholderImageAsset,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = width ?? 0;
    final placeholder = Image(
      image: (placeholderImageAsset ?? Assets.images.placeholderUser).provider(),
      fit: BoxFit.cover,
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: circle
            ? const BoxDecoration(
                shape: BoxShape.circle,
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 0),
              ),
        child: ClipRRect(
          borderRadius: circle
              ? BorderRadius.circular((size > 0) ? (size / 2) : 0)
              : ((borderRadius != null) ? BorderRadius.circular(borderRadius!) : BorderRadius.zero),
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            fit: BoxFit.cover,
            placeholder: (_, __) {
              return placeholder;
            },
            errorWidget: (_, __, ___) {
              return placeholder;
            },
          ),
        ),
      ),
    );
  }
}
