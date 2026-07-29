import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:blinkbuy/features/cart/presentation/view/widget/cart_item_widget.dart';
import 'package:blinkbuy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DismissibleDelete extends StatelessWidget {
  const DismissibleDelete({super.key, required this.item});

  final CartEntity item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,

      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.outOfStockColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(Icons.delete, color: Colors.white, size: 28.sp),
      ),

      confirmDismiss: (_) async {
        return await showDialog<bool>(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: AppColors.white,
                title: const Text(
                  "Remove Item",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Text(
                  "Are you sure you want to remove this item?",
                  style: TextStyle(fontSize: 16.sp),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(
                      "Delete",
                      style: TextStyle(color: AppColors.errorBorderColor),
                    ),
                  ),
                ],
              ),
            ) ??
            false;
      },

      onDismissed: (_) {
        context.read<CartCubit>().deleteFromCart(item);
      },

      child: CartItemCard(
        item: item,
        onIncrement: () {
          context.read<CartCubit>().incrementQuantity(item);
        },
        onDecrement: () {
          context.read<CartCubit>().decrementQuantity(item);
        },
        onRemove: () {
          context.read<CartCubit>().deleteFromCart(item);
        },
      ),
    );
  }
}
