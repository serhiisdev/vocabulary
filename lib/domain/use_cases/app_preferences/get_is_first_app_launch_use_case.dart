import 'package:injectable/injectable.dart';
import 'package:vocabulary/data/repositories/app_preferences/app_preferences_repository.dart';

/// Use case to check whenever this is the first app launch.
@injectable
class GetIsFirstAppLaunchUseCase {
  final AppPreferencesRepository _appPreferencesRepository;
  GetIsFirstAppLaunchUseCase(this._appPreferencesRepository);

  bool call() {
    final count = _appPreferencesRepository.getSavedCountOfAppLaunches();
    return _isFirstAppLaunch(count);
  }

  bool _isFirstAppLaunch(int count) {
    return count <= 1;
  }
}
