import 'package:injectable/injectable.dart';
import 'package:vocabulary/domain/use_cases/app_preferences/increment_app_launch_count_up_to_limit_use_case.dart';
import 'package:vocabulary/domain/use_cases/audio/set_default_audio_session_use_case.dart';

@injectable
class AppStartupManager {
  final IncrementAppLaunchCountUpToLimitUseCase
  _incrementAppLaunchCountUpToLimitUseCase;
  final SetDefaultAudioSessionUseCase _setDefaultAudioSessionUseCase;
  AppStartupManager(
    this._incrementAppLaunchCountUpToLimitUseCase,
    this._setDefaultAudioSessionUseCase,
  );

  Future<void> initialize() async {
    final futures = [
      _incrementAppLaunchCountUpToLimitUseCase(),
      _setDefaultAudioSessionUseCase(),
    ];
    await Future.wait(futures);
  }
}
