import 'package:blinkbuy/core/comman/widgets/product_list-shimmer.dart';
import 'package:blinkbuy/core/di/service_locator.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view/widget/product_by_category_view_body.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view_model/product_by_category_cubit/product_by_category_cubit.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view_model/product_by_category_cubit/product_by_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductByCategoryScreen extends StatelessWidget {
  const ProductByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final slug = args['slug'] as String;
    final categoryName = args['category'] as String;

    return BlocProvider(
      create: (_) =>
          serviceLocator<ProductByCategoryCubit>()
            ..getProductsByCategory(slug, categoryName),
      child: BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(categoryName, style: AppTextStyles.font22SemiBold),
            ),
            body: switch (state) {
              ProductByCategoryLoading() => const Center(
                child: ProductsListShimmer(
                  crossAxisCount: 2,
                  childAspectRatio: 163 / 288,
                ),
              ),
              ProductByCategoryError() => Center(
                child: Text(state.errorMessage),
              ),
              ProductByCategoryEmpty() => const Center(
                child: Text('No products found'),
              ),
              ProductByCategorySuccess() => ProductByCategoryViewBody(
                products: state.products,
                crossAxisCount: 2,
                childAspectRatio: 163 / 288,
              ),
              ProductByCategoryInitial() => const SizedBox(),
            },
          );
        },
      ),
    );
  }
}
