import 'package:flutter/widgets.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/customize_the_app/how_many_words/how_many_words_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/customize_the_app/intro/customize_the_app_intro_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/customize_the_app/vocabulary_level/vocabulary_level_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/how_did_you_hear_about_app/how_did_you_hear_about_app_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/setup_vocabulary/goal_days/goal_days_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/setup_vocabulary/goal_purpose/goal_purpose_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/setup_vocabulary/intro/setup_vocabulary_intro_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/setup_vocabulary/topics/topics_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/tailor_your_word_recomendation/gender_selection/gender_selection_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/tailor_your_word_recomendation/how_old_are_you/how_old_are_you_onboarding_screen.dart';
import 'package:vocabulary/presentation/onborading/screens/steps/tailor_your_word_recomendation/intro/tailor_your_word_recomendation_intro_onboarding_screen.dart';

abstract class OnboardingScreenResolver {
  /// Returns corresponding onboarding screen for given [step].
  static Widget resolve(OnboardingStepUi step) {
    return switch (step) {
      OnboardingStepUi.howDidYouHearAboutApp =>
        const HowDidYouHearAboutAppOnboardingScreen(),
      OnboardingStepUi.tailorYourWordRecomendationIntro =>
        const TailorYourWordRecomendationIntroOnboardingScreen(),
      OnboardingStepUi.howOldAreYou => const HowOldAreYouOnboardingScreen(),
      OnboardingStepUi.genderSelection => const GenderSelectionOnboardingScreen(),
      OnboardingStepUi.customizeTheAppIntro =>
        const CustomizeYourAppIntroOnboardingScreen(),
      OnboardingStepUi.howManyWords => const HowManyWordsOnboardingScreen(),
      OnboardingStepUi.vocabularyLevel => const VocabularyLevelOnboardingScreen(),
      OnboardingStepUi.setupVocabularyIntro =>
        const SetupVocabularyIntroOnboardingScreen(),
      OnboardingStepUi.topics => const TopicsOnboardingScreen(),
      OnboardingStepUi.goalPurpose => const GoalPurposeOnboardingScreen(),
      OnboardingStepUi.goalDays => const GoalDaysOnboardingScreen(),
    };
  }
}
