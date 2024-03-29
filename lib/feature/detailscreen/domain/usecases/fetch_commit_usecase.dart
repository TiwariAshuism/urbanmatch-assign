import 'package:assignment1/core/common/entities/commit_model.dart';
import 'package:assignment1/core/error/failure.dart';
import 'package:assignment1/core/usecase/usecase.dart';
import 'package:assignment1/feature/detailscreen/domain/repository/commit_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCommitsData implements UseCase<CommitRepos, String> {
  final CommitRepository repository;

  GetCommitsData(this.repository);

  @override
  Future<Either<Failure, CommitRepos>> call(String name) async {
    try {
      return await repository.getCommits(name);
    } catch (e) {
      return left(Failure("An error occurred: $e"));
    }
  }
}
