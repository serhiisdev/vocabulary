import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary/app/di/get_it.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';
import 'package:vocabulary/presentation/splash/bloc/splash_bloc.dart';
import 'package:vocabulary/presentation/splash/config/splash_screen_route_resolver.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _handleRedirect(
    BuildContext context, {
    required bool isOnboardingCompleted,
  }) {
    final route = SplashScreenRouteResolver.resolve(
      isOnboardingCompleted: isOnboardingCompleted,
    );
    context.goNamed(route);
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashBloc>()..add(const SplashEvent.started()),
      child: BlocListener<SplashBloc, SplashState>(
        listenWhen:
            (a, b) =>
                (b.status.isSuccess || b.status.isError) &&
                a.status != b.status,
        listener: (context, state) {
          _handleRedirect(
            context,
            isOnboardingCompleted: state.isOnboardingCompleted,
          );
        },
        child: const _SplashScreenView(),
      ),
    );
  }
}

class _SplashScreenView extends StatelessWidget {
  const _SplashScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
