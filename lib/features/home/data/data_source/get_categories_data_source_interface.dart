import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/home/domain/entity/category_intety.dart';

abstract interface class GetCategoriesDataSourceInterface {
 Future<ResultApi<CategoriesEntity>> getCategories();
}