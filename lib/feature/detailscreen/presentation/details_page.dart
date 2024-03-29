import 'package:assignment1/core/widgets/glass_morph.dart';
import 'package:assignment1/feature/detailscreen/presentation/bloc/commit_bloc.dart';
import 'package:assignment1/feature/detailscreen/presentation/bloc/commit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  const DetailsPage({Key? key, required this.name}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    context.read<CommitBloc>().add(FetchCommitEvent(widget.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<CommitBloc, CommitState>(
            builder: (context, state) {
              if (state is CommitsLoaded) {
                return GlassMorph(
                  name: state.data.commit?.author?.name.toString(),
                  email: state.data.commit?.author?.email.toString(),
                  commitMessage: state.data.commit?.message.toString(),
                );
              }
              if (state is CommitsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CommitError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return const Text("");
            },
          ),
        ),
      ),
    );
  }
}
