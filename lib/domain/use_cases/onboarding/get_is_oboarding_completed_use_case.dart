import 'package:injectable/injectable.dart';
import 'package:vocabulary/data/repositories/onboarding_repository.dart';

@injectable
class GetIsOnboardingCompletedUseCase {
  final OnboardingRepository _onboardingRepository;

  GetIsOnboardingCompletedUseCase(this._onboardingRepository);

  bool call() {
    return _onboardingRepository.isOnboardingCompleted() ?? false;
  }
}
