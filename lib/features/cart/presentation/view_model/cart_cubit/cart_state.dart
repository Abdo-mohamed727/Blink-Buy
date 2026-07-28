part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartGetSuccess extends CartState {
  final List<CartEntity> items;

  CartGetSuccess(this.items);
}

final class CartAddSuccess extends CartState {
  final List<CartEntity> items;

  CartAddSuccess(this.items);
}

final class CartDeleteSuccess extends CartState {
  final List<CartEntity> items;

  CartDeleteSuccess(this.items);
}

final class CartError extends CartState {
  final String message;

  CartError(this.message);
}