import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary/app/router/routes/onboarding_shell_route.dart';
import 'package:vocabulary/app/router/screen.dart';
import 'package:vocabulary/presentation/splash/splash_screen.dart';

abstract class AppRouterProvider {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _onboardingNavigatorKey = GlobalKey<NavigatorState>();

  static final _router = _buildGoRouter(
    rootNavigatorKey: _rootNavigatorKey,
    onboardingNavigatorKey: _onboardingNavigatorKey,
  );

  static GoRouter get router => _router;
}

GoRouter _buildGoRouter({
  required GlobalKey<NavigatorState> rootNavigatorKey,
  required GlobalKey<NavigatorState> onboardingNavigatorKey,
}) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/${Screen.splash}',
    routes: [
      GoRoute(
        path: '/${Screen.splash}',
        name: Screen.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      OnboardingShellRoute.build(onboardingNavigatorKey: onboardingNavigatorKey),
      GoRoute(
        path: '/${Screen.home}',
        name: Screen.home,
        builder: (context, state) => Container(
          color: Colors.green,
          width: 200,
          height: 200,
        ),
      ),
    ],
  );
}
