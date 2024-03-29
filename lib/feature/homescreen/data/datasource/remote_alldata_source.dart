import 'dart:convert';
import 'package:assignment1/core/error/failure.dart';
import 'package:assignment1/feature/homescreen/data/models/data_api_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

abstract class AllDataRemoteDataSource {
  Future<Either<Failure, List<UserModel>>> fetchRepositories();
}

class AllDataRemoteDataSourceImpl implements AllDataRemoteDataSource {
  @override
  Future<Either<Failure, List<UserModel>>> fetchRepositories() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.github.com/users/freeCodeCamp/repos'));

      if (response.statusCode == 200) {
        final List<dynamic> repositoriesJson = jsonDecode(response.body);
        List<UserModel> repositories = repositoriesJson
            .map<UserModel>((json) => UserModel.fromJson(json))
            .toList();

        return right(repositories);
      } else {
        return left(Failure(
            "Failed to load repositories: ${response.statusCode} - ${response.reasonPhrase}"));
      }
    } catch (e) {
      return left(Failure("Failed to fetch repositories: $e"));
    }
  }
}
