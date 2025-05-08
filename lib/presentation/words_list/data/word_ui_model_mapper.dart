import 'package:injectable/injectable.dart';
import 'package:vocabulary/domain/models/word/word_model.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';

@injectable
class WordUiModelMapper {
  const WordUiModelMapper();

  WordUiModel mapToWordUiModel(WordModel wordModel) {
    return WordUiModel(
      id: wordModel.id,
      word: wordModel.word,
      transcription: wordModel.transcription,
      definition: wordModel.definition,
      example: wordModel.example,
    );
  }
}
