import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/constants/api_handling_error.dart';
import 'package:blinkbuy/core/networking/dio_factory.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/core/storage_helper/secure_storage_helper.dart';
import 'package:blinkbuy/features/auth/data/data_source/auth_data_source_interface.dart';
import 'package:blinkbuy/features/auth/data/models/login_dto.dart';
import 'package:blinkbuy/features/auth/domain/entity/login_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSourceInterface)
class AuthDataSourceImp implements AuthDataSourceInterface {
  @override
  Future<ResultApi<LoginEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await DioFactory.getDio(SecureStorageHelper()).post(
        ApiConstant.signIn,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Success(
          LoginDto.fromJson(response.data).toEntity(),
        );
      } else {
        return Error(
          response.data['message'] ?? 'Unknown error',
        );
      }

    } on DioException catch (e) {
      return Error(
        ApiHandlingError.handleDioError(e),
      );

    } catch (e) {
      return Error(
        e.toString(),
      );
    }
  } 
}