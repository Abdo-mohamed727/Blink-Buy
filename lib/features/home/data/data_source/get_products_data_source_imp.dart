import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/model/item/product_item_dto.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/home/data/data_source/get_products_data_source_interface.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

final dio = Dio();

@Injectable(as: GetProductsDataSourceInterface)
class GetProductsDataSourceImp implements GetProductsDataSourceInterface {
  @override
  Future<ResultApi<List<ProductItemEntity>>> getProducts() async {
    try {
      final response = await dio.get(
        ApiConstant.getProducts,
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNjIzYTFmODAyYjkzZTU3MmM1MmVjMSIsImlhdCI6MTc4NDkwMDAyMCwiZXhwIjoxNzg3NDkyMDIwfQ.2sC5GjPJsmMzrSKI3Utqxp6jmdM1I2jkHFx7gdcLcN0',
          },
        ),
      );
      final List<dynamic>? rawList = response.data['list'];
      if (rawList != null) {
        final products = rawList
            .map((item) => ProductItemDto.fromJson(item as Map<String, dynamic>).toEntity())
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
