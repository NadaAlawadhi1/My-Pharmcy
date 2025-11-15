import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/classes/orientation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFieldWidget extends StatefulWidget {
  final String label;
  final bool obscure;
  final IconData? suffixIcon;
  final TextEditingController textController;
  final String? Function(String?)? validator; // <-- added validator param

  const AuthTextFieldWidget({
    super.key,
    required this.label,
    this.obscure = false,
    this.suffixIcon,
    required this.textController,
    this.validator, 
  });

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: OrientationUtils.isPortrait(context) ? 5.h : 10.h,
      ),
      child: Focus(
        child: Builder(
          builder: (context) {
            final hasFocus = Focus.of(context).hasFocus;
            return TextFormField(
              controller: widget.textController,
              obscureText: _obscureText,
              validator: widget.validator, 
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: TextStyle(
                  color: hasFocus ? AppColors.primaryBlue : Colors.grey[600],
                  fontSize: OrientationUtils.isPortrait(context) ? 14.sp : 8.sp,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: OrientationUtils.isPortrait(context)
                      ? 20.w
                      : 10.w,
                  vertical: OrientationUtils.isPortrait(context) ? 10.h : 20.h,
                ),
                enabledBorder: hasFocus
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                          color: AppColors.primaryBlue.withOpacity(0.4),
                          width: 1.3,
                        ),
                      )
                    : const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: OrientationUtils.isPortrait(context)
                      ? BorderRadius.circular(30.r)
                      : BorderRadius.circular(50.r),
                  borderSide: const BorderSide(
                    color: AppColors.primaryBlue,
                    width: 1.5,
                  ),
                ),
                suffixIcon: widget.obscure
                    ? IconButton(
                        onPressed: _toggleObscureText,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: hasFocus
                              ? AppColors.primaryBlue
                              : AppColors.grey,
                          size: OrientationUtils.isPortrait(context)
                              ? 18.sp
                              : 10.sp,
                        ),
                      )
                    : (widget.suffixIcon != null
                          ? Icon(
                              widget.suffixIcon,
                              color: hasFocus
                                  ? AppColors.primaryBlue
                                  : AppColors.grey,
                              size: OrientationUtils.isPortrait(context)
                                  ? 18.sp
                                  : 10.sp,
                            )
                          : null),
              ),
            );
          },
        ),
      ),
    );
  }
}
