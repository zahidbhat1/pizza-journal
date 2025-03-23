import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pizzajournals/gen/assets.gen.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';

enum TabItem {
  MyPlaces,
  home,
  profile,
  ;

  const TabItem();

  int get tabItemIndex {
    return switch (this) {
      TabItem.MyPlaces => 0,
      TabItem.home => 1,
      TabItem.profile => 2,
    };
  }

  bool get isClickable {
    return true;
  }

  PageRouteInfo get pageRouteInfo {
    return switch (this) {
      TabItem.MyPlaces => const MyPlacesRoute(),
      TabItem.home =>  DiscoverRoute(),
      TabItem.profile => const ProfileRoute(),
    };
  }

  Widget _tabItemIconLabel({
    required BuildContext context,
    required ImageProvider imageProvider,
    required String label,
    required bool active,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Image(
              image: imageProvider,
              width: 28,
            ),
            if (active) // Apply the color filter only when active
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    AppColors.main, // Change to red when active
                    BlendMode
                        .srcATop, // Keeps transparency while applying color
                  ),
                  child: Image(
                    image: imageProvider,
                    width: 28,
                  ),
                ),
              ),
          ],
        ),
        Text(
          label,
          style: context.typographies.bodyExtraSmall.withColor(
            active ? AppColors.main : AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _tabItemAction() {
    return Container(
      width: 52,
      height: 36,
      decoration: const BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: const Icon(
        Icons.add,
        color: AppColors.white,
        size: 30,
      ),
    );
  }

  Widget tabItemIcon({
    required BuildContext context,
  }) {
    return switch (this) {
      TabItem.MyPlaces => _tabItemIconLabel(
          context: context,
          imageProvider: Assets.images.review.provider(),
          label: 'My Places',
          active: false,
        ),
      TabItem.home => _tabItemIconLabel(
          context: context,
          imageProvider: Assets.images.discoverUnselected.provider(),
          label: 'Home',
          active: false,
        ),
      TabItem.profile => _tabItemIconLabel(
          context: context,
          imageProvider: Assets.images.profileUnselected.provider(),
          label: "Profile",
          active: false,
        ),
    };
  }

  Widget tabItemActiveIcon({
    required BuildContext context,
  }) {
    return switch (this) {
      TabItem.MyPlaces => _tabItemIconLabel(
          context: context,
          imageProvider: Assets.images.review.provider(),
          label: "My Places",
          active: true,
        ),
      TabItem.home => _tabItemIconLabel(
          context: context,
          imageProvider: Assets.images.discoverSelected.provider(),
          label: "Home",
          active: true,
        ),
      TabItem.profile => _tabItemIconLabel(
          context: context,
          imageProvider: Assets.images.profileSelected.provider(),
          label: "Profile",
          active: true,
        ),
    };
  }

  String get tabItemLabel {
    return switch (this) {
      TabItem.MyPlaces => "Feeds",
      TabItem.home => "Home",
      TabItem.profile => "Profile",
    };
  }
}
