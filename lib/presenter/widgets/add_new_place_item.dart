import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';

class AddNewPlaceItem extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final VoidCallback? onPressed;

  const AddNewPlaceItem({
    super.key,
    required this.image,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 12,
            ),
            child: Row(
              children: [
                Image(
                  image: image,
                  width: 28,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: typographies.body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
