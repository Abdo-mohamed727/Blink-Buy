import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/model/item/product_item_dto.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/home/data/data_source/get_products_data_source_interface.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:blinkbuy/core/networking/dio_factory.dart';

@Injectable(as: GetProductsDataSourceInterface)
class GetProductsDataSourceImp implements GetProductsDataSourceInterface {
  @override
  Future<ResultApi<List<ProductItemEntity>>> getProducts() async {
    try {
      final response = await DioFactory.getDio().get(
        ApiConstant.getProducts,
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNjc5ZTgwOGI3OGVhZTUzZjM0YjgzYyIsImlhdCI6MTc4NTE3NTY4NSwiZXhwIjoxNzg3NzY3Njg1fQ.LhVxOV816rxgOknMN8U46-iPnuXlz-HHg_dmCiCLjtI',
          },
        ),
      );
      final List<dynamic>? rawList = response.data['list'];
      if (rawList != null) {
        final products = rawList
            .map(
              (item) => ProductItemDto.fromJson(
                item as Map<String, dynamic>,
              ).toEntity(),
            )
            .toList();
        return Success<List<ProductItemEntity>>(products);
      } else {
        return Error<List<ProductItemEntity>>('Failed to load products');
      }
    } catch (e) {
      return Error<List<ProductItemEntity>>(e.toString());
    }
  }
}
