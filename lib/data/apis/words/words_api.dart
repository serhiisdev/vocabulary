import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/mocks/words_mock_data_provider.dart';
import 'package:vocabulary/data/models/word/word_api_model.dart';

abstract class WordsApi {
  Future<List<WordApiModel>> getWords({
    int page = 1,
    int limit = 5,
  });
}

@Injectable(as: WordsApi)
class WordsApiImpl implements WordsApi {
  const WordsApiImpl();
  

  @override
  Future<List<WordApiModel>> getWords({
    int page = 1,
    int limit = 5,
  }) async {
    /// Simulate network call delay
    await Future.delayed(const Duration(seconds: 1));
    final wordsRaw = WordsMockDataProvider.getWords();
    final wordsJson = jsonDecode(wordsRaw) as List<dynamic>;
    final words = wordsJson.map((e) => WordApiModel.fromJson(e)).toList();
    return words;
  }
}
