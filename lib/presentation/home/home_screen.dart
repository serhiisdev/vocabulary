import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/app/di/get_it.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';
import 'package:vocabulary/presentation/words_list/bloc/words_list_bloc.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';
import 'package:vocabulary/presentation/words_list/widgets/words_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => getIt<WordsListBloc>()..add(const WordsListEvent.started()),
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  void _onAnnounceWord(WordUiModel word, WordsListBloc bloc) {
    bloc.add(WordsListEvent.announceWord(word));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WordsListBloc>();
    return Scaffold(
      backgroundColor: context.theme.appColors.backgroundV2,
      body: MultiBlocListener(
        listeners: [
          BlocListener<WordsListBloc, WordsListState>(
            listenWhen:
                (a, b) =>
                    b.wordsLoadingStatus.isError &&
                    a.wordsLoadingStatus != b.wordsLoadingStatus,
            listener: (context, state) {
              context.showErrorSnackBar();
            },
          ),
          BlocListener<WordsListBloc, WordsListState>(
            listenWhen:
                (a, b) =>
                    b.wordAnnouncingStatus.isError &&
                    a.wordAnnouncingStatus != b.wordAnnouncingStatus,
            listener: (context, state) {
              context.showErrorSnackBar();
            },
          ),
        ],
        child: BlocBuilder<WordsListBloc, WordsListState>(
          builder: (context, state) {
            if (state.words.isEmpty) {
              if (state.wordsLoadingStatus.isInitial ||
                  state.wordsLoadingStatus.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.wordsLoadingStatus.isError) {
                return const Center(child: Text('Error'));
              }
            }
            return WordsListWidget(
              onAnnounceWord: (word) => _onAnnounceWord(word, bloc),
              showWelcomeWidget: state.isFirstAppLaunch,
              words: state.words,
            );
          },
        ),
      ),
    );
  }
}
