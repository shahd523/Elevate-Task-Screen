// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../products_screen/data/datasource/ProductsDao.dart' as _i92;
import '../../products_screen/data/datasource/productsDaoImpl/ProductsDaoApiImpl.dart'
    as _i413;
import '../../products_screen/data/repositoryimpl/ProductsRepoImpl.dart'
    as _i268;
import '../../products_screen/domain/repository/ProductsRepo.dart' as _i460;
import '../../products_screen/domain/usecase/GetProductsUseCase.dart' as _i171;
import '../../products_screen/presentation/manager/products_cubit.dart' as _i56;
import '../remote/APIManager.dart' as _i639;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i639.APIManager>(() => _i639.APIManager());
    gh.factory<_i92.ProductsDao>(
        () => _i413.ProductsDaoApiImpl(gh<_i639.APIManager>()));
    gh.factory<_i460.ProductsRepo>(
        () => _i268.ProductsRepoImpl(gh<_i92.ProductsDao>()));
    gh.factory<_i171.GetProductsUseCase>(
        () => _i171.GetProductsUseCase(gh<_i460.ProductsRepo>()));
    gh.factory<_i56.ProductsCubit>(
        () => _i56.ProductsCubit(gh<_i171.GetProductsUseCase>()));
    return this;
  }
}
