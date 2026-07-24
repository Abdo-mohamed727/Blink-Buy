import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/home/domain/repo/get_products_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  final GetProductsRepoInterface getProductsRepo;
  GetProductsUseCase(this.getProductsRepo);
  Future<ResultApi<List<ProductItemEntity>>> call() async {
    return await getProductsRepo.getProducts();
  }
}
