// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

import 'routes.dart';

@immutable
class AppRouter {
  const AppRouter._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>? ?? {};
    final RouteAnimation animatedFrom =
        args['from'] ?? RouteAnimation.fromRight;
    Offset beginFrom = Offset(0.0, 1.0);
    switch (animatedFrom) {
      case RouteAnimation.fromBottom:
        beginFrom = Offset(0.0, 1.0);
      case RouteAnimation.fromTop:
        beginFrom = Offset(0.0, -1.0);
      case RouteAnimation.fromLeft:
        beginFrom = Offset(-1.0, 0.0);
      case RouteAnimation.fromRight:
        beginFrom = Offset(1.0, 0.0);
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Routes.getRoute(settings.name)(context, settings),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = beginFrom;
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: args,
    );
  }

  static Future<dynamic> push(Widget page) {
    return navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<dynamic> pushAndRemoveUntil(String newRouteName,
      {dynamic args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      newRouteName,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }

  static Future<void> pop([dynamic result]) async {
    navigatorKey.currentState!.pop(result);
  }

  static Future<dynamic> popAndPushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.popAndPushNamed(
      routeName,
      arguments: args,
    );
  }

  static void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(
      ModalRoute.withName(routeName),
    );
  }

  static void popUntilRoot() {
    navigatorKey.currentState!.popUntil(
      ModalRoute.withName(Routes.initialRoute),
    );
  }
}
