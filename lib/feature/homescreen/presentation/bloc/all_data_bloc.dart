import 'package:assignment1/core/common/entities/api_model.dart';
import 'package:assignment1/core/common/entities/commit_model.dart';
import 'package:assignment1/feature/homescreen/domain/usecases/fetch_all_data_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_data_event.dart';
part 'all_data_state.dart';

class FetchAllDataBloc extends Bloc<FetchAllDataEvent, FetchAllDataState> {
  final GetRepositories _getRepositories;
  FetchAllDataBloc({
    required GetRepositories getRepositories,
  })  : _getRepositories = getRepositories,
        super(InitialState()) {
    on<FetchAllDataEvent>((event, emit) => emit(LoadingState()));

    on<AllDataRequested>((event, emit) async {
      final data = await _getRepositories.call(NoParams());
      
      data.fold(
        (l) => emit(FailureState(l.message)),
        (r) => emit(SuccessState(r)),
      );
    });
  }
}
