import 'package:blinkbuy/core/comman/widgets/product_list-shimmer.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/favourite/presentation/view/widgets/fav_product_card_item.dart';
import 'package:blinkbuy/features/favourite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.offWhite,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("My Favourite", style: TextStyles.font22SemiBold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavouriteLoading) {
              return ProductsListShimmer(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              );
            }
            if (state is FavouriteError) {
              return Text(state.error);
            }
            if (state is GetFavouriteSuccess) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: 80.h + MediaQuery.of(context).viewPadding.bottom,
                ),
                child: GridView.builder(
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.products[index];

                    return FavProductCardItem(
                      image: product.images[0],
                      title: product.title,
                      price: product.price,
                      onRemove: () {
                        context.read<FavoriteCubit>().removeFromFavourite(
                          productId: product.id,
                        );
                        context.read<FavoriteCubit>().getFavourites();
                      },
                      onAddToCart: () {},
                    );
                  },
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
