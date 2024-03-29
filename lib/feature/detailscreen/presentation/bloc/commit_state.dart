import 'package:assignment1/core/common/entities/commit_model.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class CommitState {}

class CommitInitial extends CommitState {}

class CommitsLoading extends CommitState {}

class CommitsLoaded extends CommitState {
  final CommitRepos data;
  CommitsLoaded(this.data);
}

class CommitError extends CommitState {
  final String errorMessage;

  CommitError(this.errorMessage);
}
