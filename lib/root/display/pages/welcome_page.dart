import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/config/routes/app_router.dart';
import '../../../core/config/routes/routes.dart';
import '../../../core/helpers/constants/app_colors.dart';
import '../../../core/helpers/constants/app_typography.dart';
import '../../../core/shared/widgets/custom_text_button.dart'
    show CustomTextButton;

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.lightBackgroundColor,
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 125, 20, 0),
          child: Column(
            spacing: 40,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_to_home_screen_rounded,
                size: 90,
                color: AppColors.primaryColor,
              ),
              Text(
                "Stock App",
                style: AppTypography.primary.heading34.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 60,
                ),
              ),

              CustomTextButton.gradient(
                width: double.infinity,
                onPressed: () {
                  AppRouter.pushNamed(Routes.login);
                },
                gradient: AppColors.buttonGradientPurple,
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
