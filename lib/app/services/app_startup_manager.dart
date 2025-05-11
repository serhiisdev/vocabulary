import 'package:injectable/injectable.dart';
import 'package:vocabulary/domain/use_cases/app_preferences/increment_app_launch_count_up_to_limit_use_case.dart';

@injectable
class AppStartupManager {
  final IncrementAppLaunchCountUpToLimitUseCase
  _incrementAppLaunchCountUpToLimitUseCase;
  AppStartupManager(this._incrementAppLaunchCountUpToLimitUseCase);

  Future<void> initialize() async {
    await _incrementAppLaunchCountUpToLimitUseCase();
  }
}
