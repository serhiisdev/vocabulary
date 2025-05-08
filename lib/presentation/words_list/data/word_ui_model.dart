import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_ui_model.freezed.dart';

@freezed
sealed class WordUiModel with _$WordUiModel {
  const factory WordUiModel({
    required String id,
    required String word,
    required String transcription,
    required String definition,
    required String example,
  }) = _WordUiModel;
}
