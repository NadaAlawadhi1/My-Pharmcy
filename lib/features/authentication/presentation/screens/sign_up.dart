import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:e_commerce/core/classes/input_validation.dart';
import 'package:e_commerce/core/functions/show_loader.dart';
import 'package:e_commerce/core/services/network/request_status.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/google_auth_controller.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/sign_up_controller.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/button.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/header.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/google_button.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpControllerImpl> {
  const SignUpScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      AuthHeaderWidget(
                        icon: FontAwesomeIcons.staffSnake,
                        title: LocaleKeys.signUpTitle.tr,
                        subTitle: LocaleKeys.signUpSubtitle.tr,
                      ),
                      SizedBox(height: 20.h),

                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            AuthTextFieldWidget(
                              validator: (v) {
                                final basic = InputValidation.validateEmail(v);
                                if (basic != null) return basic;
                                if (controller.emailError.value.isNotEmpty)
                                  return controller.emailError.value;
                                return null;
                              },
                              textController: controller.emailController,
                              label: LocaleKeys.email.tr,
                              suffixIcon: Icons.email_outlined,
                            ),

                            Obx(
                              () => controller.emailError.value.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: 6.0,
                                        left: 12.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          controller.emailError.value,
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            AuthTextFieldWidget(
                              validator: InputValidation.validateUsername,

                              textController: controller.usernameController,
                              label: LocaleKeys.username.tr,
                              suffixIcon: Icons.person_outline,
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
                      SizedBox(height: 10.h),

                      AuthButtonWidget(
                        text: LocaleKeys.signUp.tr,
                        onPressed: controller.signUp,
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
                          LocaleKeys.alreadyHaveAccount.tr,
                          style: TextStyle(
                            fontSize: OrientationUtils.isPortrait(context)
                                ? 14.sp
                                : 10.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: controller.goToSignIn,
                          child: Text(
                            LocaleKeys.signIn.tr,
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
