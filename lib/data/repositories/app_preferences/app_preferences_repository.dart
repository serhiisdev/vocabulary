import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/app_preferences/config/app_preferences_keys.dart';

abstract class AppPreferencesRepository {
  Future<Result<void>> setIsWordsWelcomeWidgetShown(bool isShown);

  bool getIsWordsWelcomeWidgetShown();
}

@Injectable(as: AppPreferencesRepository)
class AppPreferencesRepositoryImpl extends AppPreferencesRepository {
  final SharedPreferencesWithCache _storage;
  final Logger _logger;
  AppPreferencesRepositoryImpl(this._storage, this._logger);

  @override
  Future<Result<void>> setIsWordsWelcomeWidgetShown(bool isShown) async {
    try {
      await _storage.setBool(
        AppPreferencesKeys.isWordsWelcomeWidgetShown,
        isShown,
      );
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
  bool getIsWordsWelcomeWidgetShown() {
    return _storage.getBool(AppPreferencesKeys.isWordsWelcomeWidgetShown) ??
        false;
  }
}
