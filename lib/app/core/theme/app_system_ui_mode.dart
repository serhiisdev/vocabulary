import 'package:flutter/services.dart';

abstract class AppSystemUiMode {
  static Future<void> setDefault() {
    return setEdgeToEdge();
  }

  static Future<void> setImmersiveSticky() {
    return SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  static Future<void> setEdgeToEdge() {
    return SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}
