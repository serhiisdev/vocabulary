abstract class Endpoints {
  static const ttsBaseUrl = 'https://api.elevenlabs.io/v1/text-to-speech';
  static String ttsGetSpeech({required String voiceId}) => '/$voiceId';
}
