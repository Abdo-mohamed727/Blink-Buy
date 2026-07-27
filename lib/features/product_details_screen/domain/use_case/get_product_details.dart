
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/product_details_screen/domain/repo/product_details_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductDetails {
  final ProductDetailsRepoInterface _repo;

  GetProductDetails(this._repo);

  Future<ResultApi<ProductItemEntity>> call(int productId) =>
      _repo.getProductDetails(productId);

}