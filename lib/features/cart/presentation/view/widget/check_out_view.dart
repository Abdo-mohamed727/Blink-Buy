import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 40.w, vertical: 190.0.h),
      child: Container(
          padding:  EdgeInsets.only(
            top: 20.h,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: AppColors.white),
          child: Column(children: [
            Icon(Icons.check_circle, color: AppColors.primaryColor, size: 100),
             SizedBox(height: 10.h),
            Text(
              "Payment Successful",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),),
             SizedBox(height: 20.h),
             Text(
              " Your payment was successful.\n A receipt for this purchase\n has been sent to your email.",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 129, 126, 126),
              ),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 50.h),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),),
          ])),
    );
  }
}
