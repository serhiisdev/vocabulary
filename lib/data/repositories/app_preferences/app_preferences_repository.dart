import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/app_preferences/config/app_preferences_keys.dart';

abstract class AppPreferencesRepository {
  Future<Result<void>> incrementCountOfAppLaunches();

  /// Returns the saved count of app launches. I.e. the count of app launches that was
  /// incremented by using [incrementCountOfAppLaunches] method.
  ///
  /// Note: as this method returns only the saved count of app launches,
  /// it might not reflect actual app launches count.
  int getSavedCountOfAppLaunches();
}

@Injectable(as: AppPreferencesRepository)
class AppPreferencesRepositoryImpl extends AppPreferencesRepository {
  final SharedPreferencesWithCache _storage;
  final Logger _logger;
  AppPreferencesRepositoryImpl(this._storage, this._logger);

  @override
  Future<Result<void>> incrementCountOfAppLaunches() async {
    try {
      final count = getSavedCountOfAppLaunches();
      final newCount = count + 1;
      await _storage.setInt(AppPreferencesKeys.countOfAppLaunches, newCount);
      return const Ok(null);
    } catch (error, stackTrace) {
      _logger.e(
        'Error incrementing count of app launches $error',
        stackTrace: stackTrace,
      );
      return Err(error);
    }
  }

  @override
  int getSavedCountOfAppLaunches() {
    return _storage.getInt(AppPreferencesKeys.countOfAppLaunches) ?? 0;
  }
}
