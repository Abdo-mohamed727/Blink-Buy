import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:blinkbuy/features/cart/presentation/view/widget/quantity_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  final CartEntity item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.images.isNotEmpty
                  ? item.images
                  : 'https://placehold.co/80x90',
              width: 80,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 90,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
           SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style:  AppTextStyles.font16SemiBold.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onRemove,
                      child: const Icon(Icons.close, size: 20),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(
                    style:  AppTextStyles.font16Regular.copyWith(color: Colors.black87),
                    children: [
                      const TextSpan(text: 'EGP '),
                      TextSpan(
                        text: item.price.toStringAsFixed(0),
                        style:  AppTextStyles.font16SemiBold.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
               SizedBox(height: 10.h),
                QuantityStepper(
                  quantity: item.quantity,
                  onIncrement: onIncrement,
                  onDecrement: onDecrement,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
