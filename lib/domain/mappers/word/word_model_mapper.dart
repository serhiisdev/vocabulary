import 'package:injectable/injectable.dart';
import 'package:vocabulary/data/models/word/word_api_model.dart';
import 'package:vocabulary/domain/models/word/word_model.dart';

@injectable
class WordModelMapper {
  const WordModelMapper();

  WordModel mapToWordModel(WordApiModel wordApiModel) {
    return WordModel(
      id: wordApiModel.id,
      word: wordApiModel.word,
      transcription: wordApiModel.transcription,
      definition: wordApiModel.definition,
      example: wordApiModel.example,
    );
  }
}
