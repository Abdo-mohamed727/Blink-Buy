import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/account/domain/entities/user_entity.dart';
import 'package:blinkbuy/features/account/domain/repo/user_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUseCase {
  final UserRepoInterface _repo;
  GetUserDataUseCase(this._repo);
  Future<ResultApi<UserEntity>> call() {
    return _repo.getProfile();
  }
}
