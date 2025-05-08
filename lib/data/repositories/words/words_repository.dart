import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/apis/words/words_api.dart';
import 'package:vocabulary/domain/mappers/word/word_model_mapper.dart';
import 'package:vocabulary/domain/models/word/word_model.dart';

abstract class WordsRepository {
  Future<Result<List<WordModel>>> getWords({int page = 1, int limit = 5});
}

@Injectable(as: WordsRepository)
class WordsRepositoryImpl implements WordsRepository {
  final WordsApi wordsApi;
  final WordModelMapper wordModelMapper;
  final Logger _log;
  const WordsRepositoryImpl(
    this.wordsApi,
    this.wordModelMapper,
    this._log,
  );

  @override
  Future<Result<List<WordModel>>> getWords({int page = 1, int limit = 5}) async {
    try {
      final words = await wordsApi.getWords(page: page, limit: limit);
      final wordModels = words.map(wordModelMapper.mapToWordModel).toList();
      return Ok(wordModels);
    } catch (error, stackTrace) {
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
      return Err(error);
    }
  }
}
