import 'package:audio_session/audio_session.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocabulary/app/core/configs/app_config.dart';
import 'package:vocabulary/app/core/configs/endpoints.dart';
import 'package:vocabulary/app/core/configs/get_it_named_constructors.dart';
import 'package:vocabulary/app/services/app_dio_provider.dart';
import 'package:vocabulary/app/services/app_env_provider.dart';
import 'package:vocabulary/data/apis/tts/tts_cache.dart';

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

  @lazySingleton
  @Named(GetItNamedConstructors.ttsDio)
  Dio get ttsDio => AppDioProvider.createTtsDio(
    baseUrl: Endpoints.ttsBaseUrl,
    apiKey: AppEnvProvider.ttsApiKey,
  );

  @lazySingleton
  AudioPlayer get audioPlayer => AudioPlayer();

  @preResolve
  @lazySingleton
  Future<AudioSession> get audioSession => AudioSession.instance;

  @lazySingleton
  TtsCache get ttsCache => TtsInMemoryCacheImpl(
    maxCachedTtsAudios: AppConfig.maxInMemoryCachedTtsAudios,
  );
}
