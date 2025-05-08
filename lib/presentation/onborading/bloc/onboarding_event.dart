part of 'onboarding_bloc.dart';

@freezed
sealed class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.started() = _Started;
  const factory OnboardingEvent.markStepAsCompleted(OnboardingStepUi step) = _MarkStepAsCompleted;
  const factory OnboardingEvent.stepChanged(int currentStepIndex) = _StepChanged;
  const factory OnboardingEvent.goToNextStep() = _GoToNextStep;
  const factory OnboardingEvent.goToPreviousStep() = _GoToPreviousStep;
  const factory OnboardingEvent.skip() = _Skip;

  const factory OnboardingEvent.howDidYouHearAboutUsSelected(OnboardingHowDidYouHearAboutUs item) = _HowDidYouHearAboutUsSelected;
  const factory OnboardingEvent.numOfWordsSelected(OnboardingNumOfWords item) = _NumOfWordsSelected;
  const factory OnboardingEvent.vocabularyLevelSelected(OnboardingVocabularyLevel item) = _VocabularyLevelSelected;
  const factory OnboardingEvent.goalPurposeSelected(OnboardingGoalPurpose item) = _GoalPurposeSelected;
  const factory OnboardingEvent.topicsSelected(OnboardingTopics item) = _TopicsSelected;
  const factory OnboardingEvent.goalDaysSelected(OnboardingGoalDays item) = _GoalDaysSelected;
  const factory OnboardingEvent.genderSelected(OnboardingGender item) = _GenderSelected;
  const factory OnboardingEvent.howOldAreYouSelected(OnboardingHowOldAreYou item) = _HowOldAreYouSelected;
}
