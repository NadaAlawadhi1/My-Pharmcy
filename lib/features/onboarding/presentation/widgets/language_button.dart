import 'package:e_commerce/core/localization/localization_controller.dart';
import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/features/onboarding/presentation/widgets/language_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingLanguageButtonWidget extends StatelessWidget {
  const OnboardingLanguageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LocalizationController>();

    return PositionedDirectional(
      top: 16.h,
      end: 16.w,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: () async {
          final selected = await showDialog<String>(
            context: context,
            builder: (_) => Center(child: LanguagePopup()),
          );

          if (selected != null) {
            controller.changeLanguage(selected);
          }
        },
        child: Container(
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.grey.withOpacity(0.18)),
          ),
          child: Icon(Icons.language, size: 20.r, color: AppColors.primaryBlue),
        ),
      ),
    );
  }
}
