import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePopup extends StatelessWidget {
  const LanguagePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, 
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            height: 48.h, 
            width: 170.w,
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border.all(
                color: AppColors.primaryBlue.withOpacity(0.15),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                _languageOption(
                  context,
                  title: 'English',
                  value: 'en',
                  bg: AppColors.primaryBlue,
                  textColor: Colors.white,
                  isLeft: true,
                ),
                Container(width: 1.w, color: Colors.white),
                _languageOption(
                  context,
                  title: 'العربية',
                  value: 'ar',
                  bg: Colors.white,
                  textColor: AppColors.primaryBlue,
                  isLeft: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _languageOption(
    BuildContext context, {
    required String title,
    required String value,
    required Color bg,
    required Color textColor,
    required bool isLeft,
  }) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.horizontal(
          left: isLeft ? Radius.circular(30.r) : Radius.zero,
          right: !isLeft ? Radius.circular(30.r) : Radius.zero,
        ),
        onTap: () => Navigator.of(context).pop(value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.horizontal(
              left: isLeft ? Radius.circular(30.r) : Radius.zero,
              right: !isLeft ? Radius.circular(30.r) : Radius.zero,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
