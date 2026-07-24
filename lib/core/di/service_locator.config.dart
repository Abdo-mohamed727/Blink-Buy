// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
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
    gh.factory<_i849.GetCategoriesUseCase>(
      () => _i849.GetCategoriesUseCase(gh<_i622.GetCategoriesRepoInterface>()),
    );
    gh.factory<_i275.GetCategoriesCubit>(
      () => _i275.GetCategoriesCubit(gh<_i849.GetCategoriesUseCase>()),
    );
    gh.factory<_i521.GetProductsRepoInterface>(
      () =>
          _i509.GetProductsRepoImp(gh<_i218.GetProductsDataSourceInterface>()),
    );
    gh.factory<_i783.GetProductsUseCase>(
      () => _i783.GetProductsUseCase(gh<_i521.GetProductsRepoInterface>()),
    );
    gh.factory<_i554.GetProductsCubit>(
      () => _i554.GetProductsCubit(gh<_i783.GetProductsUseCase>()),
    );
    return this;
  }
}
