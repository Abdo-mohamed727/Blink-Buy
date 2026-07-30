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
  final Set<int> favouriteIds = {};

  bool isFavourite(int id) => favouriteIds.contains(id);

  Future<void> getFavourites() async {
    final result = await _getFavouritesUseCase();

    switch (result) {
      case Success<List<ProductItemEntity>>():
        favproducts = result.data;

        favouriteIds
          ..clear()
          ..addAll(favproducts.map((e) => e.id));

        emit(GetFavouriteSuccess(favproducts));
        break;

      case Error<List<ProductItemEntity>>():
        emit(FavouriteError(result.messageError, -1));
        break;
    }
  }

  Future<void> addToFavourite({required int productId}) async {
    favouriteIds.add(productId);
    emit(FavouriteUpdated());

    final result = await _addToFavouriteUseCase(productId: productId);

    switch (result) {
      case Success<void>():
        await getFavourites();
        break;

      case Error<void>():
        favouriteIds.remove(productId);
        emit(FavouriteError(result.messageError, productId));
        break;
    }
  }

  Future<void> removeFromFavourite({required int productId}) async {
    favouriteIds.remove(productId);
    emit(FavouriteUpdated());

    final result = await _removeFavouriteUseCase(productId: productId);

    switch (result) {
      case Success<void>():
       

        break;

      case Error<void>():
        favouriteIds.add(productId);
        emit(FavouriteError(result.messageError, productId));
        break;
    }
  }
}
