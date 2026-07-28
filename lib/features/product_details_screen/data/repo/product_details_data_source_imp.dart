import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/model/item/product_item_dto.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/dio_factory.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/product_details_screen/domain/repo/product_details_data_source_interface.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsDataSourceInterface)
class ProductDetailsDataSourceImp
		implements ProductDetailsDataSourceInterface {
	@override
	Future<ResultApi<ProductItemEntity>> getProductDetails(
		int productId,
	) async {
		try {
			final response = await DioFactory.getDio().get(
				'${ApiConstant.baseUrl}/home/products/$productId',
				options: Options(
					headers: {
						'Authorization':
								'Bearer ${ApiConstant.token}',
					},
				),
			);

			final data = response.data;
      final product = ProductItemDto.fromJson(data).toEntity();
			return Success<ProductItemEntity>(product);
		} catch (e) {
			return Error<ProductItemEntity>(e.toString());
		}
	}
}
