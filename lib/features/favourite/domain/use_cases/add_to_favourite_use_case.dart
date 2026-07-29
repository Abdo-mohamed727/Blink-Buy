import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:injectable/injectable.dart';

import '../repo/favourite_repo_interface.dart';

@injectable
class AddToFavouriteUseCase {
  final FavouriteRepoInterface _repo;
  AddToFavouriteUseCase(this._repo);
  Future<ResultApi<void>> call({required int productId}) async {
    return await _repo.addToFavourite(productId: productId);
  }
}