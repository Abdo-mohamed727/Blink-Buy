import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entity/login_entity.dart';
import 'package:blinkbuy/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {
  final AuthRepoInterface _authRepo;
 LoginUseCase(this._authRepo);
 Future<ResultApi<LoginEntity>> call(String email, String password) async {
   return await _authRepo.login(email, password);
 }

}