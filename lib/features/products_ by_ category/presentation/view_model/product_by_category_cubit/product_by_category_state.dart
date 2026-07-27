import 'package:blinkbuy/core/model/item/product_item_entity.dart';

sealed class ProductByCategoryState {}
final class ProductByCategoryInitial extends ProductByCategoryState {}
final class ProductByCategoryLoading extends ProductByCategoryState {}
final class ProductByCategorySuccess extends ProductByCategoryState {
  final List<ProductItemEntity> products;
  ProductByCategorySuccess({required this.products});
}
final class ProductByCategoryError extends ProductByCategoryState {
  final String errorMessage;
  ProductByCategoryError({required this.errorMessage});
}
final class ProductByCategoryEmpty extends ProductByCategoryState {}