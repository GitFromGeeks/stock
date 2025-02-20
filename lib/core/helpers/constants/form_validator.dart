import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stocks/core/helpers/extensions/string_extension.dart';

/// A utility class that holds methods for validating different textFields.
/// This class has no constructor and all methods are `static`.
@immutable
class FormValidator {
  const FormValidator._();

  static const _invalidEmailError = 'Please enter a valid email address';

  static const _emptyEmailInputError = 'Please enter an email';

  static const _emptyPasswordInputError = 'Please enter a password';

  static const _invalidConfirmPwError = "Passwords don't match";

  static const _invalidCurrentPwError = 'Invalid current password!';

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return _emptyEmailInputError;
    } else if (!email.isValidEmail) {
      return _invalidEmailError;
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) return _emptyPasswordInputError;
    return null;
  }

  static String? confirmPasswordValidator(String? confirmPw, String inputPw) {
    if (confirmPw == inputPw.trim()) return null;
    return _invalidConfirmPwError;
  }

  static String? currentPasswordValidator(String? inputPw, String currentPw) {
    if (inputPw == currentPw) return null;
    return _invalidCurrentPwError;
  }
}
