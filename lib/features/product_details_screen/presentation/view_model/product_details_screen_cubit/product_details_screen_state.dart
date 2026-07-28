import 'package:blinkbuy/core/model/item/product_item_entity.dart';

sealed class ProductDetailsScreenState {}
class ProductDetailsScreenInitial extends ProductDetailsScreenState {}
class ProductDetailsScreenLoading extends ProductDetailsScreenState {}
class ProductDetailsScreenError extends ProductDetailsScreenState {
  final String errorMessage;
  ProductDetailsScreenError({required this.errorMessage});
}
class ProductDetailsScreenSuccess extends ProductDetailsScreenState {
  final ProductItemEntity product;
  ProductDetailsScreenSuccess({required this.product});
}