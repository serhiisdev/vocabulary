import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';
import 'package:vocabulary/domain/use_cases/onboarding/get_is_oboarding_completed_use_case.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetIsOnboardingCompletedUseCase _getIsOnboardingCompletedUseCase;
  final Logger _log;
  SplashBloc(
    this._getIsOnboardingCompletedUseCase,
    this._log,
  ) : super(const SplashState()) {
    on<_Started>(_onStarted);
  }


  void _onStarted(_Started event, Emitter<SplashState> emit)  {
    try {
      emit(state.copyWith(status: const BlocStatus.loading()));
      final isOnboardingCompleted =
           _getIsOnboardingCompletedUseCase.call();
      emit(state.copyWith(
        status: const BlocStatus.success(null),
        isOnboardingCompleted: isOnboardingCompleted,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status:  BlocStatus.error(error)));
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
    }
  }
}