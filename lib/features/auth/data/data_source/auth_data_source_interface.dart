import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entity/login_entity.dart';
import 'package:blinkbuy/features/auth/domain/entity/register_entity.dart';

abstract interface class AuthDataSourceInterface {
  Future<ResultApi<LoginEntity>> login(String email, String password);
   Future<ResultApi<String>> register(RegisterRequestEntity register);
}