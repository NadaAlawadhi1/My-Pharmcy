import 'package:e_commerce/features/onboarding/data/repositories_impl/onboarding_local_service.dart';
import 'package:e_commerce/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingSliderWidget extends GetView<OnboardingControllerImpl> {
  const OnboardingSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      itemCount: onboardingList.length,
      onPageChanged: controller.onPageChanged,
      itemBuilder: (context, index) {
        final item = onboardingList[index];

        return Column(
          children: [
            Expanded(
              flex: 6,
              child: Image.asset(
                item.image!,
                fit: BoxFit.contain,
                height: OrientationUtils.isPortrait(context) ? 0.4.sh : 0.35.sh,
              ),
            ),

            SizedBox(
              height: OrientationUtils.isPortrait(context) ? 24.h : 12.h,
            ),

            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text(
                      item.title!.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: OrientationUtils.isPortrait(context)
                            ? 20.sp
                            : 10.sp,

                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: OrientationUtils.isPortrait(context) ? 16.h : 8.h,
                  ),
                  Text(
                    item.body!.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: OrientationUtils.isPortrait(context)
                          ? 16.sp
                          : 7.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
