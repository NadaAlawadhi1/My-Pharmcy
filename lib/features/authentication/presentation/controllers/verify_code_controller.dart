import 'dart:async';
import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/functions/show_snackbar.dart';
import 'package:e_commerce/core/services/app_services.dart';
import 'package:e_commerce/core/services/network/request_status.dart';
import 'package:e_commerce/features/authentication/data/model/user_model.dart';
import 'package:e_commerce/features/authentication/data/repositories_impl/verify_code_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  late TextEditingController codeController;
  late String email;
  late String purpose;
  final AppServices services = Get.find<AppServices>();

  var status = RequestStatus.success.obs;
  var remainingSeconds = 0.obs;

  Future<void> verifyCode(String code);
  Future<void> resendVerificationCode();
  void goBack();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  final VerifyCodeRepository repository = VerifyCodeRepository();
  Timer? _timer;

  @override
  void onInit() {
    email = Get.arguments?['email'] ?? "";
    purpose = Get.arguments?['purpose'] ?? "signup";
    codeController = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> verifyCode(String code) async {
    status.value = RequestStatus.loading;
    update();

    final result = await repository.verifyCode(
      email: email,
      code: code,
      purpose: purpose,
    );
    result.fold(
      (failure) {
        status.value = failure;
        showSnack(
          LocaleKeys.invalidCode.tr,
          LocaleKeys.invalidCodeMessage.tr,
          type: SnackType.warning,
        );
      },
      (success) async {
        status.value = RequestStatus.success;

        showSnack(
          LocaleKeys.success.tr,
          LocaleKeys.codeVerified.tr,
          type: SnackType.success,
        );

        await services.setLoggedIn(true);

        if (purpose == "signup") {
          if (success is UserModel) {
            await services.saveUserData(success);
            Get.offAllNamed(AppRoutes.home);
          } else {
            showSnack(
              LocaleKeys.error.tr,
              LocaleKeys.unexpectedResponseErrorMessage.tr,
              type: SnackType.error,
            );
          }
        } else if (purpose == "reset") {
          Get.offAllNamed(AppRoutes.resetPassword, arguments: {"email": email});
        }
      },
    );

    update();
  }

  @override
  Future<void> resendVerificationCode() async {
    if (remainingSeconds.value > 0) return;

    status.value = RequestStatus.loading;
    update();

    final result = await repository.resendCode(email: email, purpose: purpose);

    result.fold(
      (failure) => showSnack(
        LocaleKeys.error.tr,
        LocaleKeys.couldNotResendCode.tr,
        type: SnackType.error,
      ),
      (_) {
        showSnack(
          LocaleKeys.success.tr,
          LocaleKeys.newCodeSent.tr,
          type: SnackType.success,
        );

        startCountdown();
      },
    );

    status.value = RequestStatus.success;
    update();
  }

  void startCountdown() {
    remainingSeconds.value = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void goBack() => Get.back();

  @override
  void onClose() {
    codeController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
