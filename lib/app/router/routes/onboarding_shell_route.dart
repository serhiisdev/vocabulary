import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:vocabulary/app/di/get_it.dart';
import 'package:vocabulary/app/router/screen.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/onboarding_steps_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/welcome/welcome_onboarding_screen.dart';

abstract class OnboardingShellRoute {
  static ShellRoute build({
    required GlobalKey<NavigatorState> onboardingNavigatorKey,
  }) {
    return ShellRoute(
      navigatorKey: onboardingNavigatorKey,
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) => getIt<OnboardingBloc>()..add(const OnboardingEvent.started()),
          child:  child,
        );
      },
      routes: [
        GoRoute(
          path: '/${Screen.onboardingWelcome}',
          name: Screen.onboardingWelcome,
          builder: (context, state) => const WelcomeOnboardingScreen(),
        ),
        GoRoute(
          path: '/${Screen.onboardingSteps}',
          name: Screen.onboardingSteps,
          pageBuilder: (context, state) =>  GoTransition(
            child: const OnboardingStepsScreen(),
          ).withFade.withBackGesture,
        ),
      ],
    );
  }
}
