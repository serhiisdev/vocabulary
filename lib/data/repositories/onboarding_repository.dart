import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:vocabulary/data/apis/local/onboarding/onboarding_dao.dart';
import 'package:vocabulary/domain/models/onborading/onboarding_step.dart';
import 'package:vocabulary/core/models/result.dart';

abstract class OnboardingRepository {
  bool? isOnboardingCompleted();
  Result<List<OnboardingStep>> getCompletedOnboardingSteps();
  Future<Result<void>> setIsOnboardingCompleted(bool isCompleted);
  Future<Result<void>> saveCompletedOnboardingSteps(
    Iterable<OnboardingStep> steps,
  );
}

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl extends OnboardingRepository {
  final OnboardingDao _onboardingDao;
  final Logger _log;

  OnboardingRepositoryImpl(this._onboardingDao, this._log);

  @override
  bool? isOnboardingCompleted() {
    return _onboardingDao.isOnboardingCompleted();
  }

  @override
  Result<List<OnboardingStep>> getCompletedOnboardingSteps() {
    try {
      final steps =
          _onboardingDao
              .getCompletedOnboardingStepsIds()
              .map((e) => OnboardingStep.fromId(e)!)
              .toList();
      return Ok(steps);
    } catch (error, stackTrace) {
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
      return Err(error);
    }
  }

  @override
  Future<Result<void>> setIsOnboardingCompleted(bool isCompleted) async {
    try {
      await _onboardingDao.setIsOnboardingCompleted(isCompleted);
      return Ok(null);
    } catch (error, stackTrace) {
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
      return Err(error);
    }
  }

  @override
  Future<Result<void>> saveCompletedOnboardingSteps(
    Iterable<OnboardingStep> steps,
  ) async {
    try {
      final stepsIds = steps.map((e) => e.id).toSet().toList();
      await _onboardingDao.saveCompletedOnboardingStepsIds(stepsIds);
      return Ok(null);
    } catch (error, stackTrace) {
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
      return Err(error);
    }
  }
}
