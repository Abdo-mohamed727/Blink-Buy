import 'dart:io';

import 'package:blinkbuy/core/networking/result_api.dart';

import 'package:blinkbuy/features/account/domain/repo/user_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddImageUseCase {
  final UserRepoInterface _repo;
  AddImageUseCase(this._repo);
  Future<ResultApi<void>> call(File file) {
    return _repo.addImage(file);
  }
}
