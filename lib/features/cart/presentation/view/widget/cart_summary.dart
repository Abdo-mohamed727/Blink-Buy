import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/features/cart/presentation/view/widget/buttom_check.dart';
import 'package:blinkbuy/features/cart/presentation/view/widget/check_out_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

class CartSummary extends StatelessWidget {
  final double shippingFee;
  final double subTotal;
  final double total;

  const CartSummary({
    super.key,
    required this.shippingFee,
    required this.subTotal,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.charcoal.withOpacity(0.1),
            blurRadius: 6.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 16.0.h),
        child: Column(
          children: [
            _SummaryRow(label: 'Shipping fee', value: shippingFee),
            SizedBox(height: 8.h),
            _SummaryRow(label: 'Sub total', value: subTotal),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Divider(thickness: 1),
            ),
            _SummaryRow(label: 'Total', value: total, isBold: true),
            CheckoutButton(onPressed: () {
              showDialog(
                        context: context,
                        builder: (_) {
                          return SuccessDialog();
                        });
            }),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isBold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: Colors.black87,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
            children: [
              const TextSpan(text: 'EGP '),
              TextSpan(
                text: value.toStringAsFixed(0),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isBold ? 18.sp : 16.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
