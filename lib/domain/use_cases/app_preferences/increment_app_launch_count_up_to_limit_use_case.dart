import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/app_preferences/app_preferences_repository.dart';

@injectable
class IncrementAppLaunchCountUpToLimitUseCase {
  final AppPreferencesRepository _appPreferencesRepository;
  IncrementAppLaunchCountUpToLimitUseCase(this._appPreferencesRepository);

  Future<Result<void>> call() async {
    final count = _appPreferencesRepository.getSavedCountOfAppLaunches();
    if (!_shouldIncrementCount(count)) return const Ok(null);
    return await _appPreferencesRepository.incrementCountOfAppLaunches();
  }

  /// We only need to increment app launch count to a value greater than 1, i.e. up to
  /// a 2.
  /// If app launch count is less than or equal to 1, then [GetIsFirstAppLaunchUseCase]
  /// can determine that this is the first app launch.
  bool _shouldIncrementCount(int count) {
    return count <= 1;
  }
}
