import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:e_commerce/core/services/network/request_status.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/verify_code_controller.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeScreen extends GetView<VerifyCodeControllerImpl> {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.goBack,
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
            size: OrientationUtils.isPortrait(context) ? 18.sp : 12.sp,
          ),
        ),
        backgroundColor: AppColors.backgroundLight,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthHeaderWidget(
                icon: Icons.email_outlined,
                title: LocaleKeys.checkInboxTitle.tr,
                subTitle:
                    "${LocaleKeys.checkInboxSubtitle.tr}\n${controller.email.isNotEmpty ? controller.email : LocaleKeys.defaultEmail.tr}\n${LocaleKeys.verifyToContinue.tr}",
              ),
              SizedBox(height: 40.h),

              Center(
                child: Directionality(
                  textDirection: TextDirection.ltr, 
                  child: Pinput(
                    length: 5, 
                    controller: controller.codeController,
                    onCompleted: (pin) => controller.verifyCode(pin),
                    defaultPinTheme: PinTheme(
                      width: 50.w,
                      height: 55.h,
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: AppColors.grey.withOpacity(0.4),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 50.w,
                      height: 55.h,
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: AppColors.primaryBlue,
                          width: 2,
                        ),
                      ),
                    ),
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 22.w,
                          height: 2.h,
                          color: AppColors.primaryBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),
              Obx(() {
                final isLoading =
                    controller.status.value == RequestStatus.loading;
                final seconds = controller.remainingSeconds.value;

                return TextButton(
                  onPressed: (isLoading || seconds > 0)
                      ? null
                      : controller.resendVerificationCode,
                  child: Text(
                    isLoading
                        ? LocaleKeys.sending.tr
                        : (seconds > 0
                              ? LocaleKeys.resendIn.trParams({
                                  "seconds": seconds.toString(),
                                })
                              : LocaleKeys.resendCode.tr),
                    style: TextStyle(color: AppColors.primaryBlue),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
