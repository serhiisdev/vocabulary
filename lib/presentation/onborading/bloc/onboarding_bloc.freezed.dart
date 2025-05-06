// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// @nodoc


class _MarkStepAsCompleted implements OnboardingEvent {
  const _MarkStepAsCompleted(this.step);
  

 final  OnboardingStepUi step;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkStepAsCompletedCopyWith<_MarkStepAsCompleted> get copyWith => __$MarkStepAsCompletedCopyWithImpl<_MarkStepAsCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkStepAsCompleted&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'OnboardingEvent.markStepAsCompleted(step: $step)';
}


}

/// @nodoc
abstract mixin class _$MarkStepAsCompletedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$MarkStepAsCompletedCopyWith(_MarkStepAsCompleted value, $Res Function(_MarkStepAsCompleted) _then) = __$MarkStepAsCompletedCopyWithImpl;
@useResult
$Res call({
 OnboardingStepUi step
});




}
/// @nodoc
class __$MarkStepAsCompletedCopyWithImpl<$Res>
    implements _$MarkStepAsCompletedCopyWith<$Res> {
  __$MarkStepAsCompletedCopyWithImpl(this._self, this._then);

  final _MarkStepAsCompleted _self;
  final $Res Function(_MarkStepAsCompleted) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(_MarkStepAsCompleted(
null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as OnboardingStepUi,
  ));
}


}

/// @nodoc


class _StepChanged implements OnboardingEvent {
  const _StepChanged(this.currentStepIndex);
  

 final  int currentStepIndex;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepChangedCopyWith<_StepChanged> get copyWith => __$StepChangedCopyWithImpl<_StepChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepChanged&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex));
}


@override
int get hashCode => Object.hash(runtimeType,currentStepIndex);

@override
String toString() {
  return 'OnboardingEvent.stepChanged(currentStepIndex: $currentStepIndex)';
}


}

/// @nodoc
abstract mixin class _$StepChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$StepChangedCopyWith(_StepChanged value, $Res Function(_StepChanged) _then) = __$StepChangedCopyWithImpl;
@useResult
$Res call({
 int currentStepIndex
});




}
/// @nodoc
class __$StepChangedCopyWithImpl<$Res>
    implements _$StepChangedCopyWith<$Res> {
  __$StepChangedCopyWithImpl(this._self, this._then);

  final _StepChanged _self;
  final $Res Function(_StepChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentStepIndex = null,}) {
  return _then(_StepChanged(
null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GoToNextStep implements OnboardingEvent {
  const _GoToNextStep();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToNextStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.goToNextStep()';
}


}




/// @nodoc


class _GoToPreviousStep implements OnboardingEvent {
  const _GoToPreviousStep();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToPreviousStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.goToPreviousStep()';
}


}




/// @nodoc


class _Skip implements OnboardingEvent {
  const _Skip();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Skip);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.skip()';
}


}




/// @nodoc
mixin _$OnboardingState {

 BlocStatus get status; bool get isOnboardingCompleted; Set<OnboardingStepUi> get steps; Set<OnboardingStepUi> get completedSteps; int get currentStepIndex;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.status, status) || other.status == status)&&(identical(other.isOnboardingCompleted, isOnboardingCompleted) || other.isOnboardingCompleted == isOnboardingCompleted)&&const DeepCollectionEquality().equals(other.steps, steps)&&const DeepCollectionEquality().equals(other.completedSteps, completedSteps)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex));
}


@override
int get hashCode => Object.hash(runtimeType,status,isOnboardingCompleted,const DeepCollectionEquality().hash(steps),const DeepCollectionEquality().hash(completedSteps),currentStepIndex);

@override
String toString() {
  return 'OnboardingState(status: $status, isOnboardingCompleted: $isOnboardingCompleted, steps: $steps, completedSteps: $completedSteps, currentStepIndex: $currentStepIndex)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 BlocStatus status, bool isOnboardingCompleted, Set<OnboardingStepUi> steps, Set<OnboardingStepUi> completedSteps, int currentStepIndex
});


$BlocStatusCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isOnboardingCompleted = null,Object? steps = null,Object? completedSteps = null,Object? currentStepIndex = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BlocStatus,isOnboardingCompleted: null == isOnboardingCompleted ? _self.isOnboardingCompleted : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as Set<OnboardingStepUi>,completedSteps: null == completedSteps ? _self.completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as Set<OnboardingStepUi>,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<dynamic, $Res> get status {
  
  return $BlocStatusCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.status = const BlocStatus.initial(), this.isOnboardingCompleted = false, required final  Set<OnboardingStepUi> steps, required final  Set<OnboardingStepUi> completedSteps, required this.currentStepIndex}): _steps = steps,_completedSteps = completedSteps;
  

@override@JsonKey() final  BlocStatus status;
@override@JsonKey() final  bool isOnboardingCompleted;
 final  Set<OnboardingStepUi> _steps;
@override Set<OnboardingStepUi> get steps {
  if (_steps is EqualUnmodifiableSetView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_steps);
}

 final  Set<OnboardingStepUi> _completedSteps;
@override Set<OnboardingStepUi> get completedSteps {
  if (_completedSteps is EqualUnmodifiableSetView) return _completedSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_completedSteps);
}

@override final  int currentStepIndex;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.status, status) || other.status == status)&&(identical(other.isOnboardingCompleted, isOnboardingCompleted) || other.isOnboardingCompleted == isOnboardingCompleted)&&const DeepCollectionEquality().equals(other._steps, _steps)&&const DeepCollectionEquality().equals(other._completedSteps, _completedSteps)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex));
}


@override
int get hashCode => Object.hash(runtimeType,status,isOnboardingCompleted,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_completedSteps),currentStepIndex);

@override
String toString() {
  return 'OnboardingState(status: $status, isOnboardingCompleted: $isOnboardingCompleted, steps: $steps, completedSteps: $completedSteps, currentStepIndex: $currentStepIndex)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 BlocStatus status, bool isOnboardingCompleted, Set<OnboardingStepUi> steps, Set<OnboardingStepUi> completedSteps, int currentStepIndex
});


@override $BlocStatusCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isOnboardingCompleted = null,Object? steps = null,Object? completedSteps = null,Object? currentStepIndex = null,}) {
  return _then(_OnboardingState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BlocStatus,isOnboardingCompleted: null == isOnboardingCompleted ? _self.isOnboardingCompleted : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as Set<OnboardingStepUi>,completedSteps: null == completedSteps ? _self._completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as Set<OnboardingStepUi>,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<dynamic, $Res> get status {
  
  return $BlocStatusCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
