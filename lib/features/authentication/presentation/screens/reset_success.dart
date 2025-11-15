import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/constant/lottie_assets.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/button.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetSuccessScreen extends StatelessWidget {
  const ResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppLottieAssets.success,
              width: 180.w,
              height: 180.w,
              repeat: false,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    const ['**'], 
                    value: AppColors.primaryBlue,
                  ),
                ],
              ),
            ),

            AuthHeaderWidget(
              title: LocaleKeys.passwordResetTitle.tr,
              subTitle: LocaleKeys.passwordResetSubtitle.tr,
            ),

            SizedBox(height: 40.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: AuthButtonWidget(
                text: LocaleKeys.goToSignIn.tr,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.signIn);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
