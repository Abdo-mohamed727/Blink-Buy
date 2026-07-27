import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';

abstract interface class CartDataSourceInterface {
  Future<ResultApi<List<CartEntity>>> getCartItems();
  Future<ResultApi<void>> addToCart(CartEntity id);
  Future<ResultApi<void>> deleteFromCart(CartEntity id);
}