import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/products_%20by_%20category/domain/repo/product_data_source_interface.dart';
import 'package:blinkbuy/features/products_%20by_%20category/domain/repo/product_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepoInterface)

class ProductByCatogeryRepoImp implements ProductRepoInterface {
  final ProductDataSourceInterface _dataSource;

  ProductByCatogeryRepoImp(this._dataSource);

  @override
  Future<ResultApi<List<ProductItemEntity>>> getProductsByCategory(String slug) {
    return _dataSource.getProductsByCategory(slug);
  }
}