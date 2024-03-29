import 'package:assignment1/feature/detailscreen/domain/usecases/fetch_commit_usecase.dart';
import 'package:assignment1/feature/detailscreen/presentation/bloc/commit_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'commit_event.dart';

class CommitBloc extends Bloc<CommitEvent, CommitState> {
  final GetCommitsData _getCommitsData;

  CommitBloc({required GetCommitsData getCommitsData})
      : _getCommitsData = getCommitsData,
        super(CommitInitial()) {
    on<CommitEvent>((_, emit) => emit(CommitsLoading()));
    on<FetchCommitEvent>(_fetchCommits);
  }

  Future<void> _fetchCommits(
      FetchCommitEvent event, Emitter<CommitState> emit) async {
    emit(CommitsLoading());
    final data = await _getCommitsData.call(event.name);
    
    data.fold(
      (l) => emit(CommitError(l.message)),
      (r) => emit(CommitsLoaded(r)),
    );
  }
}
