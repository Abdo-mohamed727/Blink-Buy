import 'dart:io';

import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/account/domain/entities/user_entity.dart';

abstract interface class UserDataSourceInterface {
  Future<ResultApi<UserEntity>> getProfile();

  Future<ResultApi<void>> updateProfile(
    String name,
    String email,
    String phone,
    String address,
    File file,
  );
  Future<ResultApi<void>> addImage(File file);
}
