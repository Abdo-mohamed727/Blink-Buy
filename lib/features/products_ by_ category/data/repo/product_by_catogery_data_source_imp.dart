
import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/model/item/product_item_dto.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/products_ by_ category/domain/repo/product_data_source_interface.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:blinkbuy/core/networking/dio_factory.dart';
@Injectable(as: ProductDataSourceInterface)

class ProductByCategoryDataSourceImp implements ProductDataSourceInterface {


  @override
  Future<ResultApi<List<ProductItemEntity>>> getProductsByCategory(String slug, String categoryName) async {
    try {
      var response = await DioFactory.getDio().get(
        "${ApiConstant.baseUrl}${ApiConstant.product}$slug?skip=0&limit=5",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNjIzYTFmODAyYjkzZTU3MmM1MmVjMSIsImlhdCI6MTc4NDkwMDAyMCwiZXhwIjoxNzg3NDkyMDIwfQ.2sC5GjPJsmMzrSKI3Utqxp6jmdM1I2jkHFx7gdcLcN0',
          },
        ));

      var jsonData = response.data;
      List<dynamic> productsList = jsonData['list'] ?? [];
      List<ProductItemEntity> products = productsList
          .map((item) => ProductItemDto.fromJson(item as Map<String, dynamic>).toEntity())
          .toList();
      return Success<List<ProductItemEntity>>(products);
    } catch (e) {
      return Error<List<ProductItemEntity>>(e.toString());
    }
  }
}

