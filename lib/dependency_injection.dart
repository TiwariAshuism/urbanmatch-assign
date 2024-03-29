// dependency_injection.dart

import 'package:assignment1/feature/homescreen/domain/repository/all_data_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:assignment1/feature/homescreen/data/datasource/remote_alldata_source.dart';
import 'package:assignment1/feature/homescreen/data/repository/data_source_repo.dart';
import 'package:assignment1/feature/homescreen/domain/usecases/fetch_all_data_usecase.dart';
import 'package:assignment1/feature/homescreen/presentation/bloc/all_data_bloc.dart';


final serviceLocator = GetIt.instance;

Future<void> init() async {

  serviceLocator
    ..registerFactory<AllDataRemoteDataSource>(
        () => AllDataRemoteDataSourceImpl())
    ..registerFactory<AllDataRepository>(
        () => AllDataRepositoryImpl(serviceLocator()))
    ..registerFactory(() => GetRepositories(serviceLocator()))
    ..registerLazySingleton(
        () => FetchAllDataBloc(getRepositories: serviceLocator()));
}
