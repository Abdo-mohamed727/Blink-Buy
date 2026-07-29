import 'dart:io';

import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/account/data/data_source/user_data_source_interface.dart';
import 'package:blinkbuy/features/account/domain/entities/user_entity.dart';
import 'package:blinkbuy/features/account/domain/repo/user_repo_interface.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: UserRepoInterface)
class UserRepoImp implements UserRepoInterface {
  final UserDataSourceInterface _dataSource;
  UserRepoImp(this._dataSource);
  @override
  Future<ResultApi<UserEntity>> getProfile() {
   return _dataSource.getProfile();
  }

  @override
  Future<ResultApi<void>> updateProfile(String name, String email, String phone, String address, String image) {
   return _dataSource.updateProfile(name, email, phone, address, image);
  }
  
  @override
  Future<ResultApi<void>> addImage(File file) {
   return _dataSource.addImage(file);
  }
}