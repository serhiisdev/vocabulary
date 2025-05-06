part of 'onboarding_bloc.dart';

@freezed
sealed class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.markStepAsCompleted(OnboardingStepUi step) = _MarkStepAsCompleted;
  const factory OnboardingEvent.stepChanged(int currentStepIndex) = _StepChanged;
  const factory OnboardingEvent.goToNextStep() = _GoToNextStep;
  const factory OnboardingEvent.goToPreviousStep() = _GoToPreviousStep;
  const factory OnboardingEvent.skip() = _Skip;
}
