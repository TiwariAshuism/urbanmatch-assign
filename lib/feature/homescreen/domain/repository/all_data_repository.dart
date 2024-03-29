import 'package:assignment1/core/common/entities/api_model.dart';
import 'package:assignment1/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AllDataRepository {
  Future<Either<Failure, List<Repos>>> getRepositories();
  
}
