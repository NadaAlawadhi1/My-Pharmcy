import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        OrientationUtils.isPortrait(context) ? 25.w : 50.w,
        OrientationUtils.isPortrait(context) ? 10.h : 40.h,
        OrientationUtils.isPortrait(context) ? 25.w : 50.w,
        10.h,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            shape: RoundedRectangleBorder(
              borderRadius: OrientationUtils.isPortrait(context)
                  ? BorderRadius.circular(25.r)
                  : BorderRadius.circular(50.r),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: OrientationUtils.isPortrait(context) ? 16.sp : 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
