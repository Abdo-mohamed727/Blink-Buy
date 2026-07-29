import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/products_%20by_%20category/domain/use_case/search_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'search_state.dart';
@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._search) : super(SearchInitial());
 final SearchProductsUsecase _search;
  Future<void> searchProducts(String query) async {
    emit(SearchLoading());
    final result = await _search.call(query);
    switch (result) {
      case Success<List<ProductItemEntity>>():
        final products = result.data;
        if (products.isEmpty) {
          emit(SearchEmpty());
      
        } else {
          emit(SearchSuccess(products));
              print(SearchSuccess(products));
        }
      case Error<List<ProductItemEntity>>():
        emit(SearchError(result.messageError));
    }
  }
 
}