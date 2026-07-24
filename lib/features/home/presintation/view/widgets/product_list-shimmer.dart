import 'package:blinkbuy/core/comman/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsListShimmer extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const ProductsListShimmer({
    super.key,
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 6.h,
        childAspectRatio: childAspectRatio,
      ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: LoadingShimmer(
            width: double.infinity,
            borderRadius: 12,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingShimmer(height: 14.h, width: double.infinity, borderRadius: 4),
              SizedBox(height: 8.h),
              LoadingShimmer(height: 14.h, width: 80.w, borderRadius: 4),
            ],
          ),
        ),
      ],
    );
  }
}
