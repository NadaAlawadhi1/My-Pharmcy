import 'package:e_commerce/features/authentication/presentation/controllers/reset_password_controller.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/button.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/header.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/text_field.dart';
import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';

import 'package:e_commerce/core/classes/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends GetView<ResetPasswordControllerImpl> {
  const ResetPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
            size: OrientationUtils.isPortrait(context) ? 18.sp : 12.sp,
          ),
        ),
        backgroundColor: AppColors.backgroundLight,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              AuthHeaderWidget(
                title: LocaleKeys.resetPasswordTitle.tr,
                subTitle: LocaleKeys.resetPasswordSubtitle.tr,
              ),

              SizedBox(height: 30.h),

              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    AuthTextFieldWidget(
                      textController: controller.passwordController,
                      label: LocaleKeys.newPassword.tr,
                      obscure: true,
                      suffixIcon: Icons.lock_outline,
                      validator: InputValidation.validatePassword,
                    ),

                    SizedBox(height: 15.h),

                    AuthTextFieldWidget(
                      textController: controller.confirmPasswordController,
                      label: LocaleKeys.confirmPassword.tr,
                      obscure: true,
                      suffixIcon: Icons.lock_outline,
                      // Only check match (and treat empty as mismatch)
                      validator: (value) =>
                          InputValidation.validateConfirmPassword(
                            value,
                            controller.passwordController.text,
                          ),
                    ),

                    SizedBox(height: 30.h),

                    AuthButtonWidget(
                      text: LocaleKeys.resetPasswordButton.tr,
                      onPressed: controller.resetPassword,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
