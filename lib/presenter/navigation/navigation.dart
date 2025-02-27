import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/pages/auth/login_page.dart';
import 'package:pizzajournals/presenter/pages/auth/register_page.dart';
import 'package:pizzajournals/presenter/pages/discover/discover_page.dart';
import 'package:pizzajournals/presenter/pages/discover/piza_place_page.dart';
import 'package:pizzajournals/presenter/pages/discover/place_detail_arguments.dart';
import 'package:pizzajournals/presenter/pages/error/error_page.dart';
import 'package:pizzajournals/presenter/pages/feed/feed_page.dart';
import 'package:pizzajournals/presenter/pages/main/main_page.dart';
import 'package:pizzajournals/presenter/pages/profile/profile_page.dart';
import 'package:pizzajournals/presenter/pages/splash/splash_page.dart';
import 'package:pizzajournals/presenter/pages/welcome/welcome_page.dart';

import '../../di.dart';
import '../../utils/alert_manager.dart';
import '../pages/discover/my_places.dart';
import '../pages/profile/widgets/update_profile.dart';
import '../pages/suggestions/suggestion_list.dart';

part 'navigation.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page),
        // Splash
        AutoRoute(path: '/', page: SplashRoute.page),
        // Main
        AutoRoute(
          path: '/main',
          page: MainRoute.page,
          children: <AutoRoute>[
            // Feed
            AutoRoute(path: 'my-places', page: MyPlacesRoute.page),
            // Discover
            AutoRoute(
              path: 'discover',
              page: DiscoverRoute.page,
              initial: true,
            ),
            // Ranking
            // Profile
            AutoRoute(path: 'profile', page: ProfileRoute.page),

            // Error
            AutoRoute(path: 'error', page: ErrorRoute.page),
          ],
        ),
        AutoRoute(path: '/pizza_place', page: PizzaPlaceRoute.page),
        //  AutoRoute(path: '/my-places', page: MyPlacesRoute.page),
        AutoRoute(path: '/edit-profile', page: EditProfileRoute.page),
        AutoRoute(path: '/suggestions', page: SuggestionsRoute.page),

        // Auth
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/register', page: RegisterRoute.page),
        // Welcome
        AutoRoute(path: '/welcome', page: WelcomeRoute.page),

        // Error
        AutoRoute(path: '/error', page: ErrorRoute.page),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.material();
}
