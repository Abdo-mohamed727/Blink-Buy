import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/favourite/data/data_source/favourite_data_source_interface.dart';
import 'package:blinkbuy/features/favourite/domain/repo/favourite_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavouriteRepoInterface)
class FavouriteRepoImp implements FavouriteRepoInterface {
  final FavouriteDataSourceInterface _dataSource;
  FavouriteRepoImp(this._dataSource);
  @override
  Future<ResultApi<void>> addToFavourite({required int productId}) {
    return _dataSource.addToFavourite(productId: productId);
  }

  @override
  Future<ResultApi<List<ProductItemEntity>>> getFavourite() {
    return _dataSource.getFavourite();
  }

  @override
  Future<ResultApi<void>> removeFromFavourite({required int productId}) {
    return _dataSource.removeFromFavourite(productId: productId);
  }
}