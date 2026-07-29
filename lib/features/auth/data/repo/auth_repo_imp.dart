import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entities/register_request_entity.dart';
import 'package:blinkbuy/features/auth/domain/repo/auth_data_source.dart';
import 'package:blinkbuy/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepoInterface)
class AuthRepoImp implements AuthRepoInterface {
  AuthRepoImp(this._dataSource);
  final AuthDataSourceInterface _dataSource;
  @override
  Future<ResultApi<String>> register(RegisterRequestEntity register) async =>
      _dataSource.register(register);
}
