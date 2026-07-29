import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavProductCardItem extends StatelessWidget {
  const FavProductCardItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.onRemove,
    required this.onAddToCart,
  });
  final String image;
  final String title;
  final double price;
  final VoidCallback onRemove;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.charcoal.withValues(alpha: 0.1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 10.w,
              child: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: onRemove,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'EGP ',
                      style: TextStyle(
                        color: AppColors.charcoal,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextSpan(
                      text: price.toString(),
                      style: TextStyle(
                        color: AppColors.charcoal,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.h),
              CustomButton(
                backgroundColor: AppColors.orangeLight,
                height: 40.h,
                width: 102.w,
                text: "Add to Cart",
                onPressed: onAddToCart,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
