import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary/app/router/screen.dart';
import 'package:vocabulary/presentation/onborading/welcome/welcome_screen.dart';
import 'package:vocabulary/presentation/splash/splash_screen.dart';

abstract class AppRouterProvider {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _router = _buildGoRouter(rootNavigatorKey: _rootNavigatorKey);

  static GoRouter get router => _router;
}

GoRouter _buildGoRouter({required GlobalKey<NavigatorState> rootNavigatorKey}) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/${Screen.splash}',
    routes: [
      GoRoute(
        path: '/${Screen.splash}',
        name: Screen.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/${Screen.welcome}',
        name: Screen.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
    ],
  );
}
