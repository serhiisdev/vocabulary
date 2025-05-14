import 'package:injectable/injectable.dart';
import 'package:vocabulary/domain/use_cases/audio/set_default_audio_session_use_case.dart';

@injectable
class AppStartupManager {
  final SetDefaultAudioSessionUseCase _setDefaultAudioSessionUseCase;
  AppStartupManager(
    this._setDefaultAudioSessionUseCase,
  );

  Future<void> initialize() async {
    await _setDefaultAudioSessionUseCase();
  }
}
