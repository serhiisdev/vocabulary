import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/audio_player/audio_player_repository.dart';
import 'package:vocabulary/domain/models/word/word_model.dart';
import 'package:vocabulary/domain/use_cases/app_preferences/get_is_welcome_words_widget_shown_use_case.dart';
import 'package:vocabulary/domain/use_cases/app_preferences/set_is_welcome_words_widget_shown_use_case.dart';
import 'package:vocabulary/domain/use_cases/audio/announce_word_use_case.dart';
import 'package:vocabulary/domain/use_cases/words/get_words_use_case.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model_mapper.dart';

part 'words_list_event.dart';
part 'words_list_state.dart';
part 'words_list_bloc.freezed.dart';

@injectable
class WordsListBloc extends Bloc<WordsListEvent, WordsListState> {
  final GetWordsUseCase _getWordsUseCase;
  final AnnounceWordUseCase _announceWordUseCase;
  final AudioPlayerRepository _audioPlayerRepository;
  final SetIsWordsWelcomeWidgetShownUseCase _setIsWordsWelcomeWidgetShownUseCase;
  final WordUiModelMapper _wordUiModelMapper;
  final Logger _log;
  WordsListBloc(
    this._getWordsUseCase,
    this._announceWordUseCase,
    this._audioPlayerRepository,
    // This use case is only used to provide the initial value for the state.
    // It is called once in the super constructor to initialize the state and is not used afterward.
    GetIsWordsWelcomeWidgetShownUseCase getIsWordsWelcomeWidgetShownUseCase,
    this._setIsWordsWelcomeWidgetShownUseCase,
    this._wordUiModelMapper,
    this._log,
  ) : super(WordsListState(
          isWordsWelcomeWidgetShown:
              getIsWordsWelcomeWidgetShownUseCase(),
        )) {
    on<_Started>(_onStarted, transformer: droppable());
    on<_AnnounceWord>(_onAnnounceWord, transformer: restartable());
    on<_SubscribeToAudioPlayerErrors>(
      _onSubscribeToAudioPlayerErrors,
      transformer: restartable(),
    );
    on<_OnWordsWelcomeWidgetShown>(_onOnWordsWelcomeWidgetShown,
        transformer: droppable());
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
      add(WordsListEvent._subscribeToAudioPlayerErrors());
    } catch (error, stackTrace) {
      emit(state.copyWith(wordsLoadingStatus: BlocStatus.error(error)));
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
    }
  }

  Future<void> _onAnnounceWord(
    _AnnounceWord event,
    Emitter<WordsListState> emit,
  ) async {
    try {
      emit(state.copyWith(wordAnnouncingStatus: const BlocStatus.loading()));
      final wordModel = _wordUiModelMapper.mapToWordModel(event.word);
      final result = await _announceWordUseCase(wordModel);
      if (result.isErr()) {
        emit(
          state.copyWith(
            wordAnnouncingStatus: BlocStatus.error(result.unwrapError()),
          ),
        );
        return;
      }
      emit(
        state.copyWith(wordAnnouncingStatus: const BlocStatus.success(null)),
      );
    } catch (error, stackTrace) {
      emit(state.copyWith(wordAnnouncingStatus: BlocStatus.error(error)));
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
    }
  }

  Future<void> _onOnWordsWelcomeWidgetShown(
    _OnWordsWelcomeWidgetShown event,
    Emitter<WordsListState> emit,
  ) async {
    await _setIsWordsWelcomeWidgetShownUseCase(true);
  }

  Future<void> _onSubscribeToAudioPlayerErrors(
    _SubscribeToAudioPlayerErrors event,
    Emitter<WordsListState> emit,
  ) async {
    await emit.forEach(
      _audioPlayerRepository.errorStream,
      onData: (error) {
        _log.e(runtimeType.toString(), error: error);
        return state.copyWith(wordAnnouncingStatus: BlocStatus.error(error));
      },
      onError: (error, stackTrace) {
        _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
        return state.copyWith(wordAnnouncingStatus: BlocStatus.error(error));
      },
    );
  }

  Future<Result<List<WordModel>>> _getWords() {
    return _getWordsUseCase();
  }

  List<WordUiModel> _mapWordsToUiModels(List<WordModel> words) {
    return words.map(_wordUiModelMapper.mapToWordUiModel).toList();
  }
}
