import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/onboarding_qa_options_scaffold.dart';

class TopicsOnboardingScreen extends StatelessWidget {
  const TopicsOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final bloc = context.watch<OnboardingBloc>();
    return OnboardingQaOptionsScaffold(
      onSelected: (item) {
        bloc.add(OnboardingEvent.topicsSelected(item));
        bloc.add(const OnboardingEvent.markStepAsCompleted(OnboardingStepUi.topics));
      },
      onSelectedAnimationCompleted: () {
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: (_) {
        bloc.add(OnboardingEvent.skip());
      },
      selectedItem: bloc.state.topics,
      items: OnboardingTopics.values,
    );
  }
}