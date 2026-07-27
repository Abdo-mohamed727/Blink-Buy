import 'dart:developer';

import 'package:blinkbuy/core/comman/widgets/app_image_shimmer.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/features/favourite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    required this.discount,
    required this.rating,
  });
  final double rating;
  final ProductItemEntity? productItemEntity;
  final String imageUrl;
  final String productName;
  final double price;
  final double discount;
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
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: ' -${discount.toString()}%',
                          style: TextStyle(
                            color: AppColors.discountColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
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
          Text(
            '$rating⭐',
            style: TextStyle(
              color: AppColors.primaryColorBlack,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),

          BlocConsumer<FavoriteCubit, FavoriteState>(
            listener: (context, state) {
              if (state is FavouriteSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Operation completed successfully'),
                  ),
                );
              }
              if (state is FavouriteError &&
                  state.productId == productItemEntity?.id) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              final favoriteCubit = context.read<FavoriteCubit>();
              print("UI Cubit: ${favoriteCubit.hashCode}");

              final isFavorite = favoriteCubit.favproducts.any(
                (e) => e.id == productItemEntity?.id,
              );
              final isLoading =
                  state is FavouriteLoading &&
                  state.productId == productItemEntity?.id;

              return GestureDetector(
                onTap: isLoading
                    ? null
                    : () {
                        if (productItemEntity == null) return;
                        print("isFavorite = $isFavorite");
                        if (isFavorite) {
                          print("Before remove");
                          context.read<FavoriteCubit>().removeFromFavourite(
                            productId: productItemEntity!.id,
                          );
                          print("After remove");
                        } else {
                          context.read<FavoriteCubit>().addToFavourite(
                            productId: productItemEntity!.id,
                          );
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 30,
                        color: isFavorite
                            ? AppColors.errorBorderColor
                            : AppColors.primaryColorBlack.withValues(
                                alpha: 0.6,
                              ),
                      ),
              );
            },
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
