import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entities/register_request_entity.dart';

abstract interface class AuthRepoInterface {
  Future<ResultApi<String>> register(RegisterRequestEntity register);
}
