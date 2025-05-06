import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/data/repositories/onboarding_repository.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';
import 'package:vocabulary/domain/models/onborading/onboarding_step.dart';
import 'package:vocabulary/domain/use_cases/onboarding/get_completed_oboarding_steps_use_case.dart';
import 'package:vocabulary/domain/use_cases/onboarding/get_is_oboarding_completed_use_case.dart';
import 'package:vocabulary/domain/use_cases/onboarding/get_initial_oboarding_step_use_case.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';
import 'dart:math' as math;

part 'onboarding_event.dart';
part 'onboarding_state.dart';
part 'onboarding_bloc.freezed.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository _onboardingRepository;
  final GetIsOnboardingCompletedUseCase _getIsOnboardingCompletedUseCase;
  final GetCompletedOnboardingStepsUseCase _getCompletedOnboardingStepsUseCase;
  final GetInitialOnboardingStepUseCase _getInitialOnboardingStepUseCase;
  final Logger _log;
  OnboardingBloc(
    this._onboardingRepository,
    this._getIsOnboardingCompletedUseCase,
    this._getCompletedOnboardingStepsUseCase,
    this._getInitialOnboardingStepUseCase,
    this._log,
  ) : super(
        _getInitialState(
          getIsOnboardingCompletedUseCase: _getIsOnboardingCompletedUseCase,
          getCompletedOnboardingStepsUseCase:
              _getCompletedOnboardingStepsUseCase,
          getInitialOnboardingStepUseCase: _getInitialOnboardingStepUseCase,
        ),
      ) {
    on<_MarkStepAsCompleted>(_onMarkStepAsCompleted, transformer: droppable());
    on<_StepChanged>(_onStepChanged);
    on<_GoToNextStep>(_onGoToNextStep);
    on<_GoToPreviousStep>(_onGoToPreviousStep);
    on<_Skip>(_onSkip);
  }

  static OnboardingState _getInitialState({
    required GetIsOnboardingCompletedUseCase getIsOnboardingCompletedUseCase,
    required GetCompletedOnboardingStepsUseCase
    getCompletedOnboardingStepsUseCase,
    required GetInitialOnboardingStepUseCase getInitialOnboardingStepUseCase,
  }) {
    final isOnboardingCompleted = getIsOnboardingCompletedUseCase.call();
    if (isOnboardingCompleted) {
      return OnboardingState.initial.copyWith(
        status: BlocStatus.success(null),
        isOnboardingCompleted: true,
      );
    }
    final allSteps = OnboardingStep.values;
    final allStepsUi = allSteps.map(OnboardingStepUi.fromOnboardingStep);
    final completedSteps = getCompletedOnboardingStepsUseCase.call();
    final completedStepsUi = completedSteps.map(
      OnboardingStepUi.fromOnboardingStep,
    );
    final initialStep = getInitialOnboardingStepUseCase.call(
      allSteps: allSteps,
      completedSteps: completedSteps,
    );

    final initialStepIndex = allSteps.indexOf(initialStep);

    return OnboardingState(
      status: BlocStatus.success(null),
      steps: allStepsUi.toSet(),
      isOnboardingCompleted: isOnboardingCompleted,
      completedSteps: completedStepsUi.toSet(),
      currentStepIndex: initialStepIndex,
    );
  }

  Future<void> _onMarkStepAsCompleted(
    _MarkStepAsCompleted event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(completedSteps: {...state.completedSteps, event.step}));
  }

  Future<void> _onStepChanged(
    _StepChanged event,
    Emitter<OnboardingState> emit,
  ) async {
    if (event.currentStepIndex == state.currentStepIndex) return;
    emit(state.copyWith(currentStepIndex: event.currentStepIndex));
  }

  Future<void> _onGoToNextStep(
    _GoToNextStep event,
    Emitter<OnboardingState> emit,
  ) async {
    final nextStepIndex = state.nextStepIndex;
    emit(state.copyWith(currentStepIndex: nextStepIndex));
  }

  Future<void> _onGoToPreviousStep(
    _GoToPreviousStep event,
    Emitter<OnboardingState> emit,
  ) async {
    final previousStepIndex = state.previousStepIndex;
    emit(state.copyWith(currentStepIndex: previousStepIndex));
  }

  Future<void> _onSkip(_Skip event, Emitter<OnboardingState> emit) async {
  }
}
