// ignore_for_file: use_build_context_synchronousl, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/auth/display/providers/auth_provider.dart'
    show authProvider;

import '../../../core/config/routes/app_router.dart';
import '../../../core/config/routes/routes.dart';
import '../../../core/networking/custom_exception.dart' show CustomException;
import '../../../core/shared/widgets/snackbars.dart' show showErrorSnackbar;

class AuthControllers {
  static Future<void> login(
    WidgetRef ref,
    BuildContext context,
    GlobalKey<FormState> form,
    String email,
    String password,
  ) async {
    if (form.currentState!.validate()) {
      form.currentState!.save();
      try {
        var response = await ref
            .read(authProvider.notifier)
            .login(email: email, password: password);
        if (response != null) {
          if (response.headers.code == 200 || response.headers.code == 201) {
            AppRouter.pushNamed(Routes.skeleton);
          } else {
            showErrorSnackbar(context, response.headers.message);
          }
        }
      } on CustomException catch (ex) {
        showErrorSnackbar(context, ex.message);
      }
    }
  }
}
