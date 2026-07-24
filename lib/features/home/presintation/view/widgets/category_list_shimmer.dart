import 'package:blinkbuy/core/comman/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListShimmer extends StatelessWidget {
  const CategoriesListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      separatorBuilder: (context, _) => SizedBox(width: 4.w),
      itemBuilder: (context, index) => const _CategoryShimmerItem(),
    );
  }
}

class _CategoryShimmerItem extends StatelessWidget {
  const _CategoryShimmerItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),

      child: LoadingShimmer(height: 40.h, width: 80.w, borderRadius: 20),
    );
  }
}
