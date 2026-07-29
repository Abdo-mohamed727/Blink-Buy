import 'dart:developer';

import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';

import 'package:blinkbuy/features/favourite/domain/use_cases/add_to_favourite_use_case.dart';
import 'package:blinkbuy/features/favourite/domain/use_cases/get_favourites_use_case.dart';
import 'package:blinkbuy/features/favourite/domain/use_cases/remove_favourite_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'favorite_state.dart';

@lazySingleton
class FavoriteCubit extends Cubit<FavoriteState> {
  final AddToFavouriteUseCase _addToFavouriteUseCase;
  final RemoveFavouriteUseCase _removeFavouriteUseCase;
  final GetFavouritesUseCase _getFavouritesUseCase;
  FavoriteCubit(
    this._addToFavouriteUseCase,
    this._removeFavouriteUseCase,
    this._getFavouritesUseCase,
  ) : super(FavoriteInitial());
  List<ProductItemEntity> favproducts = [];
  Future<void> addToFavourite({required int productId}) async {
    emit(FavouriteLoading(productId));
    final result = await _addToFavouriteUseCase.call(productId: productId);
    switch (result) {
      case Success<void>():
        await getFavourites();
        break;
      case Error<void>():
        emit(FavouriteError(result.messageError, productId));
        break;
    }
  }

  Future<void> getFavourites() async {
     

    final result = await _getFavouritesUseCase();

    switch (result) {
      case Success<List<ProductItemEntity>>():
        favproducts = result.data;

        emit(GetFavouriteSuccess(favproducts));
        break;

      case Error<List<ProductItemEntity>>():
        emit(FavouriteError(result.messageError, -1));
        break;
    }
  }

  Future<void> removeFromFavourite({required int productId}) async {
    emit(FavouriteLoading(productId));
    final result = await _removeFavouriteUseCase.call(productId: productId);
    switch (result) {
      case Success<void>():
        await getFavourites();
        break;
      case Error<void>():
        emit(FavouriteError(result.messageError, productId));
        break;
    }
  }
}
