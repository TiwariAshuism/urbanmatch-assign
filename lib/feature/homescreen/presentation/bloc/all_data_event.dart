part of 'all_data_bloc.dart';

@immutable
sealed class FetchAllDataEvent {}

class AllDataRequested extends FetchAllDataEvent {}

class AllDataCompleted extends FetchAllDataEvent {}

class AllDataFailed extends FetchAllDataEvent {
  final String error;
  AllDataFailed(this.error);
}

class FetchCommit extends FetchAllDataEvent {
  final String name;
  FetchCommit(this.name);
}

class FetchAllDataResetRequested extends FetchAllDataEvent {}
