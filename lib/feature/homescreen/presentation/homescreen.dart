import 'package:assignment1/core/themes/app_pallate.dart';
import 'package:assignment1/core/widgets/blog_card.dart';
import 'package:assignment1/core/widgets/simmer_effect.dart';
import 'package:assignment1/feature/homescreen/presentation/bloc/all_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchAllDataBloc, FetchAllDataState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const DataCardSimmer();
                },
              ),
            );
          }
          if (state is SuccessState) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final repo = state.data[index];
                  return SlideInDown(
                    child: DataCard(
                        data: repo,
                        color: index % 3 == 0
                            ? AppPallete.gradient1
                            : index % 2 == 0
                                ? AppPallete.gradient2
                                : AppPallete.gradient3),
                  );
                },
              ),
            );
          }
          if (state is FailureState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(state.error),
                ),
              ],
            );
          }
          return const Center(
              child: Text(
            "Click on the button to fetch all data",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FetchAllDataBloc>().add(AllDataRequested());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
