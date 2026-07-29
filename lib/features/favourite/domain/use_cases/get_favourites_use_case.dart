import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:injectable/injectable.dart';

import '../repo/favourite_repo_interface.dart';

@injectable
class GetFavouritesUseCase {
  final FavouriteRepoInterface _repo;
  GetFavouritesUseCase(this._repo);
  Future<ResultApi<List<ProductItemEntity>>> call() async {
    return await _repo.getFavourite();
  }
}