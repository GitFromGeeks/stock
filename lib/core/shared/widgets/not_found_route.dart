import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/core/helpers/extensions/context_extensions.dart';
import 'package:stocks/core/shared/widgets/custom_text_button.dart'
    show CustomTextButton;

import '../../config/routes/app_router.dart' show AppRouter;
import '../../config/routes/routes.dart' show Routes;
import '../../helpers/constants/app_colors.dart' show AppColors;
import '../../helpers/constants/app_typography.dart' show AppTypography;

class NotFoundRoute extends ConsumerWidget {
  const NotFoundRoute({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text("Stock App"),
            Text("Oops", style: AppTypography.primary.heading34),
            Text("Route Not Found"),
            CustomTextButton.gradient(
              width: context.screenWidth * 0.8,
              onPressed: () {
                AppRouter.pushNamed(Routes.AppStartupScreenRoute);
              },
              gradient: AppColors.buttonGradientPurple,
              child: Text(
                "LOGIN",
                style: AppTypography.secondary.body16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
