import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:get/get.dart';

class InputValidation {
  // Username
  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.usernameRequired.tr;
    }
    return null;
  }

  // Email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.emailRequired.tr;
    }
    if (!GetUtils.isEmail(value.trim())) {
      return LocaleKeys.invalidEmail.tr;
    }
    return null;
  }

  // Password (uses minLength message for consistency)
  static String? validatePassword(String? value, {int min = 6}) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.passwordRequired.tr;
    }

    // Use shared minLength message with parameter
    if (value.length < min) {
      return LocaleKeys.minLength.trParams({"min": "$min"});
      // Alternatively, if you prefer a dedicated key, you can keep:
      // return LocaleKeys.passwordTooShort.tr;
    }

    // must contain at least one letter and one digit
    final isValid = RegExp(r'(?=.*[A-Za-z])(?=.*\d)').hasMatch(value);
    if (!isValid) {
      return LocaleKeys.passwordInvalid.tr;
    }
    return null;
  }

  // Confirm password helper (reusable)
  static String? validateConfirmPassword(String? value, String? original) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.confirmPasswordRequired.tr;
    }
    if (value != original) {
      return LocaleKeys.passwordMismatch.tr;
    }
    return null;
  }
}