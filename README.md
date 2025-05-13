# Vocabulary

**Before app launch**

Run this command from project root to generate necessary files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

**This app uses the [ElevenLabs TTS API](https://elevenlabs.io/) to pronounce vocabulary words.**

> An API key is required for text-to-speech functionality to work.  
> If no API key is provided, the app will not be able to announce words.

---

## 🔑 Providing the API Key

You can provide the API key via an environment variable.
Example:

```bash
flutter run --dart-define=TTS_API_KEY=your_api_key
```
Replace your_api_key with the actual key obtained from https://elevenlabs.io.

How to get an API key:
1. Go to https://elevenlabs.io/ and sign up.
2. Go to https://elevenlabs.io/app/settings/api-keys and create your API key.
3. Run flutter app as described above.

- Here is the documentation for the endpoint used in this app to convert text to speech:  https://elevenlabs.io/docs/api-reference/text-to-speech/convert
- Here is pricing:
https://elevenlabs.io/pricing/api

At the time of writing this README, ElevenLabs offers a free tier for API usage.
