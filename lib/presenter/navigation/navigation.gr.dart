// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'navigation.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DiscoverRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverRouteArgs>(
          orElse: () => const DiscoverRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DiscoverPage(
          key: args.key,
          searchData: args.searchData,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfilePage(),
      );
    },
    ErrorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ErrorPage(),
      );
    },
    FeedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginPage()),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MyPlacesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyPlacesPage(),
      );
    },
    PizzaPlaceRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<PizzaPlaceRouteArgs>(
          orElse: () =>
              PizzaPlaceRouteArgs(arguments: queryParams.get('arguments')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PizzaPlacePage(
          key: args.key,
          arguments: args.arguments,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const RegisterPage()),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    SuggestionsRoute.name: (routeData) {
      final args = routeData.argsAs<SuggestionsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SuggestionsPage(
          key: args.key,
          pizzaPlaceId: args.pizzaPlaceId,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const WelcomePage()),
      );
    },
  };
}

/// generated route for
/// [DiscoverPage]
class DiscoverRoute extends PageRouteInfo<DiscoverRouteArgs> {
  DiscoverRoute({
    Key? key,
    Map<String, String>? searchData,
    List<PageRouteInfo>? children,
  }) : super(
          DiscoverRoute.name,
          args: DiscoverRouteArgs(
            key: key,
            searchData: searchData,
          ),
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const PageInfo<DiscoverRouteArgs> page =
      PageInfo<DiscoverRouteArgs>(name);
}

class DiscoverRouteArgs {
  const DiscoverRouteArgs({
    this.key,
    this.searchData,
  });

  final Key? key;

  final Map<String, String>? searchData;

  @override
  String toString() {
    return 'DiscoverRouteArgs{key: $key, searchData: $searchData}';
  }
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ErrorPage]
class ErrorRoute extends PageRouteInfo<void> {
  const ErrorRoute({List<PageRouteInfo>? children})
      : super(
          ErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeedPage]
class FeedRoute extends PageRouteInfo<void> {
  const FeedRoute({List<PageRouteInfo>? children})
      : super(
          FeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyPlacesPage]
class MyPlacesRoute extends PageRouteInfo<void> {
  const MyPlacesRoute({List<PageRouteInfo>? children})
      : super(
          MyPlacesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyPlacesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PizzaPlacePage]
class PizzaPlaceRoute extends PageRouteInfo<PizzaPlaceRouteArgs> {
  PizzaPlaceRoute({
    Key? key,
    required PizzaPlaceArguments? arguments,
    List<PageRouteInfo>? children,
  }) : super(
          PizzaPlaceRoute.name,
          args: PizzaPlaceRouteArgs(
            key: key,
            arguments: arguments,
          ),
          rawQueryParams: {'arguments': arguments},
          initialChildren: children,
        );

  static const String name = 'PizzaPlaceRoute';

  static const PageInfo<PizzaPlaceRouteArgs> page =
      PageInfo<PizzaPlaceRouteArgs>(name);
}

class PizzaPlaceRouteArgs {
  const PizzaPlaceRouteArgs({
    this.key,
    required this.arguments,
  });

  final Key? key;

  final PizzaPlaceArguments? arguments;

  @override
  String toString() {
    return 'PizzaPlaceRouteArgs{key: $key, arguments: $arguments}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuggestionsPage]
class SuggestionsRoute extends PageRouteInfo<SuggestionsRouteArgs> {
  SuggestionsRoute({
    Key? key,
    required String pizzaPlaceId,
    List<PageRouteInfo>? children,
  }) : super(
          SuggestionsRoute.name,
          args: SuggestionsRouteArgs(
            key: key,
            pizzaPlaceId: pizzaPlaceId,
          ),
          initialChildren: children,
        );

  static const String name = 'SuggestionsRoute';

  static const PageInfo<SuggestionsRouteArgs> page =
      PageInfo<SuggestionsRouteArgs>(name);
}

class SuggestionsRouteArgs {
  const SuggestionsRouteArgs({
    this.key,
    required this.pizzaPlaceId,
  });

  final Key? key;

  final String pizzaPlaceId;

  @override
  String toString() {
    return 'SuggestionsRouteArgs{key: $key, pizzaPlaceId: $pizzaPlaceId}';
  }
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
