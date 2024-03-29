import 'package:assignment1/core/common/entities/api_model.dart';
import 'package:assignment1/core/error/failure.dart';
import 'package:assignment1/feature/homescreen/data/datasource/remote_alldata_source.dart';
import 'package:assignment1/feature/homescreen/domain/repository/all_data_repository.dart';
import 'package:fpdart/fpdart.dart';

class AllDataRepositoryImpl implements AllDataRepository {
  final AllDataRemoteDataSource remoteDataSource;

  AllDataRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Repos>>> getRepositories() async {
    try {
      final reposEither = await remoteDataSource.fetchRepositories();

      return reposEither.map((userModels) =>
          userModels.map((userModel) => userModel as Repos).toList());
    } catch (e) {
      return left(Failure("Failed to fetch repositories: $e"));
    }
  }
}
