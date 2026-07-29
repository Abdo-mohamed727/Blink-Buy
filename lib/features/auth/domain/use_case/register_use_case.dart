import 'package:blinkbuy/core/networking/result_api.dart';

import 'package:blinkbuy/features/auth/domain/entity/register_entity.dart';
import 'package:blinkbuy/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  RegisterUseCase(this._repo);
  final AuthRepoInterface _repo;

  Future<ResultApi<String>> call(RegisterRequestEntity request) async =>
      await _repo.register(request);
}
