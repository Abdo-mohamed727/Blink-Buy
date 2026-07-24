import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/products_%20by_%20category/domain/repo/product_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByCategoryUseCase {
  final ProductRepoInterface _productRepoInterface;

  GetProductsByCategoryUseCase(this._productRepoInterface);

  Future<ResultApi<List<ProductItemEntity>>> invoke( String slug, ) => _productRepoInterface.getProductsByCategory(slug);
}