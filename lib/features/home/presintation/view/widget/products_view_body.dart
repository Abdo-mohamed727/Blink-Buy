import 'package:blinkbuy/core/comman/widgets/product_card.dart';

import 'package:blinkbuy/core/comman/widgets/product_list-shimmer.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/features/home/presintation/view_model/products_cubit/get_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({
    super.key,
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return ProductsListShimmer(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
            );
          }
          if (state is GetProductsError) {
            return Center(child: Text(state.messageError));
          }
          if (state is GetProductsLoaded) {
            return GridView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.productDetailsScreen,
                      arguments: {
                        "productId": state.products[index].id,
                      },
                    );
                  },
                  productItemEntity: state.products[index],
                  imageUrl: state.products[index].images.first,
                  productName: state.products[index].title,
                  price: state.products[index].price,
                  discount: state.products[index].discountPercentage,
                  rating: state.products[index].rating,
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
