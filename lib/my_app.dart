import 'package:flutter/cupertino.dart' show Widget;
import 'package:flutter/material.dart' show BuildContext, MaterialApp;
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show ConsumerWidget, ProviderScope, WidgetRef;

import 'core/config/routes/app_router.dart' show AppRouter;
import 'core/config/routes/routes.dart' show Routes;
import 'core/helpers/constants/app_colors.dart' show AppColors;
import 'core/helpers/constants/app_themes.dart' show AppThemes;

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = "Food Delivery App";
    const showDebugBanner = false;
    return ProviderScope(
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: showDebugBanner,
        color: AppColors.primaryColor,
        theme: AppThemes.mainTheme,
        initialRoute: Routes.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: AppRouter.navigatorKey,
      ),
    );
  }
}
