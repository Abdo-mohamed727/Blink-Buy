// import 'package:blinkbuy/core/model/item/product_item_entity.dart';
// import 'package:blinkbuy/core/theme/app_colors.dart';
// import 'package:blinkbuy/core/theme/styels.dart';
// import 'package:blinkbuy/features/favourite/presentation/view_model/cubit/favorite_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ProductItemWidget extends StatelessWidget {
//   const ProductItemWidget({
//     super.key,
//     required this.imageUrl,
//     required this.productName,
//     required this.price,
//     this.currency = 'EGP',
//     this.onTap,
//     required this.productItemEntity,
//   });

//   final ProductItemEntity? productItemEntity;
//   final String imageUrl;
//   final String productName;
//   final double price;
//   final String currency;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: AppColors.cardBackground,
//               border: Border.all(color: AppColors.white, width: 0.5),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12.r),
//               child: AspectRatio(
//                 aspectRatio: 1,
//                 child: Stack(
//                   children: [
//                     Image.network(
//                       imageUrl,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                       errorBuilder: (context, error, stackTrace) => Container(
//                         color: AppColors.lightGrey,
//                         child: const Icon(Icons.image_not_supported_outlined),
//                       ),
//                     ),
//                     Positioned(
//                       top: 10,
//                       right: 10,
//                       child: BlocConsumer<FavoriteCubit, FavoriteState>(
//                         listener: (context, state) {
//                           if (state is FavouriteSuccess) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Operation completed successfully'),
//                               ),
//                             );
//                           }
//                           if (state is FavouriteError &&
//                               state.productId == productItemEntity?.id) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text(state.error)),
//                             );
//                           }
//                         },
//                         builder: (context, state) {
//                           final favoriteCubit = context.read<FavoriteCubit>();
//                           final isFavorite = favoriteCubit.favproducts.any(
//                             (e) => e.id == productItemEntity?.id,
//                           );
//                           final isLoading = state is FavouriteLoading &&
//                               state.productId == productItemEntity?.id;

//                           return GestureDetector(
//                             onTap: isLoading
//                                 ? null
//                                 : () {
//                                     if (productItemEntity == null) return;
//                                     if (isFavorite) {
//                                       context.read<FavoriteCubit>().removeFromFavourite(
//                                             productId: productItemEntity!.id,
//                                           );
//                                     } else {
//                                       context.read<FavoriteCubit>().addToFavourite(
//                                             productId: productItemEntity!.id,
//                                           );
//                                     }
//                                   },
//                             child: isLoading
//                                 ? const SizedBox(
//                                     width: 30,
//                                     height: 30,
//                                     child: CircularProgressIndicator(strokeWidth: 2),
//                                   )
//                                 : Icon(
//                                     isFavorite ? Icons.favorite : Icons.favorite_border,
//                                     size: 30,
//                                     color: isFavorite
//                                         ? AppColors.errorBorderColor
//                                         : AppColors.primaryColorBlack.withValues(
//                                             alpha: 0.6,
//                                           ),
//                                   ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   productName,
//                   style: TextStyles.font14Regular,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: '$currency ',
//                         style: TextStyles.font14Regular,
//                       ),
//                       TextSpan(
//                         text: price.toStringAsFixed(0),
//                         style: TextStyles.font14SemiBold,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
