import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';

abstract class FavouriteRepoInterface {
  Future<ResultApi<void>> addToFavourite({required int productId});
  Future<ResultApi<void>> removeFromFavourite({required int productId});
  Future<ResultApi<List<ProductItemEntity>>> getFavourite();
}

