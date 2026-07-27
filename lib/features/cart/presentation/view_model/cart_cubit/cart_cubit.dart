import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:blinkbuy/features/cart/domain/use_case/add_cart_use_case.dart';
import 'package:blinkbuy/features/cart/domain/use_case/delete_cart_use_case.dart';
import 'package:blinkbuy/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final DeleteCartUseCase deleteCartUseCase;
  final AddCartUseCase addCartUseCase;
  CartCubit(this.getCartUseCase, this.addCartUseCase, this.deleteCartUseCase)
    : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());

    final result = await getCartUseCase.call();

    switch (result) {
      case Success<List<CartEntity>>():
        emit(CartGetSuccess(result.data));

      case Error<List<CartEntity>>():
        emit(CartError(result.messageError));
    }
  }

  Future<void> addToCart(CartEntity cartEntity) async {
    emit(CartLoading());

    final result = await addCartUseCase.call(cartEntity);

    switch (result) {
      case Success<void>():
        emit(CartAddSuccess());

      case Error<void>():
        emit(CartError(result.messageError));
    }
  }

  Future<void> deleteFromCart(CartEntity cartEntity) async {
    emit(CartLoading());
    final result = await deleteCartUseCase.call(cartEntity);
    switch (result) {
      case Success<void>():
        emit(CartDeleteSuccess());
      case Error<void>():
        emit(CartError(result.messageError));
    }
  }
}
