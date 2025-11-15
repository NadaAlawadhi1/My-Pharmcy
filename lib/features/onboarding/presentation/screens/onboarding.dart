import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:e_commerce/features/onboarding/presentation/widgets/bottom_buttons.dart';
import 'package:e_commerce/features/onboarding/presentation/widgets/indicator.dart';
import 'package:e_commerce/features/onboarding/presentation/widgets/language_button.dart';
import 'package:e_commerce/features/onboarding/presentation/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: OrientationUtils.isPortrait(context)
                          ? 20.h
                          : 5.h,
                    ),
                    child: const OnboardingSliderWidget(),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: OrientationUtils.isPortrait(context) ? 12.h : 6.h,
                  ),
                  child: const OnboardingIndicatorWidget(),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(
                    25.w,
                    0,
                    25.w,
                    OrientationUtils.isPortrait(context) ? 70.h : 30.h,
                  ),
                  child: const OnboardingBottomButtonsWidget(),
                ),
              ],
            ),

            Positioned(
              top: OrientationUtils.isPortrait(context) ? 16.h : 8.h,
              right: OrientationUtils.isPortrait(context) ? 16.w : 8.w,
              child: OnboardingLanguageButtonWidget(), // stays top-right
            ),
          ],
        ),
      ),
    );
  }
}
