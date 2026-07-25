import 'package:blinkbuy/core/comman/widgets/product_item_card.dart';
import 'package:blinkbuy/core/di/service_locator.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/products_ by_ category/presentation/view_model/product_by_category_cubit/product_by_category_cubit.dart';
import 'package:blinkbuy/features/products_ by_ category/presentation/view_model/product_by_category_cubit/product_by_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductByCategoryScreen extends StatelessWidget {
  const ProductByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

final slug = args['slug'] as String;
final categoryName = args['category'] as String;

    return BlocProvider(
        create: (_) => serviceLocator <ProductByCategoryCubit>()
    ..getProductsByCategory(slug),
  child: BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                categoryName,
                style: TextStyles.font22SemiBold,
              ),
            ),
            body: switch (state) {
              ProductByCategoryLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              ProductByCategoryError() => Center(
                  child: Text(state.errorMessage),
                ),
              ProductByCategoryEmpty() => const Center(
                  child: Text('No products found'),
                ),
              ProductByCategorySuccess() => GridView.builder(
                  padding: EdgeInsets.fromLTRB(
                    15.w,
                    29.h,
                    18.w,
                    65.h,
                  ),
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 163 / 288,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductItemWidget(
                      imageUrl: product.images.isNotEmpty ? product.images.first : '',
                      price: product.price,
                      productName: product.title,
                      onFavoriteToggle: (isFavorite) {},
                      onTap: () {},
                      currency: "EGP",
                      productItemEntity: product,
                    );
                  },
                ),
              ProductByCategoryInitial() => const SizedBox(),
            },
          );
        },
      ),
    );
  }
}