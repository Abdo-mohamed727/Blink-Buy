import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/model/item/product_item_dto.dart';
import 'package:blinkbuy/core/model/item/product_item_entity.dart';
import 'package:blinkbuy/core/networking/dio_factory.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/favourite/data/data_source/favourite_data_source_interface.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

final token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNjgxMzc1ODU2OGZiNmVlMTRjYjc3NyIsImlhdCI6MTc4NTIwNTYyNSwiZXhwIjoxNzg3Nzk3NjI1fQ.PFPXvgD1XppkTHtIwB278NWyTfKhR-OhpxZsfnHtECQ";

@Injectable(as: FavouriteDataSourceInterface)
class FavouriteDataSourceImp implements FavouriteDataSourceInterface {
  @override
  Future<ResultApi<void>> addToFavourite({required int productId}) async {
    try {
      await DioFactory.getDio().post(
        ApiConstant.addFavrouite,
        data: {"productId": productId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return Success<void>("product added to favourite");
    } catch (e) {
      return Error<void>(e.toString());
    }
  }

  @override
  Future<ResultApi<List<ProductItemEntity>>> getFavourite() async {
    final response = await DioFactory.getDio().get(
      ApiConstant.getFavrouite,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
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
  }

  @override
  Future<ResultApi<void>> removeFromFavourite({required int productId}) async {
    try {
      await DioFactory.getDio().delete(
        ApiConstant.removeFavrouite,
        data: {"productId": productId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return Success<void>("product removed from favourite");
    } catch (e) {
      return Error<void>(e.toString());
    }
  }
}
