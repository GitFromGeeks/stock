import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/core/helpers/extensions/context_extensions.dart';
import 'package:stocks/features/auth/display/providers/auth_provider.dart'
    show authProvider;

import '../../../../core/helpers/constants/app_colors.dart';
import '../../../../core/helpers/constants/app_styles.dart';
import '../../../../core/helpers/constants/app_typography.dart';
import '../../../../core/helpers/constants/form_validator.dart'
    show FormValidator;
import '../../../../core/shared/widgets/custom_text_button.dart'
    show CustomTextButton;
import '../../../../core/shared/widgets/custom_textfield.dart'
    show CustomTextField;
import '../controllers/auth_controllers.dart' show AuthControllers;

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final password = useTextEditingController(text: "");
    final email = useTextEditingController(text: "");

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.lightBackgroundColor,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            child: Center(
              child: SizedBox(
                width: context.screenWidth * 0.9,
                child: Column(
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
                    Insets.gapH30,
                    CustomTextField(
                      controller: email,
                      floatingText: 'Email',
                      hintText: 'enter your email',
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 12.0,
                      ),
                      validator: FormValidator.emailValidator,
                    ),
                    CustomTextField(
                      controller: password,
                      floatingText: 'Password',
                      hintText: 'enter your password',
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 12.0,
                      ),
                      validator: FormValidator.passwordValidator,
                    ),
                    Insets.gapH30,
                    Consumer(
                      builder: (_, ref, __) {
                        var auth = ref.watch(authProvider);
                        return CustomTextButton.gradient(
                          width: double.infinity,
                          disabled: auth is AsyncLoading ? true : false,
                          onPressed:
                              () async => AuthControllers.login(
                                ref,
                                context,
                                formKey,
                                email.text,
                                password.text,
                              ),
                          gradient: AppColors.buttonGradientPurple,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: AppTypography.secondary.body16.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
