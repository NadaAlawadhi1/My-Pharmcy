import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeaderWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subTitle;
  const AuthHeaderWidget({
    super.key,
    this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        25.w,
        OrientationUtils.isPortrait(context) ? 50.h : 40.h,
        25.w,
        10.h,
      ),
      child: Column(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: AppColors.primaryBlue,
              size: OrientationUtils.isPortrait(context) ? 60.sp : 40.sp,
            ),
            SizedBox(height: 20.h),
          ],
          Text(
            title,
            style: TextStyle(
              fontSize: OrientationUtils.isPortrait(context) ? 20.sp : 13.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: OrientationUtils.isPortrait(context) ? 14.sp : 8.sp,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
