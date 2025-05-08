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
import 'package:vocabulary/domain/use_cases/onboarding/save_completed_onboarding_step_use_case.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
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
  final SaveCompletedOnboardingStepUseCase _saveCompletedOnboardingStepUseCase;
  final Logger _log;
  OnboardingBloc(
    this._onboardingRepository,
    this._getIsOnboardingCompletedUseCase,
    this._getCompletedOnboardingStepsUseCase,
    this._getInitialOnboardingStepUseCase,
    this._saveCompletedOnboardingStepUseCase,
    this._log,
  ) : super(OnboardingState.initial) {
    on<_Started>(_onStarted);
    on<_MarkStepAsCompleted>(_onMarkStepAsCompleted);
    on<_StepChanged>(_onStepChanged);
    on<_GoToNextStep>(_onGoToNextStep);
    on<_GoToPreviousStep>(_onGoToPreviousStep);
    on<_Skip>(_onSkip);

    on<_HowDidYouHearAboutUsSelected>(_onHowDidYouHearAboutUsSelected);
    on<_NumOfWordsSelected>(_onNumOfWordsSelected);
    on<_VocabularyLevelSelected>(_onVocabularyLevelSelected);
    on<_GoalPurposeSelected>(_onGoalPurposeSelected);
    on<_TopicsSelected>(_onTopicsSelected);
    on<_GoalDaysSelected>(_onGoalDaysSelected);
    on<_GenderSelected>(_onGenderSelected);
    on<_HowOldAreYouSelected>(_onHowOldAreYouSelected);
  }

  void _onStarted(_Started event, Emitter<OnboardingState> emit) {
    try {
      final isOnboardingCompleted = _getIsOnboardingCompletedUseCase.call();
      if (isOnboardingCompleted) {
        emit(
          state.copyWith(
            status: BlocStatus.success(null),
            isOnboardingCompleted: true,
          ),
        );
      }
      final allSteps = OnboardingStep.values;
      final allStepsUi = allSteps.map(OnboardingStepUi.fromOnboardingStep);
      final completedSteps = _getCompletedOnboardingStepsUseCase.call();
      final completedStepsUi = completedSteps.map(
        OnboardingStepUi.fromOnboardingStep,
      );
      final initialStep = _getInitialOnboardingStepUseCase.call(
        allSteps: allSteps,
        completedSteps: completedSteps,
      );

      final initialStepIndex = allSteps.indexOf(initialStep);

      emit(
        state.copyWith(
          status: BlocStatus.success(null),
          steps: allStepsUi.toSet(),
          isOnboardingCompleted: isOnboardingCompleted,
          completedSteps: completedStepsUi.toSet(),
          currentStepIndex: initialStepIndex,
        ),
      );
    } catch (error, stackTrace) {
      emit(state.copyWith(status: BlocStatus.error(error)));
      _log.e(error, stackTrace: stackTrace);
    }
  }

  Future<void> _onMarkStepAsCompleted(
    _MarkStepAsCompleted event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      emit(state.copyWith(completeStepStatus: BlocStatus.loading()));
      await _saveCompletedOnboardingStepUseCase.call(
        event.step.toOnboardingStep(),
      );
      emit(state.copyWith(completeStepStatus: BlocStatus.success(null)));
    } catch (error, stackTrace) {
      emit(state.copyWith(completeStepStatus: BlocStatus.error(error)));
      _log.e(error, stackTrace: stackTrace);
    }
  }

  void _onStepChanged(_StepChanged event, Emitter<OnboardingState> emit) {
    if (event.currentStepIndex == state.currentStepIndex) return;
    emit(state.copyWith(currentStepIndex: event.currentStepIndex));
  }

  void _onGoToNextStep(_GoToNextStep event, Emitter<OnboardingState> emit) {
    if (!state.hasNextStep) {
      _onboardingRepository.setIsOnboardingCompleted(true);
      emit(state.copyWith(isOnboardingCompleted: true));
      return;
    }
    final nextStepIndex = state.nextStepIndex;
    emit(state.copyWith(currentStepIndex: nextStepIndex));
  }

  void _onGoToPreviousStep(
    _GoToPreviousStep event,
    Emitter<OnboardingState> emit,
  ) {
    final previousStepIndex = state.previousStepIndex;
    emit(state.copyWith(currentStepIndex: previousStepIndex));
  }

  void _onSkip(_Skip event, Emitter<OnboardingState> emit) {
    add(OnboardingEvent.goToNextStep());
  }

  void _onHowDidYouHearAboutUsSelected(
    _HowDidYouHearAboutUsSelected event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.howDidYouHearAboutUs == event.item) {
      add(const OnboardingEvent.goToNextStep());
      return;
    }
    emit(state.copyWith(howDidYouHearAboutUs: event.item));
  }

  void _onNumOfWordsSelected(
    _NumOfWordsSelected event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.numOfWords == event.item) {
      add(const OnboardingEvent.goToNextStep());
      return;
    }
    emit(state.copyWith(numOfWords: event.item));
  }

  void _onVocabularyLevelSelected(
    _VocabularyLevelSelected event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.vocabularyLevel == event.item) {
      add(const OnboardingEvent.goToNextStep());
      return;
    }
    emit(state.copyWith(vocabularyLevel: event.item));
  }

  void _onGoalPurposeSelected(
    _GoalPurposeSelected event,
    Emitter<OnboardingState> emit,
  ) {
    final currentGoalsPurpose = state.goalsPurpose.toSet();
    currentGoalsPurpose.contains(event.item)
        ? currentGoalsPurpose.remove(event.item)
        : currentGoalsPurpose.add(event.item);

    emit(state.copyWith(goalsPurpose: currentGoalsPurpose));
  }

  void _onTopicsSelected(_TopicsSelected event, Emitter<OnboardingState> emit) {
    final currentTopics = state.topics.toSet();
    currentTopics.contains(event.item)
        ? currentTopics.remove(event.item)
        : currentTopics.add(event.item);
        
    emit(state.copyWith(topics: currentTopics));
  }

  void _onGoalDaysSelected(
    _GoalDaysSelected event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.goalDays == event.item) {
      add(const OnboardingEvent.goToNextStep());
      return;
    }
    emit(state.copyWith(goalDays: event.item));
  }

  void _onGenderSelected(_GenderSelected event, Emitter<OnboardingState> emit) {
    if (state.gender == event.item) {
      add(const OnboardingEvent.goToNextStep());
      return;
    }
    emit(state.copyWith(gender: event.item));
  }

  void _onHowOldAreYouSelected(
    _HowOldAreYouSelected event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.howOldAreYou == event.item) {
      add(const OnboardingEvent.goToNextStep());
      return;
    }
    emit(state.copyWith(howOldAreYou: event.item));
  }
}
