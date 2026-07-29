import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:injectable/injectable.dart';

import '../repo/search_repo_interface.dart';

@injectable
class SearchProductsUsecase {
  final SearchRepoInterface _searchRepo;
  SearchProductsUsecase(this._searchRepo);
  Future<ResultApi<List<ProductItemEntity>>> call(String query) {
    return _searchRepo.searchProducts(query);
  }
}