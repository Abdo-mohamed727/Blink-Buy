import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/cart/data/data_source/cart_data_source_interface.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:blinkbuy/features/cart/domain/repo/cart_repo_interface.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartRepoInterface)

class CartRepoImp implements CartRepoInterface {
  final CartDataSourceInterface _cartDataSource;

  CartRepoImp(this._cartDataSource);

  @override
  Future<ResultApi<void>> addToCart(CartEntity id) {
    return _cartDataSource.addToCart(id);
  }

  @override
  Future<ResultApi<void>> deleteFromCart(CartEntity id) {
    return _cartDataSource.deleteFromCart(id);
  }

  @override
  Future<ResultApi<List<CartEntity>>> getCartItems() {
   return _cartDataSource.getCartItems();
  }
}