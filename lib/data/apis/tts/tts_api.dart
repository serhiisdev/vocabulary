import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/app/core/configs/endpoints.dart';
import 'package:vocabulary/app/core/configs/get_it_named_constructors.dart';
import 'package:vocabulary/app/core/configs/tts_voices.dart';

abstract class TtsApi {
  Future<List<int>> getSpeechAudio({
    required String text,
    required TtsVoices voice,
  });
}

@Injectable(as: TtsApi)
class TtsApiImpl extends TtsApi {
  final Dio dio;

  TtsApiImpl({@Named(GetItNamedConstructors.ttsDio) required this.dio});

  @override
  Future<List<int>> getSpeechAudio({
    required String text,
    required TtsVoices voice,
  }) async {
    final url = Endpoints.ttsGetSpeech(voiceId: voice.id);
    final data = {"text": text};

    final response = await dio.post<List<int>>(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        headers: {'accept': 'audio/mpeg', 'Content-Type': 'application/json'},
      ),
      data: data,
    );

    if (response.statusCode == 200 && response.data != null) {
      return response.data!;
    }

    throw Exception(
      'Failed to get speech audio. Response code: ${response.statusCode}',
    );
  }
}
