enum TtsVoices {
  rachel(TtsVoicesRaw.voiceIdRachel);


  final String id;
  const TtsVoices(this.id);
}

abstract class TtsVoicesRaw {
  static const voiceIdRachel = '21m00Tcm4TlvDq8ikWAM';
}
