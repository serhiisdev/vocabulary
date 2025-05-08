import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/config/onboarding_pop_screen_handler.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/scaffold/onboarding_qa_options_scaffold.dart';

class GoalDaysOnboardingScreen extends StatelessWidget {
  const GoalDaysOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<OnboardingBloc>();
    return OnboardingQaOptionsScaffold(
      onPop: () {
        OnboardingPopScreenHandler.onPop(context, bloc);
      },
      onSelected: (item) {
        bloc.add(OnboardingEvent.goalDaysSelected(item));
        bloc.add(
          const OnboardingEvent.markStepAsCompleted(OnboardingStepUi.goalDays),
        );
      },
      onSelectedAnimationCompleted: () {
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: () {
        bloc.add(OnboardingEvent.skip());
      },
      title: context.localizations.whatGoalDoYouWantToStartWith,
      subtitle:
          context.localizations.beingConsistentIsKeyToExpandingYourVocabulary,
      selectedItem: bloc.state.goalDays,
      items: OnboardingGoalDays.values,
    );
  }
}
