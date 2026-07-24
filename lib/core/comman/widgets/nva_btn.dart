import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget navIcon({
  required String path,
  required bool isSelected,
}) {
  return AnimatedScale(
    duration: const Duration(milliseconds: 200),
    scale: isSelected ? 1.2 : 1,
    curve: Curves.easeInOut,
    child: SvgPicture.asset(
      path,
      width: 24.w,
      height: 24.h,
      colorFilter: ColorFilter.mode(
        isSelected ? AppColors.primaryColor : AppColors.charcoal,
        BlendMode.srcIn,
      ),
    ),
  );
 }