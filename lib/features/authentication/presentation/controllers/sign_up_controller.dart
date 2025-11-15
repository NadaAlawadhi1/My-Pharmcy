import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/functions/show_snackbar.dart';
import 'package:e_commerce/features/authentication/data/model/user_model.dart';
import 'package:e_commerce/features/authentication/data/repositories_impl/sign_up_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/network/request_status.dart';

abstract class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;

  var status = RequestStatus.success.obs;
  var emailError = "".obs;

  UserModel? user;

  signUp();
  goToSignIn();
  goToVerifyCode();
}

class SignUpControllerImpl extends SignUpController {
  final SignUpRepository repository = SignUpRepository();

  @override
  Future<void> signUp() async {
    emailError.value = '';

    if (!(formKey.currentState?.validate() ?? false)) return;

    status.value = RequestStatus.loading;

    final result = await repository.signUp(
      name: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    result.fold(
      (failure) {
        status.value = failure;

        if (failure == RequestStatus.failure) {
          emailError.value = LocaleKeys.emailExists.tr;
          showSnack(
            LocaleKeys.emailExists.tr,
            LocaleKeys.useAnotherEmail.tr,
            type: SnackType.warning,
          );
        } else if (failure == RequestStatus.unverified) {
          showSnack(
            LocaleKeys.verifyYourAccount.tr,
            LocaleKeys.newCodeSent.tr,
            type: SnackType.info,
          );
          goToVerifyCode();
        } else if (failure == RequestStatus.offlineFailure) {
          showSnack(
            LocaleKeys.offline.tr,
            LocaleKeys.noInternetConnection.tr,
            type: SnackType.info,
          );
        } else if (failure == RequestStatus.serverFailure) {
          showSnack(
            LocaleKeys.serverError.tr,
            LocaleKeys.unexpectedIssue.tr,
            type: SnackType.error,
          );
        } else {
          showSnack(
            LocaleKeys.error.tr,
            LocaleKeys.unexpectedIssue.tr,
            type: SnackType.error,
          );
        }
      },
      (userModel) {
        user = userModel;
        status.value = RequestStatus.success;

        showSnack(
          LocaleKeys.success.tr,
          "${LocaleKeys.welcome.tr} ${userModel.name}! ${LocaleKeys.pleaseVerifyEmail.tr}",
          type: SnackType.success,
        );

        goToVerifyCode();
      },
    );

    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.signIn);
  }

  @override
  goToVerifyCode() {
    Get.toNamed(AppRoutes.verifyCode, arguments: {
      "email": emailController.text.trim(),
      "purpose": "signup",
    });
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
