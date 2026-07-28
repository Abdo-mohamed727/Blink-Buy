part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavouriteLoading extends FavoriteState {
  final int productId;
  FavouriteLoading(this.productId);
}

final class FavouriteSuccess extends FavoriteState {
   final int productId;
   FavouriteSuccess(this.productId);
}

final class FavouriteError extends FavoriteState {
  final String error;
  final int productId;
  FavouriteError(this.error, this.productId);
}

final class GetFavouriteSuccess extends FavoriteState {
  final List<ProductItemEntity> products;
  GetFavouriteSuccess(this.products);
}

final class GetFavouriteError extends FavoriteState {
  final String error;
  GetFavouriteError(this.error);
}
