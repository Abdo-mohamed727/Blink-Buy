import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/home/domain/entity/category_intety.dart';
import 'package:blinkbuy/features/home/domain/repo/get_categories_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  final GetCategoriesRepoInterface getCategoriesRepoInterface;
  GetCategoriesUseCase(this.getCategoriesRepoInterface);
  Future<ResultApi<CategoriesEntity>> call() async {
    return await getCategoriesRepoInterface.getCategories();
  }
}