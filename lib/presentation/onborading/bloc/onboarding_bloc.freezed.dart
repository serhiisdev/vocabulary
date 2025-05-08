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


class _Started implements OnboardingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.started()';
}


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


class _HowDidYouHearAboutUsSelected implements OnboardingEvent {
  const _HowDidYouHearAboutUsSelected(this.item);
  

 final  OnboardingHowDidYouHearAboutUs item;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HowDidYouHearAboutUsSelectedCopyWith<_HowDidYouHearAboutUsSelected> get copyWith => __$HowDidYouHearAboutUsSelectedCopyWithImpl<_HowDidYouHearAboutUsSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HowDidYouHearAboutUsSelected&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OnboardingEvent.howDidYouHearAboutUsSelected(item: $item)';
}


}

/// @nodoc
abstract mixin class _$HowDidYouHearAboutUsSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$HowDidYouHearAboutUsSelectedCopyWith(_HowDidYouHearAboutUsSelected value, $Res Function(_HowDidYouHearAboutUsSelected) _then) = __$HowDidYouHearAboutUsSelectedCopyWithImpl;
@useResult
$Res call({
 OnboardingHowDidYouHearAboutUs item
});




}
/// @nodoc
class __$HowDidYouHearAboutUsSelectedCopyWithImpl<$Res>
    implements _$HowDidYouHearAboutUsSelectedCopyWith<$Res> {
  __$HowDidYouHearAboutUsSelectedCopyWithImpl(this._self, this._then);

  final _HowDidYouHearAboutUsSelected _self;
  final $Res Function(_HowDidYouHearAboutUsSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_HowDidYouHearAboutUsSelected(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OnboardingHowDidYouHearAboutUs,
  ));
}


}

/// @nodoc


class _NumOfWordsSelected implements OnboardingEvent {
  const _NumOfWordsSelected(this.item);
  

 final  OnboardingNumOfWords item;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NumOfWordsSelectedCopyWith<_NumOfWordsSelected> get copyWith => __$NumOfWordsSelectedCopyWithImpl<_NumOfWordsSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NumOfWordsSelected&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OnboardingEvent.numOfWordsSelected(item: $item)';
}


}

/// @nodoc
abstract mixin class _$NumOfWordsSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$NumOfWordsSelectedCopyWith(_NumOfWordsSelected value, $Res Function(_NumOfWordsSelected) _then) = __$NumOfWordsSelectedCopyWithImpl;
@useResult
$Res call({
 OnboardingNumOfWords item
});




}
/// @nodoc
class __$NumOfWordsSelectedCopyWithImpl<$Res>
    implements _$NumOfWordsSelectedCopyWith<$Res> {
  __$NumOfWordsSelectedCopyWithImpl(this._self, this._then);

  final _NumOfWordsSelected _self;
  final $Res Function(_NumOfWordsSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_NumOfWordsSelected(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OnboardingNumOfWords,
  ));
}


}

/// @nodoc


class _VocabularyLevelSelected implements OnboardingEvent {
  const _VocabularyLevelSelected(this.item);
  

 final  OnboardingVocabularyLevel item;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyLevelSelectedCopyWith<_VocabularyLevelSelected> get copyWith => __$VocabularyLevelSelectedCopyWithImpl<_VocabularyLevelSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyLevelSelected&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OnboardingEvent.vocabularyLevelSelected(item: $item)';
}


}

/// @nodoc
abstract mixin class _$VocabularyLevelSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$VocabularyLevelSelectedCopyWith(_VocabularyLevelSelected value, $Res Function(_VocabularyLevelSelected) _then) = __$VocabularyLevelSelectedCopyWithImpl;
@useResult
$Res call({
 OnboardingVocabularyLevel item
});




}
/// @nodoc
class __$VocabularyLevelSelectedCopyWithImpl<$Res>
    implements _$VocabularyLevelSelectedCopyWith<$Res> {
  __$VocabularyLevelSelectedCopyWithImpl(this._self, this._then);

  final _VocabularyLevelSelected _self;
  final $Res Function(_VocabularyLevelSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_VocabularyLevelSelected(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OnboardingVocabularyLevel,
  ));
}


}

/// @nodoc


class _GoalPurposeSelected implements OnboardingEvent {
  const _GoalPurposeSelected(this.item);
  

