import 'package:flutter/material.dart'
    show BuildContext, MediaQuery, Theme, TextStyle, Navigator, ThemeData;

extension ContextExt on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);

  TextStyle? get hl => theme.textTheme.headlineLarge;
  TextStyle? get hm => theme.textTheme.headlineMedium;
  TextStyle? get hs => theme.textTheme.headlineSmall;

  TextStyle? get tl => theme.textTheme.titleLarge;
  TextStyle? get tm => theme.textTheme.titleMedium;
  TextStyle? get ts => theme.textTheme.titleSmall;

  TextStyle? get bl => theme.textTheme.bodyLarge;
  TextStyle? get bm => theme.textTheme.bodyMedium;
  TextStyle? get bs => theme.textTheme.bodySmall;

  TextStyle? get ll => theme.textTheme.labelLarge;
  TextStyle? get lm => theme.textTheme.labelMedium;
  TextStyle? get ls => theme.textTheme.labelSmall;

  TextStyle? get phl => theme.primaryTextTheme.headlineLarge;
  TextStyle? get phm => theme.primaryTextTheme.headlineMedium;
  TextStyle? get phs => theme.primaryTextTheme.headlineSmall;

  TextStyle? get ptl => theme.primaryTextTheme.titleLarge;
  TextStyle? get ptm => theme.primaryTextTheme.titleMedium;
  TextStyle? get pts => theme.primaryTextTheme.titleSmall;

  TextStyle? get pbl => theme.primaryTextTheme.bodyLarge;
  TextStyle? get pbm => theme.primaryTextTheme.bodyMedium;
  TextStyle? get pbs => theme.primaryTextTheme.bodySmall;

  TextStyle? get pll => theme.primaryTextTheme.labelLarge;
  TextStyle? get plm => theme.primaryTextTheme.labelMedium;
  TextStyle? get pls => theme.primaryTextTheme.labelSmall;

  void pop<T extends Object?>([T? result]) {
    return Navigator.of(this).pop();
  }

  Future<T?> pushNamed<T extends Object?>(
          String routeName, Object? arguments) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);
}
