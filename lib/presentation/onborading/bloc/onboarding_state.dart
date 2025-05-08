part of 'onboarding_bloc.dart';

@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(BlocStatus.initial()) BlocStatus status,
    @Default(BlocStatus.initial()) BlocStatus completeStepStatus,
    @Default(false) bool isOnboardingCompleted,
    required Set<OnboardingStepUi> steps,
    required Set<OnboardingStepUi> completedSteps,
    OnboardingHowDidYouHearAboutUs? howDidYouHearAboutUs,
    OnboardingNumOfWords? numOfWords,
    OnboardingVocabularyLevel? vocabularyLevel,
    OnboardingGoalPurpose? goalPurpose,
    OnboardingTopics? topics,
    OnboardingGoalDays? goalDays,
    OnboardingGender? gender,
    OnboardingHowOldAreYou? howOldAreYou,
    required int currentStepIndex,
  }) = _OnboardingState;

  static OnboardingState get initial => OnboardingState(
        status: const BlocStatus.initial(),
        isOnboardingCompleted: false,
        steps: OnboardingStepUi.values.toSet(),
        completedSteps: {},
        currentStepIndex: 0,
      );
}

extension OnboardingStateX on OnboardingState {
  bool get isCompleted => completedSteps.length == steps.length;
  int get nextStepIndex {
    return math.min(steps.length - 1, currentStepIndex + 1);
  }

  int get previousStepIndex {
    return math.max(0, currentStepIndex - 1);
  }

  bool get hasPreviousStep {
    return currentStepIndex > 0;
  }

  bool get hasNextStep {
    return currentStepIndex < steps.length - 1;
  }
}
