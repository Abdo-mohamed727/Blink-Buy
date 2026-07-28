import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    this.currency = 'EGP',
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
    required this.productItemEntity,
  });

  final ProductItemEntity? productItemEntity;
  final String imageUrl;
  final String productName;
  final double price;
  final String currency;
  final bool isFavorite;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onFavoriteToggle;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onFavoriteToggle?.call(_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
            
              color: AppColors.cardBackground,

              border: Border.all(color: AppColors.white, width: 0.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  children: [
                    Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.lightGrey,
                        child: const Icon(Icons.image_not_supported_outlined),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: _toggleFavorite,
                        child: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 30,
                          color: _isFavorite
                              ? AppColors.errorBorderColor
                              : AppColors.primaryColorBlack.withValues(
                                  alpha: 0.6,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName,
                  style: TextStyles.font14Regular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.currency} ',
                        style: TextStyles.font14Regular,
                      ),
                      TextSpan(
                        text: widget.price.toStringAsFixed(0),
                        style: TextStyles.font14SemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
