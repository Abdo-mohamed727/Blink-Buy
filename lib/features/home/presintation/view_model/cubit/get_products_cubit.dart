import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'get_products_state.dart';

@injectable
class GetProductsCubit extends Cubit<GetProductsState> {
  final GetProductsUseCase getProductsUseCase;
  GetProductsCubit(this.getProductsUseCase) : super(GetProductsInitial());

  void getProducts() async {
    emit(GetProductsLoading());
    final result = await getProductsUseCase.call();
    switch (result) {
      case Success<List<ProductItemEntity>>():
        emit(GetProductsLoaded(result.data));
      case Error<List<ProductItemEntity>>():
        emit(GetProductsError(result.messageError));
    }
  }
}
