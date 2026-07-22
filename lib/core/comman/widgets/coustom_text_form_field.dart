import 'package:blinkbuy/core/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    this.filled = false,
    this.obscureText = false,
    this.readOnly = false,
    super.key,
    this.validator,
    this.fillColour,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
    this.prefixIcon,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
  });

  final String? Function(String?)? validator;
  final String? Function(String)? onChanged;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColour;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.disabledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.defaultBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.errorBorderColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.errorBorderColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        filled: filled,
        fillColor: fillColour,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
        errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.errorBorderColor,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
