import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/home/domain/entity/category_intety.dart';
import 'package:blinkbuy/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'get_categories_state.dart';

@injectable
class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  GetCategoriesCubit(this.getCategoriesUseCase) : super(GetCategoriesInitial());

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await getCategoriesUseCase.call();
    switch (result) {
      case Success<CategoriesEntity>():
        emit(GetCategoriesSuccess(result.data));
        break;
      case Error<CategoriesEntity>():
        emit(GetCategoriesError(result.messageError));
        break;
    }
  }

  void changeCategory(int index) {
    if (state is GetCategoriesSuccess) {
      final currentState = state as GetCategoriesSuccess;

      emit(GetCategoriesSuccess(currentState.categories, selectedIndex: index));
    }
  }
}
