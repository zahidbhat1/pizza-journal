// import 'package:flutter/cupertino.dart';
// import 'package:pizzajournals/presenter/assets.gen.dart';
//
// import '../../../widgets/cached_image.dart';
//
// class ReviewImagesDisplay extends StatelessWidget {
//   final List<String> photoUrls;
//   final int maxImages;
//   final AssetGenImage? placeholderImageAsset;
//
//   const ReviewImagesDisplay({
//     Key? key,
//     required this.photoUrls,
//     this.placeholderImageAsset,
//     this.maxImages = 3,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
// // Ensure we don't try to show more images than we have
//     final displayCount =
//         photoUrls.length > maxImages ? maxImages : photoUrls.length;
//
//     return Row(
//       children: List.generate(maxImages, (index) {
// // If we have an image for this index, show it
//         if (index < photoUrls.length) {
//           String imageUrl =
//               "https://pizzajournals.com/places/${photoUrls[index]}";
//
//           print('reviewiImage url $imageUrl');
//           return Container(
//             margin: EdgeInsets.only(right: index < maxImages - 1 ? 10 : 0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: CachedImage(
//                 imageUrl:
//                     "https://pizzajournals.com/places/${photoUrls[index]}",
//                 placeholderImageAsset: Assets.images.placeholderRestaurant,
//                 width: 60,
//                 height: 60,
//               ),
//             ),
//           );
//         }
// // Otherwise show placeholder
//         return Container(
//           margin: EdgeInsets.only(right: index < maxImages - 1 ? 10 : 0),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image(
//               width: 60,
//               height: 60,
//               image: Assets.images.placeholderRestaurant.provider(),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
