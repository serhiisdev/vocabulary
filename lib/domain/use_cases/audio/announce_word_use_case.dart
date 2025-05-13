import 'package:injectable/injectable.dart';
import 'package:vocabulary/app/core/configs/tts_voices.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/audio_player/audio_player_repository.dart';
import 'package:vocabulary/data/repositories/tts/tts_repository.dart';
import 'package:vocabulary/domain/models/word/word_model.dart';

@injectable
class AnnounceWordUseCase {
  final TtsRepository _ttsRepository;
  final AudioPlayerRepository _audioPlayerRepository;

  AnnounceWordUseCase(this._ttsRepository, this._audioPlayerRepository);

  Future<Result<void>> call(WordModel model) async {
    await _audioPlayerRepository.stop();
    final audioSpeechResult = await _ttsRepository.getSpeechAudio(
      text: model.word,
      voice: TtsVoices.rachel,
    );
    if (audioSpeechResult.isErr()) return audioSpeechResult;
    final audioSource = audioSpeechResult.unwrap();

    final setAudioSourceResult = await _audioPlayerRepository
        .setAudioSourceFromBytes(audioSource);
    if (setAudioSourceResult.isErr()) return setAudioSourceResult;

    return await _audioPlayerRepository.play();
  }
}
