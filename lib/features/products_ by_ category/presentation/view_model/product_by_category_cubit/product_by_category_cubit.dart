import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/products_ by_ category/domain/use_case/get_products_by_category_use_case.dart';
import 'package:blinkbuy/features/products_ by_ category/presentation/view_model/product_by_category_cubit/product_by_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductByCategoryCubit extends Cubit<ProductByCategoryState> {
  ProductByCategoryCubit(this._getProductsByCategoryUseCase)
      : super(ProductByCategoryInitial());
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;

  Future<void> getProductsByCategory(String slug) async {
    emit(ProductByCategoryLoading());
    final result = await _getProductsByCategoryUseCase.call(slug);
    switch(result)
    {
      case Success<List<ProductItemEntity>>():
        final products = result.data;
        if (products.isEmpty) {
          emit(ProductByCategoryEmpty());
        } else {
          emit(ProductByCategorySuccess(products: products));
        }
      case Error<List<ProductItemEntity>>():
        emit(ProductByCategoryError(errorMessage: result.messageError));
    }
  }
}