import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/functions/show_snackbar.dart';
import 'package:e_commerce/core/services/network/api_client.dart';
import 'package:e_commerce/core/constant/api_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordControllerImpl extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late String email;

  final ApiClient apiClient = ApiClient();

  @override
  void onInit() {
    email = Get.arguments?['email'] ?? "";
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final response = await apiClient.postData(ApiLink.forgetResetPassword, {
      "email": email,
      "password": passwordController.text.trim(),
      "action": "reset",
    });

    response.fold(
      (failure) => showSnack(
        LocaleKeys.error.tr,
        LocaleKeys.passwordResetFailed.tr,
        type: SnackType.error,
      ),
      (data) {
        showSnack(
          LocaleKeys.success.tr,
          LocaleKeys.passwordResetSuccess.tr,
          type: SnackType.success,
        );
        Get.offAllNamed(AppRoutes.resetSuccess);
      },
    );
  }
}
