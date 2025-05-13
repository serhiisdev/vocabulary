import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/apis/audio_player/audio_player_wrapper.dart';
import 'package:vocabulary/data/models/audio/bytes_stream_audio_source.dart';

abstract class AudioPlayerRepository {
  Stream<PlayerException> get errorStream;
  Future<Result<void>> setAudioSourceFromBytes(List<int> bytes);
  Future<Result<void>> play();
  Future<Result<void>> stop();
}

@Injectable(as: AudioPlayerRepository)
class AudioPlayerRepositoryImpl extends AudioPlayerRepository {
  final AudioPlayerWrapper _audioPlayerWrapper;
  final Logger _log;

  AudioPlayerRepositoryImpl(this._audioPlayerWrapper, this._log);

  @override
  Stream<PlayerException> get errorStream => _audioPlayerWrapper.errorStream;

  @override
  Future<Result<void>> setAudioSourceFromBytes(List<int> bytes) async {
    try {
      await _audioPlayerWrapper.setAudioSource(BytesStreamAudioSource(bytes));
      return Ok(null);
    } catch (error, stackTrace) {
      _log.e(
        'Failed to set audio source',
        error: error,
        stackTrace: stackTrace,
      );
      return Err(error);
    }
  }

  @override
  Future<Result<void>> play() async {
    try {
      await _audioPlayerWrapper.play();
      return Ok(null);
    } catch (error, stackTrace) {
      _log.e('Failed to play audio', error: error, stackTrace: stackTrace);
      return Err(error);
    }
  }

  @override
  Future<Result<void>> stop() async {
    try {
      await _audioPlayerWrapper.stop();
      return Ok(null);
    } catch (error, stackTrace) {
      _log.e('Failed to stop audio', error: error, stackTrace: stackTrace);
      return Err(error);
    }
  }
}
