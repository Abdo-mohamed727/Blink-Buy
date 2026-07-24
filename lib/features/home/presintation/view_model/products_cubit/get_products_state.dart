part of 'get_products_cubit.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsError extends GetProductsState {
  final String messageError;
  GetProductsError(this.messageError);
}

final class GetProductsLoaded extends GetProductsState {
  final List<ProductItemEntity> products;
  GetProductsLoaded(this.products);
}
