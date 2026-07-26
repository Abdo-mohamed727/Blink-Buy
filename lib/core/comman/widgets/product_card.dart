import 'package:blinkbuy/core/comman/widgets/app_image_shimmer.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productItemEntity,
    required this.imageUrl,
    required this.productName,
    required this.price,
    this.currency = 'EGP',
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
  });
  final ProductItemEntity? productItemEntity;
  final String imageUrl;
  final String productName;
  final double price;
  final String currency;
  final bool isFavorite;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withValues(alpha: 0.9),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(16.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActionRow(),
            Expanded(child: _buildImage()),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    productItemEntity?.category ?? '',
                    style: TextStyle(fontSize: 11.sp, fontFamily: 'Poppins'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: currency,
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
                  // Text(
                  //   price.toString(),
                  //   style: TextStyle(
                  //     color: AppColors.charcoal,
                  //     fontSize: 14.sp,
                  //     fontWeight: FontWeight.w700,
                  //     fontFamily: 'Poppins',
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                key: ValueKey(isFavorite),
                size: 20.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl.startsWith('assets/')) {
      return SizedBox.expand(
        child: Container(
          color: Colors.black,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const AppImageShimmer(),
          ),
        ),
      );
    }

    return SizedBox.expand(
      child: imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => const AppImageShimmer(),
              errorWidget: (_, __, ___) => const AppImageShimmer(),
            )
          : const AppImageShimmer(),
    );
  }
}
