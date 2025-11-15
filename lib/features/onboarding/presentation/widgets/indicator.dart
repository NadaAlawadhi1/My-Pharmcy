import 'package:e_commerce/features/onboarding/data/repositories_impl/onboarding_local_service.dart';
import 'package:e_commerce/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingIndicatorWidget extends GetView<OnboardingControllerImpl> {
  const OnboardingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImpl>(
      builder: (controller) => Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(onboardingList.length, (index) {
            final isActive = index == controller.currentPage;

            return Directionality(
              textDirection: TextDirection.ltr,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                height: OrientationUtils.isPortrait(context) ? 10.h : 5.w,
                width: OrientationUtils.isPortrait(context)
                    ? (isActive ? 24.h : 16.h)
                    : (isActive ? 12.w : 8.w),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primaryBlue : AppColors.grey,
                  borderRadius: BorderRadius.circular(
                    OrientationUtils.isPortrait(context) ? 5.h : 5.w,
                  ),
                  border: Border.all(
                    color: isActive ? AppColors.primaryBlue : AppColors.grey,
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.primaryBlue
                              : AppColors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundLight,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
