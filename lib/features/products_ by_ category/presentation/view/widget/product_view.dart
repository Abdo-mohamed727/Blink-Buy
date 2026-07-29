import 'package:blinkbuy/core/comman/widgets/product_card.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductByCategory extends StatelessWidget {
  const ProductByCategory({
    super.key,
    required this.products,

  });

  final List<ProductItemEntity> products;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 163 / 288,
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