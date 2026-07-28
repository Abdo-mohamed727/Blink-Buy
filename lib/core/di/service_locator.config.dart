// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:blinkbuy/features/favourite/data/data_source/favourite_data_source_imp.dart'
    as _i13;
import 'package:blinkbuy/features/favourite/data/data_source/favourite_data_source_interface.dart'
    as _i235;
import 'package:blinkbuy/features/favourite/data/repo/favourite_repo_imp.dart'
    as _i909;
import 'package:blinkbuy/features/favourite/domain/repo/favourite_repo_interface.dart'
    as _i32;
import 'package:blinkbuy/features/favourite/domain/use_cases/add_to_favourite_use_case.dart'
    as _i272;
import 'package:blinkbuy/features/favourite/domain/use_cases/get_favourites_use_case.dart'
    as _i421;
import 'package:blinkbuy/features/favourite/domain/use_cases/remove_favourite_use_case.dart'
    as _i282;
import 'package:blinkbuy/features/favourite/presentation/view_model/cubit/favorite_cubit.dart'
    as _i814;
import 'package:blinkbuy/features/home/data/data_source/get_categories_data_source_imp.dart'
    as _i844;
import 'package:blinkbuy/features/home/data/data_source/get_categories_data_source_interface.dart'
    as _i553;
import 'package:blinkbuy/features/home/data/data_source/get_products_data_source_imp.dart'
    as _i986;
import 'package:blinkbuy/features/home/data/data_source/get_products_data_source_interface.dart'
    as _i218;
import 'package:blinkbuy/features/home/data/repo/get_categories_repo_imp.dart'
    as _i1044;
import 'package:blinkbuy/features/home/data/repo/get_product_repo_imp.dart'
    as _i509;
import 'package:blinkbuy/features/home/domain/repo/get_categories_repo_interface.dart'
    as _i622;
import 'package:blinkbuy/features/home/domain/repo/get_products_repo_interface.dart'
    as _i521;
import 'package:blinkbuy/features/home/domain/use_cases/get_categories_use_case.dart'
    as _i849;
import 'package:blinkbuy/features/home/domain/use_cases/get_products_use_case.dart'
    as _i783;
import 'package:blinkbuy/features/home/presintation/view_model/get_categories/get_categories_cubit.dart'
    as _i275;
import 'package:blinkbuy/features/home/presintation/view_model/products_cubit/get_products_cubit.dart'
    as _i554;
import 'package:blinkbuy/features/product_details_screen/data/repo/product_details_data_source_imp.dart'
    as _i334;
import 'package:blinkbuy/features/product_details_screen/data/repo/product_details_repo_imp.dart'
    as _i585;
import 'package:blinkbuy/features/product_details_screen/domain/repo/product_details_data_source_interface.dart'
    as _i537;
import 'package:blinkbuy/features/product_details_screen/domain/repo/product_details_repo_interface.dart'
    as _i845;
import 'package:blinkbuy/features/product_details_screen/domain/use_case/get_product_details.dart'
    as _i216;
import 'package:blinkbuy/features/product_details_screen/presentation/view_model/product_details_screen_cubit/product_details_screen_cubit.dart'
    as _i651;
import 'package:blinkbuy/features/products_%20by_%20category/data/repo/product_by_catogery_data_source_imp.dart'
    as _i770;
import 'package:blinkbuy/features/products_%20by_%20category/data/repo/product_by_catogery_repo_imp.dart'
    as _i96;
import 'package:blinkbuy/features/products_%20by_%20category/domain/repo/product_data_source_interface.dart'
    as _i240;
import 'package:blinkbuy/features/products_%20by_%20category/domain/repo/product_repo_interface.dart'
    as _i42;
