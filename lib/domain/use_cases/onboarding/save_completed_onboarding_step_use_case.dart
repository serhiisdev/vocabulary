import 'package:injectable/injectable.dart';
import 'package:vocabulary/data/repositories/onboarding_repository.dart';
import 'package:vocabulary/domain/models/onborading/onboarding_step.dart';
import 'package:vocabulary/core/models/result.dart';

@injectable
class SaveCompletedOnboardingStepUseCase {
  final OnboardingRepository _onboardingRepository;

  SaveCompletedOnboardingStepUseCase(this._onboardingRepository);

  Future<Result<void>> call(OnboardingStep step) async {
    final completedSteps = _onboardingRepository.getCompletedOnboardingSteps();
    if (completedSteps.isErr()) {
      return Err(completedSteps.unwrapError());
    }
    final completedStepsList = completedSteps.unwrap();
    if (completedStepsList.contains(step)) {
      return Ok(null);
    }
    final newCompletedSteps = [...completedStepsList, step];
    return await _onboardingRepository.saveCompletedOnboardingSteps(
      newCompletedSteps,
    );
  }
}
