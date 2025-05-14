import 'package:flutter/material.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/config/onboarding_pop_screen_handler.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/scaffold/onboarding_intro_scaffold.dart';

class OnboardingDefaultIntroScaffold extends StatelessWidget {
  final OnboardingBloc bloc;
  final OnboardingStepUi step;
  final String title;
  const OnboardingDefaultIntroScaffold({
    super.key,
    required this.bloc,
    required this.step,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingIntroScaffold(
      onPop: () {
        OnboardingPopScreenHandler.onPop(context, bloc);
      },
      onContinue: () {
        bloc.add(OnboardingEvent.markStepAsCompleted(step));
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: () {
        bloc.add(const OnboardingEvent.skip());
      },
      isLastOnboardingStep: bloc.state.isLastOnboardingStep(step),
      title: title,
    );
  }
}
