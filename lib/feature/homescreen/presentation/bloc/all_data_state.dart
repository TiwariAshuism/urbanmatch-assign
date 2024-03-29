part of 'all_data_bloc.dart';

@immutable
sealed class FetchAllDataState {}

final class InitialState extends FetchAllDataState {}

final class LoadingState extends FetchAllDataState {}

final class SuccessState extends FetchAllDataState {
  final List<Repos> data;
  SuccessState(this.data);
}

final class Succsscommit extends FetchAllDataState {
  final List<CommitRepos> data;
  Succsscommit(this.data);
}

final class FailureState extends FetchAllDataState {
  final String error;
  FailureState(this.error);
}
