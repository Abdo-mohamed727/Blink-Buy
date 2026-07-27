import 'package:blinkbuy/core/comman/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenLoading  extends StatelessWidget {
  const ScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
  child: Column(
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: 8.h,
          left: 16.w,
          right: 16.w,
          bottom: 24.h,
        ),
        child: const LoadingShimmer(
          height: 331,
          width: double.infinity,
        ),
      ),

      const LoadingShimmer(
        height: 10,
        width: 80,
      ),

      SizedBox(height: 24.h),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            const Expanded(
              child: LoadingShimmer(
                height: 20,
                width: double.infinity,
              ),
            ),
            SizedBox(width: 12),
            const LoadingShimmer(
              height: 40,
              width: 70,
            ),
          ],
        ),
      ),

      SizedBox(height: 32.h),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: const LoadingShimmer(
                height: 16,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ),

      SizedBox(height: 40.h),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const LoadingShimmer(
          height: 48,
          width: double.infinity,
        ),
      ),
    ],
  ),
),
    );
  }
}