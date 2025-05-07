import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/tailor_your_word_recomendation/gender_selection/gender_selection_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/widgets/onboarding_qa_options_scaffold.dart';

class GoalDaysOnboardingScreen extends StatelessWidget {
  const GoalDaysOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final bloc = context.watch<OnboardingBloc>();
    return OnboardingQaOptionsScaffold(
      onSelected: (item) {
        bloc.add(OnboardingEvent.goalDaysSelected(item));
        bloc.add(const OnboardingEvent.markStepAsCompleted(OnboardingStepUi.goalDays));
      },
      onSelectedAnimationCompleted: () {
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: (_) {
        bloc.add(OnboardingEvent.skip());
      },
      selectedItem: bloc.state.goalDays,
      items: OnboardingGoalDays.values,
    );
  }
}