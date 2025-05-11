import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/app_preferences/config/app_preferences_keys.dart';

abstract class AppPreferencesRepository {
  Future<Result<void>> incrementCountOfAppLaunches();
  int getCountOfAppLaunches();
}

@Injectable(as: AppPreferencesRepository)
class AppPreferencesRepositoryImpl extends AppPreferencesRepository {
  final SharedPreferencesWithCache _storage;
  final Logger _logger;
  AppPreferencesRepositoryImpl(this._storage, this._logger);

  @override
  Future<Result<void>> incrementCountOfAppLaunches() async {
    try {
      final count = getCountOfAppLaunches();
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
  int getCountOfAppLaunches() {
    return _storage.getInt(AppPreferencesKeys.countOfAppLaunches) ?? 0;
  }
}