 final  OnboardingGoalPurpose item;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalPurposeSelectedCopyWith<_GoalPurposeSelected> get copyWith => __$GoalPurposeSelectedCopyWithImpl<_GoalPurposeSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalPurposeSelected&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OnboardingEvent.goalPurposeSelected(item: $item)';
}


}

/// @nodoc
abstract mixin class _$GoalPurposeSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$GoalPurposeSelectedCopyWith(_GoalPurposeSelected value, $Res Function(_GoalPurposeSelected) _then) = __$GoalPurposeSelectedCopyWithImpl;
@useResult
$Res call({
 OnboardingGoalPurpose item
});




}
/// @nodoc
class __$GoalPurposeSelectedCopyWithImpl<$Res>
    implements _$GoalPurposeSelectedCopyWith<$Res> {
  __$GoalPurposeSelectedCopyWithImpl(this._self, this._then);

  final _GoalPurposeSelected _self;
  final $Res Function(_GoalPurposeSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_GoalPurposeSelected(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OnboardingGoalPurpose,
  ));
}


}

/// @nodoc


class _TopicsSelected implements OnboardingEvent {
  const _TopicsSelected(this.item);
  

 final  OnboardingTopics item;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicsSelectedCopyWith<_TopicsSelected> get copyWith => __$TopicsSelectedCopyWithImpl<_TopicsSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicsSelected&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OnboardingEvent.topicsSelected(item: $item)';
}


}

/// @nodoc
abstract mixin class _$TopicsSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$TopicsSelectedCopyWith(_TopicsSelected value, $Res Function(_TopicsSelected) _then) = __$TopicsSelectedCopyWithImpl;
@useResult
$Res call({
 OnboardingTopics item
});




}
/// @nodoc
class __$TopicsSelectedCopyWithImpl<$Res>
    implements _$TopicsSelectedCopyWith<$Res> {
  __$TopicsSelectedCopyWithImpl(this._self, this._then);

  final _TopicsSelected _self;
  final $Res Function(_TopicsSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_TopicsSelected(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OnboardingTopics,
  ));
}


}

/// @nodoc


class _GoalDaysSelected implements OnboardingEvent {
  const _GoalDaysSelected(this.item);
  

 final  OnboardingGoalDays item;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalDaysSelectedCopyWith<_GoalDaysSelected> get copyWith => __$GoalDaysSelectedCopyWithImpl<_GoalDaysSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalDaysSelected&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OnboardingEvent.goalDaysSelected(item: $item)';
}


}

/// @nodoc
abstract mixin class _$GoalDaysSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$GoalDaysSelectedCopyWith(_GoalDaysSelected value, $Res Function(_GoalDaysSelected) _then) = __$GoalDaysSelectedCopyWithImpl;
@useResult
$Res call({
 OnboardingGoalDays item
});




}
/// @nodoc
class __$GoalDaysSelectedCopyWithImpl<$Res>
    implements _$GoalDaysSelectedCopyWith<$Res> {
  __$GoalDaysSelectedCopyWithImpl(this._self, this._then);

  final _GoalDaysSelected _self;
  final $Res Function(_GoalDaysSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_GoalDaysSelected(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OnboardingGoalDays,
  ));
}


}

/// @nodoc


class _GenderSelected implements OnboardingEvent {
  const _GenderSelected(this.item);
  

 final  OnboardingGender item;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenderSelectedCopyWith<_GenderSelected> get copyWith => __$GenderSelectedCopyWithImpl<_GenderSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenderSelected&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OnboardingEvent.genderSelected(item: $item)';
}


}

/// @nodoc
abstract mixin class _$GenderSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$GenderSelectedCopyWith(_GenderSelected value, $Res Function(_GenderSelected) _then) = __$GenderSelectedCopyWithImpl;
@useResult
$Res call({
 OnboardingGender item
});




}
/// @nodoc
class __$GenderSelectedCopyWithImpl<$Res>
    implements _$GenderSelectedCopyWith<$Res> {
  __$GenderSelectedCopyWithImpl(this._self, this._then);

  final _GenderSelected _self;
  final $Res Function(_GenderSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_GenderSelected(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OnboardingGender,
  ));
}


}

/// @nodoc


class _HowOldAreYouSelected implements OnboardingEvent {
  const _HowOldAreYouSelected(this.item);
  

