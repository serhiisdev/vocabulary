import 'package:flutter/services.dart';

abstract class HapticFeedbackService {
  static Future<void> lightImpact() {
    return HapticFeedback.lightImpact();
  }
}
