import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:blinkbuy/features/cart/domain/repo/cart_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase {
  final CartRepoInterface cartRepoInterface;
  GetCartUseCase(this.cartRepoInterface);
  Future<ResultApi<List<CartEntity>>> call() async {
    return await cartRepoInterface.getCartItems();
  }
}
