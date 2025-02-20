// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:stocks/features/auth/display/pages/login_page.dart';

import '../../../root/display/pages/app_startup_page.dart' show AppStartupPage;
import '../../../root/display/pages/skeleton_page.dart' show SkeletonPage;
import '../../shared/widgets/not_found_route.dart' show NotFoundRoute;

@immutable
class Routes {
  const Routes._();

  static const String initialRoute = AppStartupScreenRoute;
  static const String fallbackRoute = NotFoundScreenRoute;
  static const String AppStartupScreenRoute = '/app-startup-screen';
  static const String skeleton = "/app_skeleton";
  static const String login = "/login";

  static const String NotFoundScreenRoute = '/route-not-found-screen';

  static final Map<String, Widget Function(BuildContext, RouteSettings)>
  _routesMap = {
    AppStartupScreenRoute: (_, __) => const AppStartupPage(),
    skeleton: (_, __) => const SkeletonPage(),
    login: (_, __) => const LoginPage(),

    NotFoundScreenRoute: (_, __) => NotFoundRoute(),
  };

  static Widget Function(BuildContext, RouteSettings) getRoute(
    String? routeName,
  ) {
    return routeExists(routeName)
        ? _routesMap[routeName]!
        : _routesMap[Routes.NotFoundScreenRoute]!;
  }

  static bool routeExists(String? routeName) {
    return _routesMap.containsKey(routeName);
  }
}

enum RouteAnimation { fromBottom, fromLeft, fromRight, fromTop }
