import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/config/onboarding_pop_screen_handler.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/scaffold/onboarding_qa_options_scaffold.dart';

class VocabularyLevelOnboardingScreen extends StatelessWidget {
  const VocabularyLevelOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<OnboardingBloc>();
    return OnboardingQaOptionsScaffold(
      onPop: () {
        OnboardingPopScreenHandler.onPop(context, bloc);
      },
      onSelected: (item) {
        bloc.add(OnboardingEvent.vocabularyLevelSelected(item));
        bloc.add(
          const OnboardingEvent.markStepAsCompleted(
            OnboardingStepUi.vocabularyLevel,
          ),
        );
      },
      isItemSelected: (item) => bloc.state.vocabularyLevel == item,
      onSelectedAnimationCompleted: () {
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: () {
        bloc.add(OnboardingEvent.skip());
      },
      title: context.localizations.whatsYourVocabularyLevel,
      subtitle: context.localizations.selectAnOptionToContinue,
      items: OnboardingVocabularyLevel.values,
    );
  }
}
