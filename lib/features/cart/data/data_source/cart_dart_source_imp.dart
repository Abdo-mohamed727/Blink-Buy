import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/networking/dio_factory.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/cart/data/data_source/cart_data_source_interface.dart';
import 'package:blinkbuy/features/cart/data/models/cart_dto.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartDataSourceInterface)
class CartDataSourceImp implements CartDataSourceInterface {
  @override
  Future<ResultApi<void>> addToCart(CartEntity cartEntity) async {
    try {
      await DioFactory.getDio().post(
        ApiConstant.addToCart,
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
        ),
        data: {'productId': cartEntity.id},
      );
      return Success<void>(null);
    } catch (e) {
      return Error<void>(e.toString());
    }
  }

  @override
  Future<ResultApi<void>> deleteFromCart(int id) async {
    try {
      await DioFactory.getDio().delete(
        ApiConstant.deleteFromCart,
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
        ),
        data: {'productId': id.toString()},
      );
      return Success<void>(null);
    } catch (e) {
      return Error<void>(e.toString());
    }
  }

  @override
  Future<ResultApi<List<CartEntity>>> getCartItems() async {
    try {
      final response = await DioFactory.getDio().get(
        ApiConstant.getCartItems,
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
        ),
      );

      final list = response.data['list'] as List;

      final cartItems = list.map((e) => CartDto.fromJson(e)).toList();

      return Success<List<CartEntity>>(
        cartItems.map((e) => e.toEntity()).toList(),
      );
    } catch (e) {
      return Error<List<CartEntity>>(e.toString());
    }
  }
}
