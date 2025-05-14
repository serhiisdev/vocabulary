import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/widgets/scaffold/default/onboarding_default_intro_scaffold.dart';

class TailorYourWordRecomendationIntroOnboardingScreen extends StatelessWidget {
  const TailorYourWordRecomendationIntroOnboardingScreen({super.key});

  static const step = OnboardingStepUi.tailorYourWordRecomendationIntro;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    return OnboardingDefaultIntroScaffold(
      bloc: bloc,
      step: step,
      title: context.localizations.tailorYourWordRecommendations,
    );
  }
}