 final  OnboardingHowOldAreYou item;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HowOldAreYouSelectedCopyWith<_HowOldAreYouSelected> get copyWith => __$HowOldAreYouSelectedCopyWithImpl<_HowOldAreYouSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HowOldAreYouSelected&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OnboardingEvent.howOldAreYouSelected(item: $item)';
}


}

/// @nodoc
abstract mixin class _$HowOldAreYouSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$HowOldAreYouSelectedCopyWith(_HowOldAreYouSelected value, $Res Function(_HowOldAreYouSelected) _then) = __$HowOldAreYouSelectedCopyWithImpl;
@useResult
$Res call({
 OnboardingHowOldAreYou item
});




}
/// @nodoc
class __$HowOldAreYouSelectedCopyWithImpl<$Res>
    implements _$HowOldAreYouSelectedCopyWith<$Res> {
  __$HowOldAreYouSelectedCopyWithImpl(this._self, this._then);

  final _HowOldAreYouSelected _self;
  final $Res Function(_HowOldAreYouSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_HowOldAreYouSelected(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OnboardingHowOldAreYou,
  ));
}


}

/// @nodoc
mixin _$OnboardingState {

 BlocStatus get status; BlocStatus get completeStepStatus; bool get isOnboardingCompleted; Set<OnboardingStepUi> get steps; Set<OnboardingStepUi> get completedSteps; OnboardingHowDidYouHearAboutUs? get howDidYouHearAboutUs; OnboardingNumOfWords? get numOfWords; OnboardingVocabularyLevel? get vocabularyLevel; OnboardingGoalPurpose? get goalPurpose; OnboardingTopics? get topics; OnboardingGoalDays? get goalDays; OnboardingGender? get gender; OnboardingHowOldAreYou? get howOldAreYou; int get currentStepIndex;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.status, status) || other.status == status)&&(identical(other.completeStepStatus, completeStepStatus) || other.completeStepStatus == completeStepStatus)&&(identical(other.isOnboardingCompleted, isOnboardingCompleted) || other.isOnboardingCompleted == isOnboardingCompleted)&&const DeepCollectionEquality().equals(other.steps, steps)&&const DeepCollectionEquality().equals(other.completedSteps, completedSteps)&&(identical(other.howDidYouHearAboutUs, howDidYouHearAboutUs) || other.howDidYouHearAboutUs == howDidYouHearAboutUs)&&(identical(other.numOfWords, numOfWords) || other.numOfWords == numOfWords)&&(identical(other.vocabularyLevel, vocabularyLevel) || other.vocabularyLevel == vocabularyLevel)&&(identical(other.goalPurpose, goalPurpose) || other.goalPurpose == goalPurpose)&&(identical(other.topics, topics) || other.topics == topics)&&(identical(other.goalDays, goalDays) || other.goalDays == goalDays)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.howOldAreYou, howOldAreYou) || other.howOldAreYou == howOldAreYou)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex));
}


@override
int get hashCode => Object.hash(runtimeType,status,completeStepStatus,isOnboardingCompleted,const DeepCollectionEquality().hash(steps),const DeepCollectionEquality().hash(completedSteps),howDidYouHearAboutUs,numOfWords,vocabularyLevel,goalPurpose,topics,goalDays,gender,howOldAreYou,currentStepIndex);

@override
String toString() {
  return 'OnboardingState(status: $status, completeStepStatus: $completeStepStatus, isOnboardingCompleted: $isOnboardingCompleted, steps: $steps, completedSteps: $completedSteps, howDidYouHearAboutUs: $howDidYouHearAboutUs, numOfWords: $numOfWords, vocabularyLevel: $vocabularyLevel, goalPurpose: $goalPurpose, topics: $topics, goalDays: $goalDays, gender: $gender, howOldAreYou: $howOldAreYou, currentStepIndex: $currentStepIndex)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 BlocStatus status, BlocStatus completeStepStatus, bool isOnboardingCompleted, Set<OnboardingStepUi> steps, Set<OnboardingStepUi> completedSteps, OnboardingHowDidYouHearAboutUs? howDidYouHearAboutUs, OnboardingNumOfWords? numOfWords, OnboardingVocabularyLevel? vocabularyLevel, OnboardingGoalPurpose? goalPurpose, OnboardingTopics? topics, OnboardingGoalDays? goalDays, OnboardingGender? gender, OnboardingHowOldAreYou? howOldAreYou, int currentStepIndex
});


