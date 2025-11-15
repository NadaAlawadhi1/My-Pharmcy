import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/middleware/onboarding_middleware.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/google_auth_controller.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/reset_password_controller.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/sign_in_controller.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/sign_up_controller.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/verify_code_controller.dart';
import 'package:e_commerce/features/authentication/presentation/screens/forget_passwordl.dart';
import 'package:e_commerce/features/authentication/presentation/screens/reset_password.dart';
import 'package:e_commerce/features/authentication/presentation/screens/reset_success.dart';
import 'package:e_commerce/features/authentication/presentation/screens/sign_in.dart';
import 'package:e_commerce/features/authentication/presentation/screens/sign_up.dart';
import 'package:e_commerce/features/authentication/presentation/screens/verify_code.dart';
import 'package:e_commerce/features/home/presentation/screens/home.dart';
import 'package:e_commerce/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:e_commerce/features/onboarding/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () =>
          const SizedBox.shrink(), 
      middlewares: [OnboardingMiddleware()],
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(), 
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnboardingControllerImpl());
      }),
    ),

    GetPage(
  name: AppRoutes.signIn,
  page: () => SignInScreen(),
  binding: BindingsBuilder(() {
    Get.lazyPut(() => SignInControllerImpl());
    Get.lazyPut(() => GoogleAuthController());
  }),
),

    GetPage(
      name: AppRoutes.signUp,
      page: () => SignUpScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SignUpControllerImpl());
            Get.lazyPut(() => GoogleAuthController());

      }),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ForgetPasswordControllerImpl());
      }),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ResetPasswordControllerImpl());
      }),
    ),
    GetPage(
      name: AppRoutes.resetSuccess,
      page: () => const ResetSuccessScreen(),
    ),
    GetPage(
      name: AppRoutes.verifyCode,
      page: () => const VerifyCodeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => VerifyCodeControllerImpl());
      }),
    ),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  ];
}
