import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/cart/domain/repo/cart_repo_interface.dart';
import 'package:injectable/injectable.dart';
@injectable
class DeleteCartUseCase {
  final CartRepoInterface cartRepoInterface;

  DeleteCartUseCase(this.cartRepoInterface);

  Future<ResultApi<void>> call(int id) async {
    return await cartRepoInterface.deleteFromCart(id);
  }
}