import 'package:blinkbuy/features/products_%20by_%20category/domain/use_case/get_products_by_category_use_case.dart'
    as _i215;
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view_model/product_by_category_cubit/product_by_category_cubit.dart'
    as _i392;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i235.FavouriteDataSourceInterface>(
      () => _i13.FavouriteDataSourceImp(),
    );
    gh.factory<_i537.ProductDetailsDataSourceInterface>(
      () => _i334.ProductDetailsDataSourceImp(),
    );
    gh.factory<_i218.GetProductsDataSourceInterface>(
      () => _i986.GetProductsDataSourceImp(),
    );
    gh.factory<_i553.GetCategoriesDataSourceInterface>(
      () => _i844.GetCategoriesDataSourceImp(),
    );
    gh.factory<_i622.GetCategoriesRepoInterface>(
      () => _i1044.GetCategoriesRepoImp(
        gh<_i553.GetCategoriesDataSourceInterface>(),
      ),
    );
    gh.factory<_i240.ProductDataSourceInterface>(
      () => _i770.ProductByCategoryDataSourceImp(),
    );
    gh.factory<_i849.GetCategoriesUseCase>(
      () => _i849.GetCategoriesUseCase(gh<_i622.GetCategoriesRepoInterface>()),
    );
    gh.factory<_i32.FavouriteRepoInterface>(
      () => _i909.FavouriteRepoImp(gh<_i235.FavouriteDataSourceInterface>()),
    );
    gh.factory<_i275.GetCategoriesCubit>(
      () => _i275.GetCategoriesCubit(gh<_i849.GetCategoriesUseCase>()),
    );
    gh.factory<_i845.ProductDetailsRepoInterface>(
      () => _i585.ProductDetailsRepoImp(
        gh<_i537.ProductDetailsDataSourceInterface>(),
      ),
    );
    gh.factory<_i521.GetProductsRepoInterface>(
      () =>
          _i509.GetProductsRepoImp(gh<_i218.GetProductsDataSourceInterface>()),
    );
    gh.factory<_i42.ProductRepoInterface>(
      () =>
          _i96.ProductByCategoryRepoImp(gh<_i240.ProductDataSourceInterface>()),
    );
    gh.factory<_i272.AddToFavouriteUseCase>(
      () => _i272.AddToFavouriteUseCase(gh<_i32.FavouriteRepoInterface>()),
    );
    gh.factory<_i421.GetFavouritesUseCase>(
      () => _i421.GetFavouritesUseCase(gh<_i32.FavouriteRepoInterface>()),
    );
    gh.factory<_i282.RemoveFavouriteUseCase>(
      () => _i282.RemoveFavouriteUseCase(gh<_i32.FavouriteRepoInterface>()),
    );
    gh.factory<_i216.GetProductDetails>(
      () => _i216.GetProductDetails(gh<_i845.ProductDetailsRepoInterface>()),
    );
    gh.factory<_i783.GetProductsUseCase>(
      () => _i783.GetProductsUseCase(gh<_i521.GetProductsRepoInterface>()),
    );
    gh.lazySingleton<_i814.FavoriteCubit>(
      () => _i814.FavoriteCubit(
        gh<_i272.AddToFavouriteUseCase>(),
        gh<_i282.RemoveFavouriteUseCase>(),
        gh<_i421.GetFavouritesUseCase>(),
      ),
    );
    gh.factory<_i651.ProductDetailsScreenCubit>(
      () => _i651.ProductDetailsScreenCubit(gh<_i216.GetProductDetails>()),
    );
    gh.factory<_i215.GetProductsByCategoryUseCase>(
      () => _i215.GetProductsByCategoryUseCase(gh<_i42.ProductRepoInterface>()),
    );
    gh.factory<_i554.GetProductsCubit>(
      () => _i554.GetProductsCubit(gh<_i783.GetProductsUseCase>()),
    );
    gh.factory<_i392.ProductByCategoryCubit>(
      () => _i392.ProductByCategoryCubit(
        gh<_i215.GetProductsByCategoryUseCase>(),
      ),
    );
    return this;
  }
}
