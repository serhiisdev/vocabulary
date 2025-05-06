import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/onboarding_repository.dart';
import 'package:vocabulary/domain/models/onborading/onboarding_step.dart';

@injectable
class GetCompletedOnboardingStepsUseCase {
  final OnboardingRepository _onboardingRepository;

  GetCompletedOnboardingStepsUseCase(this._onboardingRepository);

  List<OnboardingStep> call() {
    final completedStepsResult =
        _onboardingRepository.getCompletedOnboardingSteps();
    if (completedStepsResult.isErr()) return [];

    return completedStepsResult.unwrap();
  }
}
