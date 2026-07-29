
// ignore_for_file: library_prefixes

import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/constants/api_keys.dart';
import 'package:blinkbuy/core/model/item/product_item_dto.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/dio_factory.dart';

import 'package:blinkbuy/core/networking/result_api.dart' as ResultApi ;
import 'package:blinkbuy/core/storage_helper/secure_storage_helper.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../../domain/repo/search_data_source_interface.dart';
@Injectable(as: SearchDataSourceInterface)
class SearchDataSourceImp implements SearchDataSourceInterface {
  @override
  Future<ResultApi.ResultApi<List<ProductItemEntity>>> searchProducts(String query)async {
    try {
      final response = await DioFactory.getDio(SecureStorageHelper()).post(
     
        ApiConstant.getProductsSearch,
        data: {

          "search": query,
          "skip": 0,
          "limit": 5,
        },
      options: Options(
    headers: {
      "Authorization": "Bearer ${AppKeys.tokenKey}",
    },
  ),

      );
    final data = response.data as Map<String, dynamic>;

final list = data['list'] as List<dynamic>;

final products = list
    .map((item) => ProductItemDto.fromJson(item as Map<String, dynamic>))
    .map((dto) => dto.toEntity())
    .toList();

return ResultApi.Success<List<ProductItemEntity>>(products);
    } catch (e) {
      return ResultApi.Error<List<ProductItemEntity>>(e.toString());
    }
  }
}