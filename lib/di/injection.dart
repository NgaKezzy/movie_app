import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/home/data/data_sources/home_data_source.dart';

import 'injection.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(initializerName: 'init', asExtension: true)
Future<void> configureDependencies() async => sl.init();

@module
abstract class DataSourceModule {
  @lazySingleton
   UserDataSource provideUserDataSource(Dio dio) => UserDataSource(dio);
}