$BlocStatusCopyWith<dynamic, $Res> get status;$BlocStatusCopyWith<dynamic, $Res> get completeStepStatus;

}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? completeStepStatus = null,Object? isOnboardingCompleted = null,Object? steps = null,Object? completedSteps = null,Object? howDidYouHearAboutUs = freezed,Object? numOfWords = freezed,Object? vocabularyLevel = freezed,Object? goalPurpose = freezed,Object? topics = freezed,Object? goalDays = freezed,Object? gender = freezed,Object? howOldAreYou = freezed,Object? currentStepIndex = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BlocStatus,completeStepStatus: null == completeStepStatus ? _self.completeStepStatus : completeStepStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,isOnboardingCompleted: null == isOnboardingCompleted ? _self.isOnboardingCompleted : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as Set<OnboardingStepUi>,completedSteps: null == completedSteps ? _self.completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as Set<OnboardingStepUi>,howDidYouHearAboutUs: freezed == howDidYouHearAboutUs ? _self.howDidYouHearAboutUs : howDidYouHearAboutUs // ignore: cast_nullable_to_non_nullable
as OnboardingHowDidYouHearAboutUs?,numOfWords: freezed == numOfWords ? _self.numOfWords : numOfWords // ignore: cast_nullable_to_non_nullable
as OnboardingNumOfWords?,vocabularyLevel: freezed == vocabularyLevel ? _self.vocabularyLevel : vocabularyLevel // ignore: cast_nullable_to_non_nullable
as OnboardingVocabularyLevel?,goalPurpose: freezed == goalPurpose ? _self.goalPurpose : goalPurpose // ignore: cast_nullable_to_non_nullable
as OnboardingGoalPurpose?,topics: freezed == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as OnboardingTopics?,goalDays: freezed == goalDays ? _self.goalDays : goalDays // ignore: cast_nullable_to_non_nullable
as OnboardingGoalDays?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as OnboardingGender?,howOldAreYou: freezed == howOldAreYou ? _self.howOldAreYou : howOldAreYou // ignore: cast_nullable_to_non_nullable
as OnboardingHowOldAreYou?,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
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
}/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<dynamic, $Res> get completeStepStatus {
  
  return $BlocStatusCopyWith<dynamic, $Res>(_self.completeStepStatus, (value) {
    return _then(_self.copyWith(completeStepStatus: value));
  });
}
}


/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.status = const BlocStatus.initial(), this.completeStepStatus = const BlocStatus.initial(), this.isOnboardingCompleted = false, required final  Set<OnboardingStepUi> steps, required final  Set<OnboardingStepUi> completedSteps, this.howDidYouHearAboutUs, this.numOfWords, this.vocabularyLevel, this.goalPurpose, this.topics, this.goalDays, this.gender, this.howOldAreYou, required this.currentStepIndex}): _steps = steps,_completedSteps = completedSteps;
  

@override@JsonKey() final  BlocStatus status;
@override@JsonKey() final  BlocStatus completeStepStatus;
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

@override final  OnboardingHowDidYouHearAboutUs? howDidYouHearAboutUs;
@override final  OnboardingNumOfWords? numOfWords;
@override final  OnboardingVocabularyLevel? vocabularyLevel;
@override final  OnboardingGoalPurpose? goalPurpose;
@override final  OnboardingTopics? topics;
@override final  OnboardingGoalDays? goalDays;
@override final  OnboardingGender? gender;
@override final  OnboardingHowOldAreYou? howOldAreYou;
@override final  int currentStepIndex;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.status, status) || other.status == status)&&(identical(other.completeStepStatus, completeStepStatus) || other.completeStepStatus == completeStepStatus)&&(identical(other.isOnboardingCompleted, isOnboardingCompleted) || other.isOnboardingCompleted == isOnboardingCompleted)&&const DeepCollectionEquality().equals(other._steps, _steps)&&const DeepCollectionEquality().equals(other._completedSteps, _completedSteps)&&(identical(other.howDidYouHearAboutUs, howDidYouHearAboutUs) || other.howDidYouHearAboutUs == howDidYouHearAboutUs)&&(identical(other.numOfWords, numOfWords) || other.numOfWords == numOfWords)&&(identical(other.vocabularyLevel, vocabularyLevel) || other.vocabularyLevel == vocabularyLevel)&&(identical(other.goalPurpose, goalPurpose) || other.goalPurpose == goalPurpose)&&(identical(other.topics, topics) || other.topics == topics)&&(identical(other.goalDays, goalDays) || other.goalDays == goalDays)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.howOldAreYou, howOldAreYou) || other.howOldAreYou == howOldAreYou)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex));
}


