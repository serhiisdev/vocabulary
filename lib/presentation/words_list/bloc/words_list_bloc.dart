import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/domain/models/word/word_model.dart';
import 'package:vocabulary/domain/use_cases/app_preferences/get_is_first_app_launch_use_case.dart';
import 'package:vocabulary/domain/use_cases/words/get_words_use_case.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model_mapper.dart';

part 'words_list_event.dart';
part 'words_list_state.dart';
part 'words_list_bloc.freezed.dart';

@injectable
class WordsListBloc extends Bloc<WordsListEvent, WordsListState> {
  final GetWordsUseCase _getWordsUseCase;
  final WordUiModelMapper _wordUiModelMapper;
  final Logger _log;
  WordsListBloc(
    this._getWordsUseCase,
    // This use case is only used to provide the initial value for the state.
    // It is called once in the super constructor to initialize the state and is not used afterward.
    GetIsFirstAppLaunchUseCase getIsFirstAppLaunchUseCase,
    this._wordUiModelMapper,
    this._log,
  ) : super(WordsListState(isFirstAppLaunch: getIsFirstAppLaunchUseCase())) {
    on<_Started>(_onStarted, transformer: droppable());
  }

  Future<void> _onStarted(_Started event, Emitter<WordsListState> emit) async {
    try {
      emit(state.copyWith(wordsLoadingStatus: const BlocStatus.loading()));
      final result = await _getWords();
      if (result.isErr()) {
        emit(
          state.copyWith(
            wordsLoadingStatus: BlocStatus.error(result.unwrapError()),
          ),
        );
        return;
      }
      final words = result.unwrap();
      final uiModels = _mapWordsToUiModels(words);
      emit(
        state.copyWith(
          wordsLoadingStatus: const BlocStatus.success(null),
          words: uiModels,
        ),
      );
    } catch (error, stackTrace) {
      emit(state.copyWith(wordsLoadingStatus: BlocStatus.error(error)));
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
    }
  }

  Future<Result<List<WordModel>>> _getWords() {
    return _getWordsUseCase();
  }

  List<WordUiModel> _mapWordsToUiModels(List<WordModel> words) {
    return words.map(_wordUiModelMapper.mapToWordUiModel).toList();
  }
}
