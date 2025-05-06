import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class GetItModule {
  @lazySingleton
  Logger get logger => Logger();

  @preResolve
  @singleton
  Future<SharedPreferencesWithCache> get sharedPreferencesWithCache =>
      SharedPreferencesWithCache.create(
        cacheOptions: SharedPreferencesWithCacheOptions(),
      );
}
