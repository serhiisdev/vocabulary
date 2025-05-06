import 'package:flutter/material.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/tailor_your_word_recomendation/gender_selection/gender_selection_onboarding_screen.dart';

class VocabularyLevelOnboardingScreen extends StatelessWidget {
  const VocabularyLevelOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNextButton(
      body: Column(
        children: [
          Text('Vocabulary level'),
        ],
      ),
    );
  }
}