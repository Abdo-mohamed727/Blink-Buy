import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';

abstract interface class GetProductsRepoInterface {
  Future<ResultApi<List<ProductItemEntity>>> getProducts();
}