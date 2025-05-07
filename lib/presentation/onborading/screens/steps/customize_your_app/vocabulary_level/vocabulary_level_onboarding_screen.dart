import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/onboarding_qa_options_scaffold.dart';

class VocabularyLevelOnboardingScreen extends StatelessWidget {
  const VocabularyLevelOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<OnboardingBloc>();
    return OnboardingQaOptionsScaffold(
      onSelected: (item) {
        bloc.add(OnboardingEvent.vocabularyLevelSelected(item));
        bloc.add(
          const OnboardingEvent.markStepAsCompleted(
            OnboardingStepUi.vocabularyLevel,
          ),
        );
      },
      onSelectedAnimationCompleted: () {
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: (_) {
        bloc.add(OnboardingEvent.skip());
      },
      selectedItem: bloc.state.vocabularyLevel,
      items: OnboardingVocabularyLevel.values,
    );
  }
}
