import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:blinkbuy/features/cart/domain/repo/cart_repo_interface.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddCartUseCase { 

  final CartRepoInterface cartRepoInterface;
  AddCartUseCase(this.cartRepoInterface);
  Future<ResultApi<void>> call(CartEntity id) async {
    return await cartRepoInterface.addToCart(id);
  }
 }