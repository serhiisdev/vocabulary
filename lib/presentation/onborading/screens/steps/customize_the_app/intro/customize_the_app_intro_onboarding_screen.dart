import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/config/onboarding_pop_screen_handler.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/scaffold/onboarding_intro_scaffold.dart';

class CustomizeYourAppIntroOnboardingScreen extends StatelessWidget {
  const CustomizeYourAppIntroOnboardingScreen({super.key});

  static const step = OnboardingStepUi.customizeTheAppIntro;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    return OnboardingIntroScaffold(
      onPop: () {
        OnboardingPopScreenHandler.onPop(context, bloc);
      },
      onContinue: () {
        bloc.add(const OnboardingEvent.markStepAsCompleted(step));
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: () {
        bloc.add(const OnboardingEvent.skip());
      },
      isLastOnboardingStep: bloc.state.isLastOnboardingStep(step),
      title: context.localizations.customizeTheAppToImproveYourExperience,
    );
  }
}
