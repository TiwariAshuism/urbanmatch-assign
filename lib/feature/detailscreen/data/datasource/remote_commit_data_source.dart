import 'dart:convert';
import 'package:assignment1/core/error/failure.dart';
import 'package:assignment1/feature/detailscreen/data/model/commit_api_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

abstract class CommitRemoteDataSource {
  Future<Either<Failure, CommitApiModel>> fetchCommits(String repositoryName);
}

class CommitRemoteDataSourceImpl implements CommitRemoteDataSource {
  @override
  Future<Either<Failure, CommitApiModel>> fetchCommits(
      String repositoryName) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.github.com/repos/freeCodeCamp/$repositoryName/commits'));

      if (response.statusCode == 200) {
        final List<dynamic> commitsJson = jsonDecode(response.body);
        final CommitApiModel commit =
            CommitApiModel.fromJson(commitsJson.first);

        return right(commit);
      } else {
        return left(Failure(
            "Failed to load commits: ${response.statusCode} - ${response.reasonPhrase}"));
      }
    } catch (e) {
      
      return left(Failure("Failed to fetch commits: $e"));
    }
  }
}
