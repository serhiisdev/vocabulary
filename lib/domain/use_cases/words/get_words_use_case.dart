import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/words/words_repository.dart';
import 'package:vocabulary/domain/models/word/word_model.dart';

@injectable
class GetWordsUseCase {
  final WordsRepository _wordsRepository;

  GetWordsUseCase(this._wordsRepository);

  Future<Result<List<WordModel>>> call() {
    return _wordsRepository.getWords();
  }
}
