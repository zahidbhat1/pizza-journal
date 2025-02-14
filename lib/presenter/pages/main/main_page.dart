import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/utils/tab_item.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var routes= TabItem.values.map((tabItem) => tabItem.pageRouteInfo).toList();
    return AutoTabsScaffold(
      routes:routes,
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          onTap: (index) => _onTapBottomNavigationBar(
            tabsRouter: tabsRouter,
            index: index,
          ),
          currentIndex: tabsRouter.activeIndex >= 3 ? 1 : tabsRouter.activeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.darkGreen,
          unselectedItemColor: AppColors.black,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: TabItem.values
              .map(
                (tabItem) => BottomNavigationBarItem(
                  icon: tabItem.tabItemIcon(context: context),
                  activeIcon: tabItem.tabItemActiveIcon(context: context),
                  label: tabItem.tabItemLabel,
                ),
              )
              .toList(),
        );
      },
    );
  }

  void _onTapBottomNavigationBar({
    required TabsRouter tabsRouter,
    required int index,
  }) {
    final tabItem = TabItem.values.firstWhereOrNull(
      (tabItem) => tabItem.tabItemIndex == index,
    );
    if (tabItem?.isClickable ?? false) {
      tabsRouter.setActiveIndex(index);
    }
  }
}
