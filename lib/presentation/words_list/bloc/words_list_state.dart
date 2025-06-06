part of 'words_list_bloc.dart';

@freezed
sealed class WordsListState with _$WordsListState {
  const factory WordsListState({
    @Default(BlocStatus.initial()) BlocStatus wordsLoadingStatus,
    @Default(BlocStatus.initial()) BlocStatus wordAnnouncingStatus,
    @Default([]) List<WordUiModel> words,
    required bool isWordsWelcomeWidgetShown,
  }) = _WordsListState;
}
