import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/functions/show_snackbar.dart';
import 'package:e_commerce/core/services/app_services.dart';
import 'package:e_commerce/core/services/network/request_status.dart';
import 'package:e_commerce/features/authentication/data/repositories_impl/sign_in_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  GlobalKey<FormState> get formKey;
  TextEditingController get emailController;
  TextEditingController get passwordController;
  Rx<RequestStatus> get status;
  RxBool get rememberMe;

  Future<void> signIn();
  void toggleRememberMe();
  void goToSignUp();
  void goToPasswordRecovery();
}

class SignInControllerImpl extends SignInController {
  @override
  final formKey = GlobalKey<FormState>();
  final SignInRepository repository = SignInRepository();
  final AppServices services = Get.find<AppServices>();

  @override
  late TextEditingController emailController;
  @override
  late TextEditingController passwordController;
  @override
  Rx<RequestStatus> status = RequestStatus.success.obs;
  @override
  RxBool rememberMe = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController(text: services.savedEmail ?? '');
    passwordController = TextEditingController(
      text: services.savedPassword ?? '',
    );
    rememberMe.value = (services.savedEmail?.isNotEmpty ?? false);
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Future<void> signIn() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    status.value = RequestStatus.loading;
    update();

    final result = await repository.signIn(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    result.fold(
      (failure) {
        if (failure == RequestStatus.unverified) {
          showSnack(
            LocaleKeys.verifyYourAccount.tr,
            LocaleKeys.pleaseVerifyEmail.tr,
            type: SnackType.warning,
          );
        } else if (failure == RequestStatus.failure) {
          showSnack(
            LocaleKeys.loginFailed.tr,
            LocaleKeys.invalidEmailOrPassword.tr,
            type: SnackType.error,
          );
        } else if (failure == RequestStatus.offlineFailure) {
          showSnack(
            LocaleKeys.offline.tr,
            LocaleKeys.noInternetConnection.tr,
            type: SnackType.info,
          );
        } else {
          showSnack(
            LocaleKeys.serverError.tr,
            LocaleKeys.unexpectedIssue.tr,
            type: SnackType.error,
          );
        }
      },
      (user) async {
        showSnack(
          LocaleKeys.welcome.tr,
          "${LocaleKeys.hello.tr} ${user.name}!",
          type: SnackType.success,
        );

        await services.setLoggedIn(true);

        if (rememberMe.value) {
          services.saveCredentials(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
        } else {
          services.clearCredentials();
        }

        Get.offAllNamed(AppRoutes.home);
      },
    );

    status.value = RequestStatus.success;
    update();
  }

  @override
  void toggleRememberMe() => rememberMe.toggle();
  @override
  void goToSignUp() => Get.offNamed(AppRoutes.signUp);
  @override
  void goToPasswordRecovery() => Get.toNamed(AppRoutes.forgotPassword);
}
