
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/product_details_screen/presentation/view_model/product_details_screen_cubit/product_details_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/model/item/product_item_entity.dart';
import '../../../domain/use_case/get_product_details.dart';
@injectable
class ProductDetailsScreenCubit extends Cubit<ProductDetailsScreenState> {
  ProductDetailsScreenCubit(this._getProductDetails)
      : super(ProductDetailsScreenInitial());

  final GetProductDetails _getProductDetails;

  Future<void> getProductDetails(int productId) async {
    emit(ProductDetailsScreenLoading());

    final result = await _getProductDetails.call(productId );

    switch (result) {
      case Success<ProductItemEntity>():
        emit(
          ProductDetailsScreenSuccess(
            product: result.data,
          ),
        );

      case Error<ProductItemEntity>():
        emit(
          ProductDetailsScreenError(
            errorMessage: result.messageError,
          ),
        );
    }
  }
}