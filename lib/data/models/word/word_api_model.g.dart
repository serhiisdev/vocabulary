// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WordApiModel _$WordApiModelFromJson(Map<String, dynamic> json) =>
    _WordApiModel(
      id: json['id'] as String,
      word: json['word'] as String,
      transcription: json['transcription'] as String,
      definition: json['definition'] as String,
      example: json['example'] as String,
    );

Map<String, dynamic> _$WordApiModelToJson(_WordApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'transcription': instance.transcription,
      'definition': instance.definition,
      'example': instance.example,
    };
