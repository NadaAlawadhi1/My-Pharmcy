import 'package:e_commerce/features/authentication/presentation/controllers/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/button.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/header.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/text_field.dart';
import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:e_commerce/core/classes/input_validation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends GetView<ForgetPasswordControllerImpl> {
  const ForgotPasswordScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthHeaderWidget(
              title: LocaleKeys.checkEmailTitle.tr,
              subTitle: LocaleKeys.checkEmailSubtitle.tr,
            ),
            SizedBox(height: 20.h),

            Form(
              key: controller.formKey,
              child: AuthTextFieldWidget(
                validator: InputValidation.validateEmail,
                textController: controller.emailController,
                label: LocaleKeys.email.tr,
                suffixIcon: Icons.email_outlined,
              ),
            ),
            SizedBox(height: 20.h),

            AuthButtonWidget(
              text: LocaleKeys.check.tr,
              onPressed: controller.checkEmail,
            ),
          ],
        ),
      ),
    );
  }
}
