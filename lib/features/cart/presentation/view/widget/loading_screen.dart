import 'package:blinkbuy/core/comman/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemShimmer extends StatelessWidget {
  const CartItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),

      child: Row(
        children: [

           LoadingShimmer(
            width: 80.w,
            height: 90.h,
            borderRadius: 12.r,
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                LoadingShimmer(
                  width: 180.w,
                  height: 16.h,
                  borderRadius: 6.r,
                ),

                SizedBox(height: 12.h),

                LoadingShimmer(
                  width: 80.w,
                  height: 15.h,
                  borderRadius: 6.r,
                ),

                SizedBox(height: 15.h),

                Row(
                  children: [

                    LoadingShimmer(
                      width: 32.w,
                      height: 32.h,
                      borderRadius: 8.r,
                    ),

                    SizedBox(width: 10.w),

                    LoadingShimmer(
                      width: 25.w,
                      height: 18.h,
                      borderRadius: 6.r,
                    ),

                    SizedBox(width: 10.w),

                    LoadingShimmer(
                      width: 32.w,
                      height: 32.h,
                      borderRadius: 8.r,
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}