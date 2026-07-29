import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entity/login_entity.dart';

abstract interface class AuthRepoInterface {
  Future<ResultApi<LoginEntity>> login(String email, String password);

}