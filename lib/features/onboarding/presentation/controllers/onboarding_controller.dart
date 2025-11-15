import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/services/app_services.dart';
import 'package:e_commerce/features/onboarding/data/repositories_impl/onboarding_local_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  void goNext();
  void onPageChanged(int index);
  void skipToEnd();
}

class OnboardingControllerImpl extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  Future<void> goNext() async {
    if (currentPage < onboardingList.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      final services = Get.find<AppServices>();
      await services.setFirstTime(false); 
      Get.offAllNamed(AppRoutes.signIn);
    }
    update();
  }

  @override
  void skipToEnd() {
    currentPage = onboardingList.length - 1;
    pageController.jumpToPage(currentPage);
    update();
  }
}
