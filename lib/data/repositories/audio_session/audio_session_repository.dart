import 'package:audio_session/audio_session.dart';
import 'package:injectable/injectable.dart';

abstract class AudioSessionRepository {
  Future<void> setAudioSession(AudioSessionConfiguration configuration);
}


@Injectable(as: AudioSessionRepository)
class AudioSessionRepositoryImpl extends AudioSessionRepository {
  final AudioSession _audioSession;

  AudioSessionRepositoryImpl(this._audioSession);

  @override
  Future<void> setAudioSession(AudioSessionConfiguration configuration) async {
    await _audioSession.configure(configuration);
  }
}
