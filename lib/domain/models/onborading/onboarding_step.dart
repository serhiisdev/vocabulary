import 'package:collection/collection.dart';

enum OnboardingStep {
  howDidYouHearAboutApp(1),
  tailorYourWordRecomendationIntro(2),
  howOldAreYou(3),
  genderSelection(4),
  customizeYourAppIntro(5),
  howManyWords(6),
  vocabularyLevel(7),
  setupVocabularyIntro(8),
  topics(9),
  goalPurpose(10),
  goalDays(11);


  final int id;

  static OnboardingStep? fromId(int id) {
    return OnboardingStep.values.firstWhereOrNull(
      (element) => element.id == id,
    );
  }

  const OnboardingStep(this.id);
}
