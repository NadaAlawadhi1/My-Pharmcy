import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:e_commerce/core/classes/input_validation.dart';
import 'package:e_commerce/core/functions/show_loader.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/google_auth_controller.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/sign_in_controller.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/button.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/header.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/google_button.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/services/network/request_status.dart';

class SignInScreen extends GetView<SignInControllerImpl> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Obx(() {
          if (controller.status.value == RequestStatus.loading) {
            return buildLoader();
          }

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AuthHeaderWidget(
                        icon: FontAwesomeIcons.staffSnake,
                        title: LocaleKeys.signInTitle.tr,
                        subTitle: LocaleKeys.signInSubtitle.tr,
                      ),
                      SizedBox(height: 20.h),

                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            AuthTextFieldWidget(
                              validator: InputValidation.validateEmail,
                              textController: controller.emailController,
                              label: LocaleKeys.email.tr,
                              suffixIcon: Icons.email_outlined,
                            ),
                            AuthTextFieldWidget(
                              validator: InputValidation.validatePassword,
                              textController: controller.passwordController,
                              label: LocaleKeys.password.tr,
                              obscure: true,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 6.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Checkbox(
                                      value: controller.rememberMe.value,
                                      onChanged: (_) =>
                                          controller.toggleRememberMe(),
                                      activeColor: AppColors.primaryBlue,
                                    ),
                                  ),
                                  Text(
                                    LocaleKeys.rememberMe.tr,
                                    style: TextStyle(
                                      fontSize:
                                          OrientationUtils.isPortrait(context)
                                          ? 13.sp
                                          : 9.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: controller.goToPasswordRecovery,
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                              ),
                              child: Text(
                                LocaleKeys.forgotPassword.tr,
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontSize: OrientationUtils.isPortrait(context)
                                      ? 13.sp
                                      : 9.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h),
                      AuthButtonWidget(
                        text: LocaleKeys.signIn.tr,
                        onPressed: controller.signIn,
                      ),

                      SizedBox(height: 30.h),

                      Center(
                        child: GoogleButton(
                          onTap: () {
                            Get.find<GoogleAuthController>().signInWithGoogle();
                          },
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.dontHaveAccount.tr,
                          style: TextStyle(
                            fontSize: OrientationUtils.isPortrait(context)
                                ? 14.sp
                                : 10.sp,
                            color: AppColors.grey,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: controller.goToSignUp,
                          child: Text(
                            LocaleKeys.signUp.tr,
                            style: TextStyle(
                              fontSize: OrientationUtils.isPortrait(context)
                                  ? 14.sp
                                  : 10.sp,
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
