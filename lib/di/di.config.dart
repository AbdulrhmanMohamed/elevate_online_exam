// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api/api_manager.dart' as _i93;
import '../data/contracts/auth/auth_offline_datasource.dart' as _i93;
import '../data/contracts/auth/auth_online_datasource.dart' as _i62;
import '../data/datasources/auth/auth_offline_datasourceImpl.dart' as _i373;
import '../data/datasources/auth/auth_online_datasource_impl.dart' as _i267;
import '../data/repos/auth_impl/auth_repo_impl.dart' as _i663;
import '../domain/repos/auth/auth_repo.dart' as _i527;
import '../domain/usecases/auth/forgetpassword_usecase.dart' as _i912;
import '../domain/usecases/auth/login_usecase.dart' as _i363;
import '../domain/usecases/auth/register_usecase.dart' as _i705;
import '../presentaion/screens/login/login_view_model.dart' as _i491;

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
    gh.factory<_i93.AuthOfflineDatasource>(
        () => _i373.AuthOfflineDatasourceImpl());
    gh.lazySingleton<_i93.ApiManager>(() => _i93.ApiManager(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(),
        ));
    gh.factory<_i62.AuthOnlineDatasource>(
        () => _i267.AuthOnlineDatasourceImpl(gh<_i93.ApiManager>()));
    gh.factory<_i527.AuthRepo>(() => _i663.AuthRepoImpl(
          gh<_i62.AuthOnlineDatasource>(),
          gh<_i93.AuthOfflineDatasource>(),
        ));
    gh.factory<_i912.ForgetpasswordUsecase>(
        () => _i912.ForgetpasswordUsecase(gh<_i527.AuthRepo>()));
    gh.factory<_i363.LoginUsecase>(
        () => _i363.LoginUsecase(gh<_i527.AuthRepo>()));
    gh.factory<_i705.RegisterUsecase>(
        () => _i705.RegisterUsecase(gh<_i527.AuthRepo>()));
    gh.factory<_i491.LoginViewModel>(
        () => _i491.LoginViewModel(gh<_i363.LoginUsecase>()));
    return this;
  }
}
