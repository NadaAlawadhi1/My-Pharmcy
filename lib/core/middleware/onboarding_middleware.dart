import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/app_services.dart';
import '../constant/app_routes.dart';

class OnboardingMiddleware extends GetMiddleware {
  // priority controls middleware evaluation order (lower = earlier)
  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    final services = Get.find<AppServices>();
print("🧭 Middleware redirect: isFirstTime=${services.isFirstTime}, isLoggedIn=${services.isLoggedIn}");

    if (services.isFirstTime) {
      return const RouteSettings(name: AppRoutes.onboarding);
    }

    if (services.isLoggedIn) {
      return const RouteSettings(name: AppRoutes.home);
    }

    return const RouteSettings(name: AppRoutes.signIn);
  }
}
