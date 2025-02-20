// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:stocks/auth/display/pages/login_page.dart';
import 'package:stocks/stock/display/pages/stock_detail_page.dart';

import '../../../stock/display/pages/app_startup_page.dart' show AppStartupPage;
import '../../../stock/display/pages/skeleton_page.dart' show SkeletonPage;
import '../../../stock/display/pages/stock_by_id.dart' show StockById;
import '../../shared/widgets/not_found_route.dart' show NotFoundRoute;

@immutable
class Routes {
  const Routes._();

  static const String initialRoute = AppStartupScreenRoute;
  static const String fallbackRoute = NotFoundScreenRoute;
  static const String AppStartupScreenRoute = '/app-startup-screen';
  static const String skeleton = "/app_skeleton";
  static const String login = "/login";
  static const String stockById = "/stock_by_id";
  static const String stockDetails = "/stockDetails";

  static const String NotFoundScreenRoute = '/route-not-found-screen';

  static final Map<String, Widget Function(BuildContext, RouteSettings)>
  _routesMap = {
    AppStartupScreenRoute: (_, __) => const AppStartupPage(),
    skeleton: (_, __) => const SkeletonPage(),
    login: (_, __) => const LoginPage(),
    stockById: (_, settings) {
      var args = settings.arguments as Map<String, dynamic>?;
      return StockById(searched: args?["id"]);
    },

    stockDetails: (_, settings) {
      var args = settings.arguments as Map<String, dynamic>?;
      return StockDetailPage(stock: args?["stock"]);
    },

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
