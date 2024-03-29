import 'package:assignment1/core/themes/theme.dart';
import 'package:assignment1/dependency_injection.dart';
import 'package:assignment1/feature/detailscreen/data/datasource/remote_commit_data_source.dart';
import 'package:assignment1/feature/detailscreen/data/repository/commit_source_repository.dart';
import 'package:assignment1/feature/detailscreen/domain/usecases/fetch_commit_usecase.dart';
import 'package:assignment1/feature/homescreen/presentation/homescreen.dart';
import 'package:assignment1/feature/homescreen/presentation/bloc/all_data_bloc.dart';
import 'package:assignment1/feature/detailscreen/presentation/bloc/commit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [
        // i will show both methods to showcase my code and the skills
        //with dependencies injection
        BlocProvider(create: (context) => serviceLocator<FetchAllDataBloc>()),
        //without dependencies injection
        BlocProvider(
          create: (context) => CommitBloc(
            getCommitsData: GetCommitsData(
              CommitRepositoryImpl(
                CommitRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repositories',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const HomeScreen(),
    );
  }
}
