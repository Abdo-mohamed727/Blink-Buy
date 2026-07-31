import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/di/service_locator.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:blinkbuy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:blinkbuy/features/favourite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:blinkbuy/features/product_details_screen/presentation/view/widget/screen_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../view_model/product_details_screen_cubit/product_details_screen_cubit.dart';
import '../../view_model/product_details_screen_cubit/product_details_screen_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productItemEntity});
  final ProductItemEntity productItemEntity;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final productId = args['productId'] as int;
    return BlocProvider(
      create: (_) =>
          serviceLocator<ProductDetailsScreenCubit>()
            ..getProductDetails(productId),

      child: BlocListener<CartCubit, CartState>(
        listener: (context, cartState) {
          if (cartState is CartAddSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Added to cart")));
          }

          if (cartState is CartError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(cartState.message)));
          }
        },
        child: BlocBuilder<ProductDetailsScreenCubit, ProductDetailsScreenState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.offWhite,

              appBar: AppBar(
                backgroundColor: AppColors.offWhite,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 32),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: switch (state) {
                ProductDetailsScreenLoading() => const ScreenLoading(),
                ProductDetailsScreenError() => Center(
                  child: Text(state.errorMessage),
                ),
                ProductDetailsScreenSuccess() => SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 8.h,
                              left: 16.w,
                              right: 16.w,
                              bottom: 24.h,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGrey.withValues(
                                    alpha: 0.9,
                                  ),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(0, 10),
                                ),
                              ],

                              borderRadius: BorderRadius.circular(24),
                              color: AppColors.cardBackground,
                            ),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                disableCenter: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: state.product.images.length > 1,
                                height: 331.h,
                                viewportFraction: 1,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration: const Duration(
                                  milliseconds: 800,
                                ),
                                enlargeCenterPage: false,
                                enableInfiniteScroll: true,
                              ),
                              items: state.product.images.map((image) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.network(
                                    image,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Positioned(
                            top: 10.h,
                            right: 20.w,
                            child: BlocBuilder<FavoriteCubit, FavoriteState>(
                              builder: (context, favState) {
                                final favoriteCubit = context
                                    .read<FavoriteCubit>();

                                final isFavorite = favoriteCubit.favproducts
                                    .any(
                                      (e) =>
                                          e.id == widget.productItemEntity.id,
                                    );
                                final isLoading =
                                    state is FavouriteLoading &&
                                    state.product.id ==
                                        widget.productItemEntity.id;

                                return GestureDetector(
                                  onTap: isLoading
                                      ? null
                                      : () {
                                          if (isFavorite) {
                                            context
                                                .read<FavoriteCubit>()
                                                .removeFromFavourite(
                                                  productId: widget
                                                      .productItemEntity
                                                      .id,
                                                );
                                          } else {
                                            context
                                                .read<FavoriteCubit>()
                                                .addToFavourite(
                                                  productId: widget
                                                      .productItemEntity
                                                      .id,
                                                );
                                          }
                                        },
                                  child: isLoading
                                      ? const SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : Icon(
                                          isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 30,
                                          color: isFavorite
                                              ? AppColors.errorBorderColor
                                              : AppColors.primaryColorBlack
                                                    .withValues(alpha: 0.6),
                                        ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 15.h,
                            left: 20.w,
                            child: Row(
                              children: [
                                Text(
                                  state.product.rating.toStringAsFixed(2),
                                  style: AppTextStyles.font16SemiBold,
                                ),
                                SizedBox(width: 5.w),
                                Text('⭐', style: AppTextStyles.font16SemiBold),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AnimatedSmoothIndicator(
                        axisDirection: Axis.horizontal,
                        onEnd: () {},
                        textDirection: TextDirection.ltr,
                        activeIndex: currentIndex,
                        count: state.product.images.length,
                        effect: WormEffect(
                          type: WormType.normal,
                          dotHeight: 10.h,
                          dotWidth: 10.w,
                          activeDotColor: AppColors.primaryColor,
                          dotColor: AppColors.lightGrey,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Text(
                                state.product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.font16Regular,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: Column(
                              children: [
                                Text(
                                  'EGP ${state.product.price.toStringAsFixed(2)}',
                                  style: AppTextStyles.font16SemiBold,
                                ),
                                Text(
                                  ' -${state.product.discountPercentage.toStringAsFixed(2)} % ',
                                  style: AppTextStyles.font14SemiBold.copyWith(
                                    color: AppColors.errorBorderColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          top: 32.h,
                          bottom: 40.h,
                        ),
                        child: Text(
                          state.product.description,
                          style: AppTextStyles.font14SemiBold,
                          textAlign: TextAlign.start,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          context.read<CartCubit>().addToCart(
                            CartEntity(
                              id: state.product.id,

                              title: state.product.title,

                              price: state.product.price,

                              images: state.product.images.isNotEmpty
                                  ? state.product.images.first
                                  : '',

                              quantity: 1,
                            ),
                          );
                        },

                        backgroundColor: AppColors.primaryColorBlack,

                        text: "Add to Cart",

                        height: 48.h,

                        width: 343.w,
                      ),
                    ],
                  ),
                ),
                ProductDetailsScreenInitial() => const SizedBox(),
              },
            );
          },
        ),
      ),
    );
  }
}
