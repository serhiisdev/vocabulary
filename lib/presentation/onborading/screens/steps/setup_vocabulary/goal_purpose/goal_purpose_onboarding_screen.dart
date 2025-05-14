import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/config/onboarding_pop_screen_handler.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/scaffold/onboarding_qa_options_scaffold.dart';

class GoalPurposeOnboardingScreen extends StatelessWidget {
  const GoalPurposeOnboardingScreen({super.key});

  static const step = OnboardingStepUi.goalPurpose;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<OnboardingBloc>();

    return OnboardingQaOptionsScaffold(
      onPop: () {
        OnboardingPopScreenHandler.onPop(context, bloc);
      },
      onSelected: (item) {
        bloc.add(OnboardingEvent.goalPurposeSelected(item));
        bloc.add(const OnboardingEvent.markStepAsCompleted(step));
      },
      isItemSelected: (item) => bloc.state.goalsPurpose.contains(item),
      onContinue: () {
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: () {
        bloc.add(OnboardingEvent.skip());
      },
      isLastOnboardingStep: bloc.state.isLastOnboardingStep(step),
      title: context.localizations.doYouHaveASpecificGoalInMind,
      subtitle: context.localizations.selectAtLeastOptionToContinue,
      subtitle2: '(${context.localizations.multiselect.toLowerCase()})',
      items: OnboardingGoalPurpose.values,
    );
  }
}
