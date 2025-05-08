import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_model.freezed.dart';

@freezed
sealed class WordModel with _$WordModel {
  const factory WordModel({
    required String id,
    required String word,
    required String transcription,
    required String definition,
    required String example,
  }) = _WordModel;
}
