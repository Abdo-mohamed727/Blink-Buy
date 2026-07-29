import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18.r),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  topRight: Radius.circular(18.r),
                ),

                child: SizedBox(
                  height: 150.h,
                  width: double.infinity,

                  child: CachedNetworkImage(
                    imageUrl: image,

                    fit: BoxFit.cover,

                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),

                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),

              /// Favorite Button
              Positioned(
                top: 8.h,
                right: 8.w,

                child: InkWell(
                  onTap: onRemove,

                  child: Container(
                    padding: EdgeInsets.all(8.w),

                    child: const Icon(
                      Icons.favorite,

                      color: Colors.red,

                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 8.h),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// Title
                Text(
                  title,

                  maxLines: 2,

                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontSize: 14.sp,

                    fontWeight: FontWeight.w600,

                    color: AppColors.charcoal,
                  ),
                ),

                /// Price
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "EGP ",

                        style: TextStyle(
                          fontSize: 13.sp,

                          fontWeight: FontWeight.bold,

                          color: AppColors.primaryColor,
                        ),
                      ),

                      TextSpan(
                        text: price.toStringAsFixed(2),

                        style: TextStyle(
                          fontSize: 16.sp,

                          fontWeight: FontWeight.bold,

                          color: AppColors.charcoal,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Add Cart Button
                SizedBox(
                  width: double.infinity,

                  height: 40.h,

                  child: ElevatedButton(
                    onPressed: onAddToCart,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),

                      elevation: 0,
                    ),

                    child: Text(
                      "Add To Cart",

                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 13.sp,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
