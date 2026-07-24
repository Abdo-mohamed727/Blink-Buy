import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/home/data/data_source/get_products_data_source_interface.dart';
import 'package:blinkbuy/features/home/domain/repo/get_products_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductsRepoInterface)
class GetProductsRepoImp implements GetProductsRepoInterface {
  final GetProductsDataSourceInterface getProductsDataSource;
  GetProductsRepoImp(this.getProductsDataSource);
  @override
  Future<ResultApi<List<ProductItemEntity>>> getProducts() async {
    return await getProductsDataSource.getProducts();
  }
}
