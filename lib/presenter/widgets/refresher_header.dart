import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class RefresherHeader extends StatelessWidget {
  const RefresherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return CustomHeader(
      height: 90,
      builder: (context, mode) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: Assets.images.refresh.provider(),
              width: 28,
            ),
            const SizedBox(height: 10),
            Text(
              "Pull Down To Refresh",
              style: typographies.bodySmall,
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
