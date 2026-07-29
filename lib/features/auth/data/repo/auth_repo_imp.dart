import 'package:blinkbuy/core/constants/api_keys.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/core/storage_helper/secure_storage_helper.dart';
import 'package:blinkbuy/features/auth/data/data_source/auth_data_source_interface.dart';
import 'package:blinkbuy/features/auth/domain/entity/login_entity.dart';
import 'package:blinkbuy/features/auth/domain/entity/register_entity.dart';
import 'package:blinkbuy/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepoInterface)
class AuthRepoImp implements AuthRepoInterface {
  final AuthDataSourceInterface _authDataSource;
  final SecureStorageHelper _secureStorageHelper;

  AuthRepoImp(
    this._authDataSource,
    this._secureStorageHelper,
  );

  @override
  Future<ResultApi<LoginEntity>> login(
    String email,
    String password,
  ) async {
    final result = await _authDataSource.login(email, password);

    switch (result) {
      case Success<LoginEntity>():
      var entity = result.data;
        await _secureStorageHelper.saveSecure(
          key: AppKeys.tokenKey,
          value: entity.token ?? '',
        );

        return Success(entity);

      case Error<LoginEntity>():
        return Error(result.messageError);
    }
  }

  @override
  Future<ResultApi<String>> register(RegisterRequestEntity register) async {
    final result = await _authDataSource.register(register);

    switch (result) {
      case Success<String>():
        return Success(result.data);

      case Error<String>():
        return Error(result.messageError);
    }
   
  }
}