import 'package:vocabulary/app/router/screen.dart';

abstract class SplashScreenRouteResolver {
  static String resolve({required bool isOnboardingCompleted}) {
    return switch (isOnboardingCompleted) {
      true => Screen.home,
      false => Screen.onboardingWelcome,
    };
  }
}
