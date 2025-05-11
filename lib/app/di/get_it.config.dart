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
import 'package:vocabulary/app/services/app_startup_manager.dart' as _i859;
import 'package:vocabulary/data/apis/onboarding/onboarding_dao.dart' as _i276;
import 'package:vocabulary/data/apis/words/words_api.dart' as _i1015;
import 'package:vocabulary/data/repositories/app_preferences/app_preferences_repository.dart'
    as _i491;
import 'package:vocabulary/data/repositories/onboarding/onboarding_repository.dart'
    as _i947;
import 'package:vocabulary/data/repositories/words/words_repository.dart'
    as _i530;
import 'package:vocabulary/domain/mappers/word/word_model_mapper.dart' as _i703;
import 'package:vocabulary/domain/use_cases/app_preferences/get_is_first_app_launch_use_case.dart'
    as _i76;
import 'package:vocabulary/domain/use_cases/app_preferences/increment_app_launch_count_up_to_limit_use_case.dart'
    as _i288;
import 'package:vocabulary/domain/use_cases/onboarding/get_completed_oboarding_steps_use_case.dart'
    as _i242;
import 'package:vocabulary/domain/use_cases/onboarding/get_initial_oboarding_step_use_case.dart'
    as _i422;
import 'package:vocabulary/domain/use_cases/onboarding/get_is_oboarding_completed_use_case.dart'
    as _i896;
import 'package:vocabulary/domain/use_cases/onboarding/save_completed_onboarding_step_use_case.dart'
    as _i671;
import 'package:vocabulary/domain/use_cases/words/get_words_use_case.dart'
    as _i398;
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart'
    as _i631;
import 'package:vocabulary/presentation/splash/bloc/splash_bloc.dart' as _i46;
import 'package:vocabulary/presentation/words_list/bloc/words_list_bloc.dart'
    as _i368;
import 'package:vocabulary/presentation/words_list/data/word_ui_model_mapper.dart'
    as _i72;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i703.WordModelMapper>(() => const _i703.WordModelMapper());
    gh.factory<_i422.GetInitialOnboardingStepUseCase>(
      () => _i422.GetInitialOnboardingStepUseCase(),
    );
    gh.factory<_i72.WordUiModelMapper>(() => const _i72.WordUiModelMapper());
    await gh.singletonAsync<_i460.SharedPreferencesWithCache>(
      () => getItModule.sharedPreferencesWithCache,
      preResolve: true,
    );
    gh.lazySingleton<_i974.Logger>(() => getItModule.logger);
    gh.lazySingleton<_i276.OnboardingDao>(
      () => _i276.OnboardingDaoImpl(gh<_i460.SharedPreferencesWithCache>()),
    );
    gh.lazySingleton<_i947.OnboardingRepository>(
      () => _i947.OnboardingRepositoryImpl(
        gh<_i276.OnboardingDao>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i1015.WordsApi>(() => const _i1015.WordsApiImpl());
    gh.factory<_i491.AppPreferencesRepository>(
      () => _i491.AppPreferencesRepositoryImpl(
        gh<_i460.SharedPreferencesWithCache>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i671.SaveCompletedOnboardingStepUseCase>(
      () => _i671.SaveCompletedOnboardingStepUseCase(
        gh<_i947.OnboardingRepository>(),
      ),
    );
    gh.factory<_i242.GetCompletedOnboardingStepsUseCase>(
      () => _i242.GetCompletedOnboardingStepsUseCase(
        gh<_i947.OnboardingRepository>(),
      ),
    );
    gh.factory<_i896.GetIsOnboardingCompletedUseCase>(
      () => _i896.GetIsOnboardingCompletedUseCase(
        gh<_i947.OnboardingRepository>(),
      ),
    );
    gh.factory<_i530.WordsRepository>(
      () => _i530.WordsRepositoryImpl(
        gh<_i1015.WordsApi>(),
        gh<_i703.WordModelMapper>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i398.GetWordsUseCase>(
      () => _i398.GetWordsUseCase(gh<_i530.WordsRepository>()),
    );
    gh.factory<_i288.IncrementAppLaunchCountUpToLimitUseCase>(
      () => _i288.IncrementAppLaunchCountUpToLimitUseCase(
        gh<_i491.AppPreferencesRepository>(),
      ),
    );
    gh.factory<_i76.GetIsFirstAppLaunchUseCase>(
      () =>
          _i76.GetIsFirstAppLaunchUseCase(gh<_i491.AppPreferencesRepository>()),
    );
    gh.factory<_i368.WordsListBloc>(
      () => _i368.WordsListBloc(
        gh<_i398.GetWordsUseCase>(),
        gh<_i76.GetIsFirstAppLaunchUseCase>(),
        gh<_i72.WordUiModelMapper>(),
        gh<_i974.Logger>(),
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
        gh<_i947.OnboardingRepository>(),
        gh<_i896.GetIsOnboardingCompletedUseCase>(),
        gh<_i242.GetCompletedOnboardingStepsUseCase>(),
        gh<_i422.GetInitialOnboardingStepUseCase>(),
        gh<_i671.SaveCompletedOnboardingStepUseCase>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i859.AppStartupManager>(
      () => _i859.AppStartupManager(
        gh<_i288.IncrementAppLaunchCountUpToLimitUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i411.GetItModule {}
