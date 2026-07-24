import 'package:blinkbuy/core/networking/result_api.dart';
 
import 'package:blinkbuy/features/home/data/data_source/get_categories_data_source_interface.dart';
import 'package:blinkbuy/features/home/domain/entity/category_intety.dart';
import 'package:blinkbuy/features/home/domain/repo/get_categories_repo_interface.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:GetCategoriesRepoInterface)
class GetCategoriesRepoImp implements GetCategoriesRepoInterface {
  final GetCategoriesDataSourceInterface _getCategoriesDataSource;

  GetCategoriesRepoImp(this._getCategoriesDataSource);
  @override
  Future<ResultApi<CategoriesEntity>> getCategories() {
   return _getCategoriesDataSource.getCategories();
  }
}

 