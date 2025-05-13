abstract class TtsCache {
  void cacheSpeechAudio({required String text, required List<int> audio});

  List<int>? getCachedSpeechAudio({required String text});
}

class TtsInMemoryCacheImpl extends TtsCache {
  final int _maxCachedTtsAudios;
  TtsInMemoryCacheImpl({required int maxCachedTtsAudios})
    : _maxCachedTtsAudios = maxCachedTtsAudios;

  final _cache = <String, List<int>>{};

  @override
  void cacheSpeechAudio({required String text, required List<int> audio}) {
    if (_shouldRemoveFirstCachedAudio(text)) {
      _cache.remove(_cache.keys.first);
    }
    _cache[text] = audio;
  }

  @override
  List<int>? getCachedSpeechAudio({required String text}) {
    return _cache[text];
  }

  bool _shouldRemoveFirstCachedAudio(String text) {
    return _cache.isNotEmpty &&
        _cache.length >= _maxCachedTtsAudios &&
        !_cache.containsKey(text);
  }
}
