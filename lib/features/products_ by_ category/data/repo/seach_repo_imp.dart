import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/products_%20by_%20category/domain/repo/search_data_source_interface.dart';
import 'package:blinkbuy/features/products_%20by_%20category/domain/repo/search_repo_interface.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SearchRepoInterface)
class SearchRepoImp implements SearchRepoInterface {
  SearchRepoImp(this._dataSource);
     final SearchDataSourceInterface _dataSource;
  @override
  Future<ResultApi<List<ProductItemEntity>>> searchProducts(String query) {
    return _dataSource.searchProducts(query);

  }
}