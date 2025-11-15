import 'package:e_commerce/core/constant/api_link.dart';
import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/functions/show_snackbar.dart';
import 'package:e_commerce/core/services/network/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  late TextEditingController emailController;

  void checkEmail();
  void goBack();
  void goToVerifyCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  void checkEmail() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final apiClient = ApiClient();
    final response = await apiClient.postData(ApiLink.forgetResetPassword, {
      "email": emailController.text.trim(),
      "action": "send",
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
        Get.toNamed(
          AppRoutes.verifyCode,
          arguments: {"email": emailController.text.trim(), "purpose": "reset"},
        );
      },
    );
  }

  @override
  void goBack() {
    Get.back();
  }

  @override
  void goToVerifyCode() {
    Get.toNamed(
      AppRoutes.verifyCode,
      arguments: {"email": emailController.text.trim(), "purpose": "reset"},
    );
  }
}
