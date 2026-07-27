import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
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
      final response = await DioFactory.getDio().get(
        ApiConstant.getCategories,
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNjc5ZTgwOGI3OGVhZTUzZjM0YjgzYyIsImlhdCI6MTc4NTE3NTY4NSwiZXhwIjoxNzg3NzY3Njg1fQ.LhVxOV816rxgOknMN8U46-iPnuXlz-HHg_dmCiCLjtI',
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
