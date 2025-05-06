import 'package:vocabulary/domain/models/onborading/onboarding_step.dart';

enum OnboardingStepUi {
  howDidYouHearAboutApp(),
  tailorYourWordRecomendationIntro(isIntro: true),
  howOldAreYou(),
  genderSelection(),
  customizeYourAppIntro(isIntro: true),
  howManyWords(),
  vocabularyLevel(),
  setupVocabularyIntro(isIntro: true),
  topics(),
  goalPurpose(),
  goalDays();


  static OnboardingStepUi fromOnboardingStep(OnboardingStep step) {
    return switch (step) {
      OnboardingStep.howDidYouHearAboutApp => OnboardingStepUi.howDidYouHearAboutApp,
      OnboardingStep.tailorYourWordRecomendationIntro => OnboardingStepUi.tailorYourWordRecomendationIntro,
      OnboardingStep.howOldAreYou => OnboardingStepUi.howOldAreYou,
      OnboardingStep.genderSelection => OnboardingStepUi.genderSelection,
      OnboardingStep.customizeYourAppIntro => OnboardingStepUi.customizeYourAppIntro,
      OnboardingStep.howManyWords => OnboardingStepUi.howManyWords,
      OnboardingStep.vocabularyLevel => OnboardingStepUi.vocabularyLevel,
      OnboardingStep.setupVocabularyIntro => OnboardingStepUi.setupVocabularyIntro,
      OnboardingStep.topics => OnboardingStepUi.topics,
      OnboardingStep.goalPurpose => OnboardingStepUi.goalPurpose,
      OnboardingStep.goalDays => OnboardingStepUi.goalDays,
    };
  }

  OnboardingStep toOnboardingStep() {
    return switch (this) {
      OnboardingStepUi.howDidYouHearAboutApp => OnboardingStep.howDidYouHearAboutApp,
      OnboardingStepUi.tailorYourWordRecomendationIntro => OnboardingStep.tailorYourWordRecomendationIntro,
      OnboardingStepUi.howOldAreYou => OnboardingStep.howOldAreYou,
      OnboardingStepUi.genderSelection => OnboardingStep.genderSelection,
      OnboardingStepUi.customizeYourAppIntro => OnboardingStep.customizeYourAppIntro,
      OnboardingStepUi.howManyWords => OnboardingStep.howManyWords,
      OnboardingStepUi.vocabularyLevel => OnboardingStep.vocabularyLevel,
      OnboardingStepUi.setupVocabularyIntro => OnboardingStep.setupVocabularyIntro,
      OnboardingStepUi.topics => OnboardingStep.topics,
      OnboardingStepUi.goalPurpose => OnboardingStep.goalPurpose,
      OnboardingStepUi.goalDays => OnboardingStep.goalDays,
    };
  }

  final bool isIntro;

  const OnboardingStepUi({this.isIntro = false});
}
