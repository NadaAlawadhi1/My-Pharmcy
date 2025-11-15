import 'package:e_commerce/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:e_commerce/features/onboarding/data/repositories_impl/onboarding_local_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingBottomButtonsWidget extends GetView<OnboardingControllerImpl> {
  const OnboardingBottomButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImpl>(
      builder: (controller) {
        final bool isLastPage =
            controller.currentPage == onboardingList.length - 1;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: isLastPage
                  ? MainAxisAlignment
                        .center 
                  : MainAxisAlignment.spaceBetween, // Normal: Skip + Next
              children: [
                if (!isLastPage)
                  TextButton(
                    onPressed: controller.skipToEnd,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      LocaleKeys.skip.tr,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: OrientationUtils.isPortrait(context)
                            ? 16.sp
                            : 7.sp,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                ElevatedButton(
                  onPressed: controller.goNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    padding: EdgeInsets.symmetric(
                      horizontal: isLastPage
                          ? 60.w
                          : 30.w, 
                      vertical: OrientationUtils.isPortrait(context)
                          ? 14.h
                          : 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        OrientationUtils.isPortrait(context) ? 30.r : 40.r,
                      ),
                    ),
                    minimumSize: Size(isLastPage ? 200.w : 120.w, 48.h),
                  ),
                  child: Text(
                    isLastPage ? LocaleKeys.getStarted.tr : LocaleKeys.next.tr,
                    style: TextStyle(
                      fontSize: OrientationUtils.isPortrait(context)
                          ? 16.sp
                          : 7.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
