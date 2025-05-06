import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/domain/models/onborading/onboarding_step.dart';

@injectable
class GetInitialOnboardingStepUseCase {
  GetInitialOnboardingStepUseCase();

  OnboardingStep call({
    required Iterable<OnboardingStep> allSteps,
    required Iterable<OnboardingStep> completedSteps,
  }) {
    final nextStep = allSteps.firstWhereOrNull(
      (step) => !completedSteps.contains(step),
    );
    return nextStep ?? allSteps.first;
  }
}
