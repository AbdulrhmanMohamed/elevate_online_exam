// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api/api_manager.dart' as _i93;
import '../data/contracts/auth/auth_offline_datasource.dart' as _i93;
import '../data/contracts/auth/auth_online_datasource.dart' as _i62;
import '../data/datasource/auth/auth_online_datasource_impl.dart' as _i567;
import '../data/responseimpl/auth/auth_repo_impl.dart' as _i253;
import '../domain/repos/authentication_repo.dart' as _i1053;
import '../domain/usecases/authentication/login_usecase.dart' as _i827;
import '../domain/usecases/authentication/register_usecase.dart' as _i796;

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
    gh.factory<_i93.ApiManager>(() => _i93.ApiManager());
    gh.factory<_i62.AuthOnlineDatasource>(() =>
        _i567.AuthOnlineDatasourceImpl(apiManager: gh<_i93.ApiManager>()));
    gh.factory<_i1053.AuthenticationRepo>(() => _i253.AuthRepoImpl(
          gh<_i62.AuthOnlineDatasource>(),
          gh<_i93.AuthOfflineDatasource>(),
        ));
    gh.factory<_i796.RegisterUsecase>(
        () => _i796.RegisterUsecase(gh<_i1053.AuthenticationRepo>()));
    gh.factory<_i827.LoginUsecase>(
        () => _i827.LoginUsecase(gh<_i1053.AuthenticationRepo>()));
    return this;
  }
}
