import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback? onTap;

  const GoogleButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                LocaleKeys.orContinueWith.tr,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: OrientationUtils.isPortrait(context)
                      ? 13.sp
                      : 10.sp,
                ),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
          ],
        ),
        SizedBox(height: 25.h),

        InkWell(
          onTap: onTap,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.google,
                color: AppColors.primaryBlue,
                size: OrientationUtils.isPortrait(context) ? 18.sp : 10.sp,
              ),
              SizedBox(width: 10.w),
              Text(
                LocaleKeys.continueWithGoogle.tr,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: OrientationUtils.isPortrait(context)
                      ? 13.sp
                      : 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
