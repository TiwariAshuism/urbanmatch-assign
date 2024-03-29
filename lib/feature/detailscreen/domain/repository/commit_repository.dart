import 'package:assignment1/core/common/entities/commit_model.dart';
import 'package:assignment1/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class CommitRepository {
  Future<Either<Failure, CommitRepos>> getCommits(String name);
}
