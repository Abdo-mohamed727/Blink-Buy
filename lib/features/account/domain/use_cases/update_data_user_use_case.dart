import 'dart:io';

import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/account/domain/repo/user_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateDataUserUseCase {
  final UserRepoInterface _repo;
  UpdateDataUserUseCase(this._repo);
  Future<ResultApi<void>> call(
    String name,
    String email,
    String phone,
    String address,
    String image,
  ) {
    return _repo.updateProfile(name, email, phone, address, image);
  }
}
