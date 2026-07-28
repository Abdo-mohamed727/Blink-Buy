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

  List<CartEntity> cartItems = [];

  double totalPrice = 0;
  final double shippingFee = 30;
 

  Future<void> getCart() async {
    emit(CartLoading());

    final result = await getCartUseCase();

    switch (result) {
      case Success<List<CartEntity>>():
        cartItems = result.data;
        calculateTotal();
        emit(CartGetSuccess(List.from(cartItems)));

      case Error<List<CartEntity>>():
        emit(CartError(result.messageError));
    }
  }



  Future<void> addToCart(CartEntity cartEntity) async {
    emit(CartLoading());

    final result = await addCartUseCase(cartEntity);

    switch (result) {
      case Success<void>():
        final cartResult = await getCartUseCase();

        switch (cartResult) {
          case Success<List<CartEntity>>():
            cartItems = cartResult.data;

            calculateTotal();

            emit(CartAddSuccess(List.from(cartItems)));

          case Error<List<CartEntity>>():
            emit(CartError(cartResult.messageError));
        }

      case Error<void>():
        emit(CartError(result.messageError));
    }
  }



  Future<void> deleteFromCart(CartEntity cartEntity) async {
    final result = await deleteCartUseCase(cartEntity.id);

    switch (result) {
      case Success<void>():
        cartItems.removeWhere((item) => item.id == cartEntity.id);

        calculateTotal();

        emit(CartGetSuccess(List.from(cartItems)));

      case Error<void>():
        emit(CartError(result.messageError));
    }
  }



  void incrementQuantity(CartEntity item) {
    final index = cartItems.indexWhere((e) => e.id == item.id);

    if (index == -1) return;

    cartItems[index] = CartEntity(
      id: item.id,
      title: item.title,
      price: item.price,
      images: item.images,
      quantity: item.quantity + 1,
    );

    calculateTotal();

    emit(CartGetSuccess(List.from(cartItems)));
  }

  void decrementQuantity(CartEntity item) {
    final index = cartItems.indexWhere((e) => e.id == item.id);

    if (index == -1) return;

    if (item.quantity <= 1) return;

    cartItems[index] = CartEntity(
      id: item.id,
      title: item.title,
      price: item.price,
      images: item.images,
      quantity: item.quantity - 1,
    );

    calculateTotal();

    emit(CartGetSuccess(List.from(cartItems)));
  }



  void calculateTotal() {
    totalPrice = 0;

    for (final item in cartItems) {
      totalPrice += item.price * item.quantity;
    }
  }

  double get subTotal => totalPrice;

  double get total => totalPrice + shippingFee;
}
