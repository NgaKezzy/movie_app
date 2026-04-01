// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/core/network/app_dio.dart' as _i758;
import 'package:movie_app/di/injection.dart' as _i598;
import 'package:movie_app/features/home/data/data_sources/home_data_source.dart'
    as _i801;
import 'package:movie_app/features/home/data/repositories_impl/user_repository_impl.dart'
    as _i872;
import 'package:movie_app/features/home/domain/repositories/user_repository.dart'
    as _i473;
import 'package:movie_app/features/home/domain/usecase/get_all_user_use_case.dart'
    as _i465;
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart'
    as _i451;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appNetworkModule = _$AppNetworkModule();
    final dataSourceModule = _$DataSourceModule();
    gh.singleton<_i361.Dio>(() => appNetworkModule.provideDio());
    gh.lazySingleton<_i801.UserDataSource>(
      () => dataSourceModule.provideUserDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i473.UserRepository>(
      () =>
          _i872.UserRepositoryImpl(userDataSource: gh<_i801.UserDataSource>()),
    );
    gh.factory<_i465.GetAllUserUseCase>(
      () => _i465.GetAllUserUseCase(userRepository: gh<_i473.UserRepository>()),
    );
    gh.factory<_i451.HomeBloc>(
      () => _i451.HomeBloc(getAllUserUseCase: gh<_i465.GetAllUserUseCase>()),
    );
    return this;
  }
}

class _$AppNetworkModule extends _i758.AppNetworkModule {}

class _$DataSourceModule extends _i598.DataSourceModule {}
