import 'package:assignment1/core/common/entities/api_model.dart';
import 'package:assignment1/core/error/failure.dart';
import 'package:assignment1/core/usecase/usecase.dart';
import 'package:assignment1/feature/homescreen/domain/repository/all_data_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetRepositories implements UseCase<List<Repos>, NoParams> {
  final AllDataRepository repository;

  GetRepositories(this.repository);

  @override
  Future<Either<Failure, List<Repos>>> call(NoParams params) async {
    try {
      return await repository.getRepositories();
    } catch (e) {
      return left(Failure("An error occurred: $e"));
    }
  }
}

class NoParams {}
