import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/circular_loading.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final Color? backgroundColor;
  final bool centerTitle;
  final Widget? backButton;
  final bool showBackButton;
  final List<Widget>? actions;
  final bool loading;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleColor,
    this.backgroundColor,
    this.centerTitle = true,
    this.backButton,
    this.showBackButton = true,
    this.actions = const [],
    this.loading = false,
    this.onBackPressed,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typographies = context.typographies;
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    return AppBar(
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              title ?? '',
              style: (canPop ? typographies.headingSmall : typographies.heading)
                  .withColor(titleColor ?? colors.text),
            ),
          ),
          if (loading)
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: CircularLoading(
                size: CircularLoadingSize.medium,
                color: titleColor ?? colors.text,
              ),
            ),
        ],
      ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: showBackButton,
      leading: canPop
          ? (showBackButton
              ? (backButton ??
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: colors.text,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (onBackPressed != null) {
                        onBackPressed!();
                      }
                    },
                  ))
              : null)
          : null,
      actions: actions,
    );
  }

  @override
  final Size preferredSize;
}
