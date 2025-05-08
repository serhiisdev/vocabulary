part of 'words_list_bloc.dart';

@freezed
sealed class WordsListEvent with _$WordsListEvent {
  const factory WordsListEvent.started() = _Started;
}
