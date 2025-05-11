import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/app/di/get_it.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';
import 'package:vocabulary/presentation/words_list/bloc/words_list_bloc.dart';
import 'package:vocabulary/presentation/words_list/widgets/words_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WordsListBloc>()..add(const WordsListEvent.started()),
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.backgroundV2,
      body: BlocConsumer<WordsListBloc, WordsListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.words.isEmpty) {
            if (state.status.isInitial || state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status.isError) {
              return const Center(child: Text('Error'));
            }
          }
          return WordsListWidget(words: state.words);
        },
      ),
    );
  }
}
