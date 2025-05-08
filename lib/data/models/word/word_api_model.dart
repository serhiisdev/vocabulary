import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_api_model.freezed.dart';
part 'word_api_model.g.dart';

@freezed
sealed class WordApiModel with _$WordApiModel {
  const factory WordApiModel({
    required String id,
    required String word,
    required String transcription,
    required String definition,
    required String example,
  }) = _WordApiModel;

  factory WordApiModel.fromJson(Map<String, dynamic> json) =>
      _$WordApiModelFromJson(json);
}
