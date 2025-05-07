import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/onboarding_scaffold_with_next_button.dart';

class TailorYourWordRecomendationIntroOnboardingScreen extends StatelessWidget {
  const TailorYourWordRecomendationIntroOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScaffoldWithNextButton(
      step: OnboardingStepUi.tailorYourWordRecomendationIntro,
      onSkip: (_) {
        context.read<OnboardingBloc>().add(const OnboardingEvent.skip());
      },
      body: Column(
        children: [
          Text('Tailor your word recomendation'),
      
        ],
      ),
    );
  }
}