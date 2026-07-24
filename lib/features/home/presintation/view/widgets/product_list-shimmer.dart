import 'package:blinkbuy/core/comman/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsListShimmer extends StatelessWidget {
  const ProductsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) => const _ProductShimmerItem(),
    );
  }
}

class _ProductShimmerItem extends StatelessWidget {
  const _ProductShimmerItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoadingShimmer(height: 20.h, width: 140.w, borderRadius: 8),
                SizedBox(height: 10.h),
                LoadingShimmer(height: 16.h, width: 80.w, borderRadius: 6),
                SizedBox(height: 10.h),
                LoadingShimmer(height: 14.h, width: 180.w, borderRadius: 6),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          LoadingShimmer(height: 130.h, width: 110.w, borderRadius: 20),
        ],
      ),
    );
  }
}
