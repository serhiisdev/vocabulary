part of 'words_list_bloc.dart';

@freezed
sealed class WordsListState with _$WordsListState {
  const factory WordsListState({
    @Default(BlocStatus.initial()) BlocStatus status,
    @Default([]) List<WordUiModel> words,
  }) = _WordsListState;
}
