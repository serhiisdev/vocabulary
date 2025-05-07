// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:vocabulary/app/di/get_it_module.dart' as _i411;
import 'package:vocabulary/data/apis/local/onboarding/onboarding_dao.dart'
    as _i254;
import 'package:vocabulary/data/repositories/onboarding_repository.dart'
    as _i1017;
import 'package:vocabulary/domain/use_cases/onboarding/get_completed_oboarding_steps_use_case.dart'
    as _i242;
import 'package:vocabulary/domain/use_cases/onboarding/get_initial_oboarding_step_use_case.dart'
    as _i422;
import 'package:vocabulary/domain/use_cases/onboarding/get_is_oboarding_completed_use_case.dart'
    as _i896;
import 'package:vocabulary/domain/use_cases/onboarding/save_completed_onboarding_step_use_case.dart'
    as _i671;
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart'
    as _i631;
import 'package:vocabulary/presentation/splash/bloc/splash_bloc.dart' as _i46;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i422.GetInitialOnboardingStepUseCase>(
      () => _i422.GetInitialOnboardingStepUseCase(),
    );
    await gh.singletonAsync<_i460.SharedPreferencesWithCache>(
      () => getItModule.sharedPreferencesWithCache,
      preResolve: true,
    );
    gh.lazySingleton<_i974.Logger>(() => getItModule.logger);
    gh.lazySingleton<_i254.OnboardingDao>(
      () => _i254.OnboardingDaoImpl(gh<_i460.SharedPreferencesWithCache>()),
    );
    gh.lazySingleton<_i1017.OnboardingRepository>(
      () => _i1017.OnboardingRepositoryImpl(
        gh<_i254.OnboardingDao>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i671.SaveCompletedOnboardingStepUseCase>(
      () => _i671.SaveCompletedOnboardingStepUseCase(
        gh<_i1017.OnboardingRepository>(),
      ),
    );
    gh.factory<_i242.GetCompletedOnboardingStepsUseCase>(
      () => _i242.GetCompletedOnboardingStepsUseCase(
        gh<_i1017.OnboardingRepository>(),
      ),
    );
    gh.factory<_i896.GetIsOnboardingCompletedUseCase>(
      () => _i896.GetIsOnboardingCompletedUseCase(
        gh<_i1017.OnboardingRepository>(),
      ),
    );
    gh.factory<_i46.SplashBloc>(
      () => _i46.SplashBloc(
        gh<_i896.GetIsOnboardingCompletedUseCase>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i631.OnboardingBloc>(
      () => _i631.OnboardingBloc(
        gh<_i1017.OnboardingRepository>(),
        gh<_i896.GetIsOnboardingCompletedUseCase>(),
        gh<_i242.GetCompletedOnboardingStepsUseCase>(),
        gh<_i422.GetInitialOnboardingStepUseCase>(),
        gh<_i671.SaveCompletedOnboardingStepUseCase>(),
        gh<_i974.Logger>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i411.GetItModule {}
