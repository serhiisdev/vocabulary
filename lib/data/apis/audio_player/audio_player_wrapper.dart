import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

abstract class AudioPlayerWrapper {
  Stream<PlayerException> get errorStream;
  Future<void> setAudioSource(AudioSource audioSource);
  Future<void> play();
  Future<void> stop();
}

@Injectable(as: AudioPlayerWrapper)
class AudioPlayerWrapperImpl extends AudioPlayerWrapper {
  final AudioPlayer player;
  AudioPlayerWrapperImpl(this.player);

  @override
  Stream<PlayerException> get errorStream => player.errorStream;

  @override
  Future<void> setAudioSource(AudioSource audioSource) async {
    await player.setAudioSource(audioSource);
  }

  @override
  Future<void> play() async {
    await player.play();
  }

  @override
  Future<void> stop() async {
    await player.stop();
  }
}
