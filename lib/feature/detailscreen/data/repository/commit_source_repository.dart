import 'package:assignment1/core/error/failure.dart';
import 'package:assignment1/feature/detailscreen/data/datasource/remote_commit_data_source.dart';
import 'package:assignment1/feature/detailscreen/domain/repository/commit_repository.dart';
import 'package:assignment1/feature/detailscreen/data/model/commit_api_model.dart';
import 'package:fpdart/fpdart.dart';

class CommitRepositoryImpl implements CommitRepository {
  final CommitRemoteDataSourceImpl remoteDataSource;

  CommitRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CommitApiModel>> getCommits(String name) async {
    try {
      final reposEither = await remoteDataSource.fetchCommits(name);
      return (reposEither);
    } catch (e) {
      return left(Failure("Failed to fetch repositories: $e"));
    }
  }
}
