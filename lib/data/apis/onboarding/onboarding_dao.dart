import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocabulary/data/apis/onboarding/config/onboarding_storage_keys.dart';
import 'package:injectable/injectable.dart';

abstract class OnboardingDao {
  bool? isOnboardingCompleted();
  List<int> getCompletedOnboardingStepsIds();
  Future<void> setIsOnboardingCompleted(bool isCompleted);
  Future<void> saveCompletedOnboardingStepsIds(List<int> steps);
}

@LazySingleton(as: OnboardingDao)
class OnboardingDaoImpl extends OnboardingDao {
  final SharedPreferencesWithCache _storage;
  OnboardingDaoImpl(this._storage);

  @override
  bool? isOnboardingCompleted() {
    return _storage.getBool(OnboardingStorageKeys.isOnboardingCompleted);
  }

  @override
  List<int> getCompletedOnboardingStepsIds() {
    return _storage
            .getStringList(OnboardingStorageKeys.completedOnboardingSteps)
            ?.map((e) => int.parse(e))
            .toList() ??
        [];
  }

  @override
  Future<void> setIsOnboardingCompleted(bool isCompleted) {
    return _storage.setBool(
      OnboardingStorageKeys.isOnboardingCompleted,
      isCompleted,
    );
  }

  @override
  Future<void> saveCompletedOnboardingStepsIds(List<int> steps) {
    return _storage.setStringList(
      OnboardingStorageKeys.completedOnboardingSteps,
      steps.map((e) => e.toString()).toList(),
    );
  }
}
