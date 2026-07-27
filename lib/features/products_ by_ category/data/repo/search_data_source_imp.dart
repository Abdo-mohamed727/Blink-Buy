
import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/model/item/product_item_dto.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/dio_factory.dart';

import 'package:blinkbuy/core/networking/result_api.dart' as ResultApi;
import 'package:injectable/injectable.dart';

import '../../domain/repo/search_data_source_interface.dart';
@Injectable(as: SearchDataSourceInterface)
class SearchDataSourceImp implements SearchDataSourceInterface {
  @override
  Future<ResultApi.ResultApi<List<ProductItemEntity>>> searchProducts(String query)async {
    try {
      final response = await DioFactory.getDio().get(
        ApiConstant.getProductsSearch,
        queryParameters: {'query': query},
      );
      final data = response.data as List<dynamic>;
      final products = data.map((item) => ProductItemDto.fromJson(item)).toList().map((dto) => dto.toEntity()).toList();
      return ResultApi.Success(products);
    } catch (e) {
      return ResultApi.Error(e.toString());
    }
  }
}