import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/constants/api_keys.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/core/storage_helper/secure_storage_helper.dart';
import 'package:blinkbuy/features/home/data/data_source/get_categories_data_source_interface.dart';
import 'package:blinkbuy/features/home/data/models/category_dto.dart';
import 'package:blinkbuy/features/home/domain/entity/category_intety.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:blinkbuy/core/networking/dio_factory.dart';

@Injectable(as: GetCategoriesDataSourceInterface)
class GetCategoriesDataSourceImp implements GetCategoriesDataSourceInterface {
  @override
  Future<ResultApi<CategoriesEntity>> getCategories() async {
    try {
      final response = await DioFactory.getDio(SecureStorageHelper()).get(
        ApiConstant.getCategories,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${AppKeys.tokenKey}'
          },
        ),
      );
      final categoriesDto = CategoriesDto.fromJson(response.data);
      if (categoriesDto.list != null && categoriesDto.list!.isNotEmpty) {
        return Success<CategoriesEntity>(categoriesDto.toEntity());
      } else {
        return Error<CategoriesEntity>('No categories found');
      }
    } catch (e) {
      return Error<CategoriesEntity>(e.toString());
    }
  }
}
