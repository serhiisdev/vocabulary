import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/presentation/core/buttons/buttons.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/onboarding_qa_options_scaffold.dart';



class GenderSelectionOnboardingScreen extends StatelessWidget {
  const GenderSelectionOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final bloc = context.watch<OnboardingBloc>();
    return OnboardingQaOptionsScaffold(
      onSelected: (item) {
        bloc.add(OnboardingEvent.genderSelected(item));
        bloc.add(const OnboardingEvent.markStepAsCompleted(OnboardingStepUi.genderSelection));
      },
      onSelectedAnimationCompleted: () {
        bloc.add(const OnboardingEvent.goToNextStep());
      },
      onSkip: (_) {
        bloc.add(OnboardingEvent.skip());
      },
      selectedItem: bloc.state.gender,
      items: OnboardingGender.values,
    );
  }
}
