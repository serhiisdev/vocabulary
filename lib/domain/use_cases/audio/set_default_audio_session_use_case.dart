import 'package:audio_session/audio_session.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/data/repositories/audio_session/audio_session_repository.dart';

@injectable
class SetDefaultAudioSessionUseCase {
  final AudioSessionRepository _audioSessionRepository;

  SetDefaultAudioSessionUseCase(this._audioSessionRepository);

  Future<void> call() async {
    await _audioSessionRepository.setAudioSession(
      AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.playback,
        avAudioSessionCategoryOptions:
            AVAudioSessionCategoryOptions.interruptSpokenAudioAndMixWithOthers |
            AVAudioSessionCategoryOptions.duckOthers,
        avAudioSessionMode: AVAudioSessionMode.voicePrompt,
        avAudioSessionRouteSharingPolicy:
            AVAudioSessionRouteSharingPolicy.defaultPolicy,
        avAudioSessionSetActiveOptions:
            AVAudioSessionSetActiveOptions.notifyOthersOnDeactivation,
        androidAudioAttributes: AndroidAudioAttributes(
          usage: AndroidAudioUsage.assistanceAccessibility,
          contentType: AndroidAudioContentType.speech,
          flags: AndroidAudioFlags.none,
        ),
        androidAudioFocusGainType:
            AndroidAudioFocusGainType.gainTransientMayDuck,
        androidWillPauseWhenDucked: false,
      ),
    );
  }
}
