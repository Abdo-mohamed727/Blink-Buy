import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/cart/presentation/view/widget/dismissible_delete.dart';
import 'package:blinkbuy/features/cart/presentation/view/widget/cart_summary.dart';
import 'package:blinkbuy/features/cart/presentation/view/widget/loading_screen.dart';
import 'package:blinkbuy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: Text("My Cart", style: AppTextStyles.font22SemiBold),
        centerTitle: true,
        toolbarHeight: 40.h,

        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,

        backgroundColor: AppColors.offWhite,
      ),

      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CartItemShimmer());
          }

          if (state is CartError) {
            return Center(child: Text(state.message));
          }

          if (state is CartGetSuccess || state is CartAddSuccess) {
            final items = state is CartGetSuccess
                ? state.items
                : (state as CartAddSuccess).items;

            if (items.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(height: 80.h),
                    SvgPicture.asset(
                      'assets/icons/empty_cart.svg',
                      width: 150.w,
                      height: 150.h,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Your cart is empty",
                      style: AppTextStyles.font18SemiBold.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.charcoal,
                      ),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: DismissibleDelete(item: item),
                      );
                    },
                  ),
                ),
                SizedBox(height: 280.h),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
      bottomSheet: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();

          return SizedBox(
            height: 280.h,
            child: CartSummary(
              shippingFee: cubit.shippingFee,
              subTotal: cubit.subTotal,
              total: cubit.total,
            ),
          );
        },
      ),
    );
  }
}
