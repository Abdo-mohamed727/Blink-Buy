import 'dart:io';

import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/networking/dio_factory.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/account/data/data_source/user_data_source_interface.dart';
import 'package:blinkbuy/features/account/data/models/user_dto.dart';
import 'package:blinkbuy/features/account/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserDataSourceInterface)
class UserDataSourceImp implements UserDataSourceInterface {
  @override
  Future<ResultApi<void>> addImage(File file) async {
    try {
      final response = await DioFactory.getDio().post(
        ApiConstant.addProfileImage,
        data: FormData.fromMap({
          'file': await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
            // contentType: MediaType('image','jpg'),
          ),
        }),
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
        ),
      );
      debugPrint('Status: ${response.statusCode}');
      debugPrint('Body: ${response.data.toString()}');
      return Success<void>('Profile image updated successfully');
    } on DioException catch (e) {
      return Error<void>(e.response?.data.toString() ?? e.message.toString());
    } catch (e) {
      return Error<void>(e.toString());
    }
  }

  @override
  Future<ResultApi<UserEntity>> getProfile() async {
    try {
      final response = await DioFactory.getDio().get(
        ApiConstant.profile,
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
        ),
      );
      final model = UserDto.fromJson(response.data);
      return Success<UserEntity>(model.toEntity());
    } catch (e) {
      return Error<UserEntity>(e.toString());
    }
  }

  @override
  Future<ResultApi<void>> updateProfile(
    String name,
    String email,
    String phone,
    String address,
    String image,
  ) async {
    try {
      await DioFactory.getDio().post(
        ApiConstant.updateProfile,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'address': address,
          'image': image,
        },
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
        ),
      );

      return Success<void>('profile updated successfully');
    } on Exception catch (e) {
      return Error<void>(e.toString());
    }
  }
}
