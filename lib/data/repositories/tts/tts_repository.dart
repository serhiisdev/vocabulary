import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:vocabulary/app/core/configs/tts_voices.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/apis/tts/tts_api.dart';
import 'package:vocabulary/data/apis/tts/tts_cache.dart';

abstract class TtsRepository {
  Future<Result<List<int>>> getSpeechAudio({
    required String text,
    required TtsVoices voice,
  });
}

@Injectable(as: TtsRepository)
class TtsRepositoryImpl extends TtsRepository {
  final TtsApi _ttsApi;
  final TtsCache _ttsCache;
  final Logger _log;

  TtsRepositoryImpl(this._ttsApi, this._ttsCache, this._log);

  @override
  Future<Result<List<int>>> getSpeechAudio({
    required String text,
    required TtsVoices voice,
  }) async {
    try {
      final cachedAudio = _ttsCache.getCachedSpeechAudio(text: text);
      if (cachedAudio != null) {
        return Ok(cachedAudio);
      }
      final result = await _ttsApi.getSpeechAudio(
        text: text,
        voice: voice,
      );
      _ttsCache.cacheSpeechAudio(
        text: text,
        audio: result,
      );
      return Ok(result);
    } catch (error, stackTrace) {
      _log.e(
        'Failed to get speech audio',
        error: error,
        stackTrace: stackTrace,
      );
      return Err(error);
    }
  }
}
