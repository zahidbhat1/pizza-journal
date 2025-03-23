import 'package:flutter/material.dart';
import '../../../widgets/cached_image.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';

class ReviewImagesDisplay extends StatelessWidget {
  final List<String> photoUrls;
  final int maxImages;
  final AssetGenImage? placeholderImageAsset;

  const ReviewImagesDisplay({
    Key? key,
    required this.photoUrls,
    this.placeholderImageAsset,
    this.maxImages = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayCount = photoUrls.length > maxImages ? maxImages : photoUrls.length;

    return Row(
      children: List.generate(maxImages, (index) {
        if (index < photoUrls.length) {
          String cleanUrl = photoUrls[index]
              .replaceAll('[', '')
              .replaceAll(']', '')
              .replaceAll('"', '')
              .trim();

          String imageUrl = "https://pizzajournals.com/places/$cleanUrl";

          print('Review Image URL: $imageUrl');

          return GestureDetector(
            onTap: () {
              showFullScreenImageViewer(context, photoUrls, index);
            },
            child: Container(
              margin: EdgeInsets.only(right: index < maxImages - 1 ? 10 : 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedImage(
                  imageUrl: imageUrl,
                  placeholderImageAsset: Assets.images.placeholderRestaurant,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          );
        }

        return Container(
          margin: EdgeInsets.only(right: index < maxImages - 1 ? 10 : 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              width: 60,
              height: 60,
              image: Assets.images.placeholderRestaurant.provider(),
            ),
          ),
        );
      }),
    );
  }
}

void showFullScreenImageViewer(BuildContext context, List<String> images, int initialIndex) {
  Navigator.of(context).push(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              PageView.builder(
                itemCount: images.length,
                controller: PageController(initialPage: initialIndex),
                itemBuilder: (context, index) {
                  String cleanUrl = images[index]
                      .replaceAll('[', '')
                      .replaceAll(']', '')
                      .replaceAll('"', '')
                      .trim();

                  String imageUrl = "https://pizzajournals.com/places/$cleanUrl";

                  return InteractiveViewer(
                    panEnabled: true,
                    minScale: 0.5,
                    maxScale: 4.0,
                    child: Center(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                              color: Colors.white,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text(
                              'Failed to load image',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${initialIndex + 1} / ${images.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}