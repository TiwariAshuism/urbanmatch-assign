part of 'commit_bloc.dart';

@immutable
sealed class CommitEvent {}

class FetchCommitEvent extends CommitEvent {
  final String name;
  FetchCommitEvent(this.name);
}