@override
int get hashCode => Object.hash(runtimeType,status,completeStepStatus,isOnboardingCompleted,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_completedSteps),howDidYouHearAboutUs,numOfWords,vocabularyLevel,goalPurpose,topics,goalDays,gender,howOldAreYou,currentStepIndex);

@override
String toString() {
  return 'OnboardingState(status: $status, completeStepStatus: $completeStepStatus, isOnboardingCompleted: $isOnboardingCompleted, steps: $steps, completedSteps: $completedSteps, howDidYouHearAboutUs: $howDidYouHearAboutUs, numOfWords: $numOfWords, vocabularyLevel: $vocabularyLevel, goalPurpose: $goalPurpose, topics: $topics, goalDays: $goalDays, gender: $gender, howOldAreYou: $howOldAreYou, currentStepIndex: $currentStepIndex)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 BlocStatus status, BlocStatus completeStepStatus, bool isOnboardingCompleted, Set<OnboardingStepUi> steps, Set<OnboardingStepUi> completedSteps, OnboardingHowDidYouHearAboutUs? howDidYouHearAboutUs, OnboardingNumOfWords? numOfWords, OnboardingVocabularyLevel? vocabularyLevel, OnboardingGoalPurpose? goalPurpose, OnboardingTopics? topics, OnboardingGoalDays? goalDays, OnboardingGender? gender, OnboardingHowOldAreYou? howOldAreYou, int currentStepIndex
});


@override $BlocStatusCopyWith<dynamic, $Res> get status;@override $BlocStatusCopyWith<dynamic, $Res> get completeStepStatus;

}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? completeStepStatus = null,Object? isOnboardingCompleted = null,Object? steps = null,Object? completedSteps = null,Object? howDidYouHearAboutUs = freezed,Object? numOfWords = freezed,Object? vocabularyLevel = freezed,Object? goalPurpose = freezed,Object? topics = freezed,Object? goalDays = freezed,Object? gender = freezed,Object? howOldAreYou = freezed,Object? currentStepIndex = null,}) {
  return _then(_OnboardingState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BlocStatus,completeStepStatus: null == completeStepStatus ? _self.completeStepStatus : completeStepStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,isOnboardingCompleted: null == isOnboardingCompleted ? _self.isOnboardingCompleted : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as Set<OnboardingStepUi>,completedSteps: null == completedSteps ? _self._completedSteps : completedSteps // ignore: cast_nullable_to_non_nullable
as Set<OnboardingStepUi>,howDidYouHearAboutUs: freezed == howDidYouHearAboutUs ? _self.howDidYouHearAboutUs : howDidYouHearAboutUs // ignore: cast_nullable_to_non_nullable
as OnboardingHowDidYouHearAboutUs?,numOfWords: freezed == numOfWords ? _self.numOfWords : numOfWords // ignore: cast_nullable_to_non_nullable
as OnboardingNumOfWords?,vocabularyLevel: freezed == vocabularyLevel ? _self.vocabularyLevel : vocabularyLevel // ignore: cast_nullable_to_non_nullable
as OnboardingVocabularyLevel?,goalPurpose: freezed == goalPurpose ? _self.goalPurpose : goalPurpose // ignore: cast_nullable_to_non_nullable
as OnboardingGoalPurpose?,topics: freezed == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as OnboardingTopics?,goalDays: freezed == goalDays ? _self.goalDays : goalDays // ignore: cast_nullable_to_non_nullable
as OnboardingGoalDays?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as OnboardingGender?,howOldAreYou: freezed == howOldAreYou ? _self.howOldAreYou : howOldAreYou // ignore: cast_nullable_to_non_nullable
as OnboardingHowOldAreYou?,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
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
}/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<dynamic, $Res> get completeStepStatus {
  
  return $BlocStatusCopyWith<dynamic, $Res>(_self.completeStepStatus, (value) {
    return _then(_self.copyWith(completeStepStatus: value));
  });
}
}

// dart format on
