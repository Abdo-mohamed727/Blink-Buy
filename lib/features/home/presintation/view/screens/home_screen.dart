import 'package:blinkbuy/core/comman/widgets/loading_shimmer.dart';
import 'package:blinkbuy/core/comman/widgets/product_item_card.dart';

import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/home/presintation/view/widgets/product_list-shimmer.dart';
import 'package:blinkbuy/features/home/presintation/view_model/cubit/get_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = [
    'Miscellaneous',
    'Shoes',
    'Furniture',
    'Electronics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final crossAxisCount = screenWidth >= 900
                ? 4
                : screenWidth >= 600
                ? 3
                : 2;
            final childAspectRatio = screenWidth >= 900
                ? 0.82
                : screenWidth >= 600
                ? 0.78
                : 0.72;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi !,',
                        style: TextStyles.font16Regular.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColorBlack,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Let's start your day",
                        style: TextStyles.font18SemiBold.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColorBlack,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: _categories.length,
                    separatorBuilder: (context, _) => SizedBox(width: 10.w),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => setState(() {}),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColorBlack,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            _categories[index],
                            style: TextStyles.font14Regular.copyWith(
                              color: AppColors.primaryColorBlack,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),

                Expanded(
                  child: BlocBuilder<GetProductsCubit, GetProductsState>(
                    builder: (context, state) {
                      if (state is GetProductsLoading) {
                        return ProductsListShimmer();
                      }
                      if (state is GetProductsError) {
                        return Center(child: Text(state.messageError));
                      }
                      if (state is GetProductsLoaded) {
                        return GridView.builder(
                          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
                          itemCount: state.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 20.h,
                                childAspectRatio: childAspectRatio,
                              ),
                          itemBuilder: (context, index) {
                            return ProductItemWidget(
                              imageUrl: state.products[index].images.first,
                              price: state.products[index].price,
                              productName: state.products[index].title,
                              onFavoriteToggle: (isFavorite) {},
                              onTap: () {},

                              isFavorite: true,
                              productItemEntity: state.products[index],
                            );
                          },
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
