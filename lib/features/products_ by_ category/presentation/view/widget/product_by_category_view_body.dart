import 'package:blinkbuy/core/comman/widgets/product_card.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductByCategoryViewBody extends StatelessWidget {
  const ProductByCategoryViewBody({
    super.key,
    required this.products,
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  final List<ProductItemEntity> products;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.productDetailsScreen,
              arguments: {
                'productId': products[index].id,
              },
            );
          },
          child: ProductCard(
            productItemEntity: products[index],
            imageUrl: products[index].images.first,
            productName: products[index].title,
            price: products[index].price,
            discount: products[index].discountPercentage,
            rating: products[index].rating,
          ),
        );
      },
    );
  }
}