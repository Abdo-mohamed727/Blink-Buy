import 'package:blinkbuy/core/comman/widgets/product_list-shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/product_by_category_cubit/product_by_category_cubit.dart';
import '../../view_model/product_by_category_cubit/product_by_category_state.dart';
import 'product_view.dart';

class ProductByCategoryViewBody extends StatelessWidget {


  const ProductByCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
      builder: (context, state) {
        return switch (state) {
              ProductByCategoryLoading() => ProductsListShimmer (
                crossAxisCount: 2,
                childAspectRatio: 163 / 288,
              ),
              ProductByCategoryError() => Center(
                  child: Text(state.errorMessage),
                ),
              ProductByCategoryEmpty() => const Center(
                  child: Text('No products found'),
                ),
              ProductByCategorySuccess() => ProductByCategory(
                  products: state.products,
                ),
              ProductByCategoryInitial() => const SizedBox(),
            };
      },
    );
  }
}