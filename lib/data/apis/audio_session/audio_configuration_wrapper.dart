import 'package:audio_session/audio_session.dart';
import 'package:injectable/injectable.dart';

abstract class AudioConfigurationWrapper {
  Future<void> configure(AudioSessionConfiguration configuration);
}

@Injectable(as: AudioConfigurationWrapper)
class AudioConfigurationWrapperImpl extends AudioConfigurationWrapper {
  final AudioSession _audioSession;
  AudioConfigurationWrapperImpl(this._audioSession);

  @override
  Future<void> configure(AudioSessionConfiguration configuration) async {
    await _audioSession.configure(configuration);
  }
}
