import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CheckoutButton extends StatelessWidget {
  final VoidCallback onPressed;
 
  const CheckoutButton({super.key, required this.onPressed});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 20.h),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.charcoal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.r),
            ),
          ),
          child: Text(
            'Checkout',
            style: TextStyles.font18SemiBold.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}