abstract class AppEnvProvider {
  static const _ttsApiKey = 'TTS_API_KEY';

  static String get ttsApiKey =>
      const String.fromEnvironment(_ttsApiKey, defaultValue: '');
}
