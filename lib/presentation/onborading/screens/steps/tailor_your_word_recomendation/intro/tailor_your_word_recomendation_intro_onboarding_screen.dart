import 'package:flutter/material.dart';
import 'package:vocabulary/presentation/core/buttons/buttons.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/tailor_your_word_recomendation/gender_selection/gender_selection_onboarding_screen.dart';

class TailorYourWordRecomendationIntroOnboardingScreen extends StatelessWidget {
  const TailorYourWordRecomendationIntroOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScaffoldWithNextButton(
      body: Column(
        children: [
          Text('Tailor your word recomendation'),
      
        ],
      ),
    );
  }
}