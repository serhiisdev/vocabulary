// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'words_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WordsListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordsListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WordsListEvent()';
}


}

/// @nodoc
class $WordsListEventCopyWith<$Res>  {
$WordsListEventCopyWith(WordsListEvent _, $Res Function(WordsListEvent) __);
}


/// @nodoc


class _Started implements WordsListEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WordsListEvent.started()';
}


}




/// @nodoc


class _AnnounceWord implements WordsListEvent {
  const _AnnounceWord(this.word);
  

 final  WordUiModel word;

/// Create a copy of WordsListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnounceWordCopyWith<_AnnounceWord> get copyWith => __$AnnounceWordCopyWithImpl<_AnnounceWord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnounceWord&&(identical(other.word, word) || other.word == word));
}


@override
int get hashCode => Object.hash(runtimeType,word);

@override
String toString() {
  return 'WordsListEvent.announceWord(word: $word)';
}


}

/// @nodoc
abstract mixin class _$AnnounceWordCopyWith<$Res> implements $WordsListEventCopyWith<$Res> {
  factory _$AnnounceWordCopyWith(_AnnounceWord value, $Res Function(_AnnounceWord) _then) = __$AnnounceWordCopyWithImpl;
@useResult
$Res call({
 WordUiModel word
});


$WordUiModelCopyWith<$Res> get word;

}
/// @nodoc
class __$AnnounceWordCopyWithImpl<$Res>
    implements _$AnnounceWordCopyWith<$Res> {
  __$AnnounceWordCopyWithImpl(this._self, this._then);

  final _AnnounceWord _self;
  final $Res Function(_AnnounceWord) _then;

/// Create a copy of WordsListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? word = null,}) {
  return _then(_AnnounceWord(
null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as WordUiModel,
  ));
}

/// Create a copy of WordsListEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WordUiModelCopyWith<$Res> get word {
  
  return $WordUiModelCopyWith<$Res>(_self.word, (value) {
    return _then(_self.copyWith(word: value));
  });
}
}

/// @nodoc


class _SubscribeToAudioPlayerErrors implements WordsListEvent {
  const _SubscribeToAudioPlayerErrors();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscribeToAudioPlayerErrors);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WordsListEvent._subscribeToAudioPlayerErrors()';
}


}




/// @nodoc
mixin _$WordsListState {

 BlocStatus get wordsLoadingStatus; BlocStatus get wordAnnouncingStatus; List<WordUiModel> get words; bool get isFirstAppLaunch;
/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordsListStateCopyWith<WordsListState> get copyWith => _$WordsListStateCopyWithImpl<WordsListState>(this as WordsListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordsListState&&(identical(other.wordsLoadingStatus, wordsLoadingStatus) || other.wordsLoadingStatus == wordsLoadingStatus)&&(identical(other.wordAnnouncingStatus, wordAnnouncingStatus) || other.wordAnnouncingStatus == wordAnnouncingStatus)&&const DeepCollectionEquality().equals(other.words, words)&&(identical(other.isFirstAppLaunch, isFirstAppLaunch) || other.isFirstAppLaunch == isFirstAppLaunch));
}


@override
int get hashCode => Object.hash(runtimeType,wordsLoadingStatus,wordAnnouncingStatus,const DeepCollectionEquality().hash(words),isFirstAppLaunch);

@override
String toString() {
  return 'WordsListState(wordsLoadingStatus: $wordsLoadingStatus, wordAnnouncingStatus: $wordAnnouncingStatus, words: $words, isFirstAppLaunch: $isFirstAppLaunch)';
}


}

/// @nodoc
abstract mixin class $WordsListStateCopyWith<$Res>  {
  factory $WordsListStateCopyWith(WordsListState value, $Res Function(WordsListState) _then) = _$WordsListStateCopyWithImpl;
@useResult
$Res call({
 BlocStatus wordsLoadingStatus, BlocStatus wordAnnouncingStatus, List<WordUiModel> words, bool isFirstAppLaunch
});


$BlocStatusCopyWith<dynamic, $Res> get wordsLoadingStatus;$BlocStatusCopyWith<dynamic, $Res> get wordAnnouncingStatus;

}
/// @nodoc
class _$WordsListStateCopyWithImpl<$Res>
    implements $WordsListStateCopyWith<$Res> {
  _$WordsListStateCopyWithImpl(this._self, this._then);

  final WordsListState _self;
  final $Res Function(WordsListState) _then;

/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wordsLoadingStatus = null,Object? wordAnnouncingStatus = null,Object? words = null,Object? isFirstAppLaunch = null,}) {
  return _then(_self.copyWith(
wordsLoadingStatus: null == wordsLoadingStatus ? _self.wordsLoadingStatus : wordsLoadingStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,wordAnnouncingStatus: null == wordAnnouncingStatus ? _self.wordAnnouncingStatus : wordAnnouncingStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<WordUiModel>,isFirstAppLaunch: null == isFirstAppLaunch ? _self.isFirstAppLaunch : isFirstAppLaunch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<dynamic, $Res> get wordsLoadingStatus {
  
  return $BlocStatusCopyWith<dynamic, $Res>(_self.wordsLoadingStatus, (value) {
    return _then(_self.copyWith(wordsLoadingStatus: value));
  });
}/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<dynamic, $Res> get wordAnnouncingStatus {
  
  return $BlocStatusCopyWith<dynamic, $Res>(_self.wordAnnouncingStatus, (value) {
    return _then(_self.copyWith(wordAnnouncingStatus: value));
  });
}
}


/// @nodoc


class _WordsListState implements WordsListState {
  const _WordsListState({this.wordsLoadingStatus = const BlocStatus.initial(), this.wordAnnouncingStatus = const BlocStatus.initial(), final  List<WordUiModel> words = const [], required this.isFirstAppLaunch}): _words = words;
  

@override@JsonKey() final  BlocStatus wordsLoadingStatus;
@override@JsonKey() final  BlocStatus wordAnnouncingStatus;
 final  List<WordUiModel> _words;
@override@JsonKey() List<WordUiModel> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}

@override final  bool isFirstAppLaunch;

/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordsListStateCopyWith<_WordsListState> get copyWith => __$WordsListStateCopyWithImpl<_WordsListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordsListState&&(identical(other.wordsLoadingStatus, wordsLoadingStatus) || other.wordsLoadingStatus == wordsLoadingStatus)&&(identical(other.wordAnnouncingStatus, wordAnnouncingStatus) || other.wordAnnouncingStatus == wordAnnouncingStatus)&&const DeepCollectionEquality().equals(other._words, _words)&&(identical(other.isFirstAppLaunch, isFirstAppLaunch) || other.isFirstAppLaunch == isFirstAppLaunch));
}


@override
int get hashCode => Object.hash(runtimeType,wordsLoadingStatus,wordAnnouncingStatus,const DeepCollectionEquality().hash(_words),isFirstAppLaunch);

@override
String toString() {
  return 'WordsListState(wordsLoadingStatus: $wordsLoadingStatus, wordAnnouncingStatus: $wordAnnouncingStatus, words: $words, isFirstAppLaunch: $isFirstAppLaunch)';
}


}

/// @nodoc
abstract mixin class _$WordsListStateCopyWith<$Res> implements $WordsListStateCopyWith<$Res> {
  factory _$WordsListStateCopyWith(_WordsListState value, $Res Function(_WordsListState) _then) = __$WordsListStateCopyWithImpl;
@override @useResult
$Res call({
 BlocStatus wordsLoadingStatus, BlocStatus wordAnnouncingStatus, List<WordUiModel> words, bool isFirstAppLaunch
});


@override $BlocStatusCopyWith<dynamic, $Res> get wordsLoadingStatus;@override $BlocStatusCopyWith<dynamic, $Res> get wordAnnouncingStatus;

}
/// @nodoc
class __$WordsListStateCopyWithImpl<$Res>
    implements _$WordsListStateCopyWith<$Res> {
  __$WordsListStateCopyWithImpl(this._self, this._then);

  final _WordsListState _self;
  final $Res Function(_WordsListState) _then;

/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wordsLoadingStatus = null,Object? wordAnnouncingStatus = null,Object? words = null,Object? isFirstAppLaunch = null,}) {
  return _then(_WordsListState(
wordsLoadingStatus: null == wordsLoadingStatus ? _self.wordsLoadingStatus : wordsLoadingStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,wordAnnouncingStatus: null == wordAnnouncingStatus ? _self.wordAnnouncingStatus : wordAnnouncingStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<WordUiModel>,isFirstAppLaunch: null == isFirstAppLaunch ? _self.isFirstAppLaunch : isFirstAppLaunch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<dynamic, $Res> get wordsLoadingStatus {
  
  return $BlocStatusCopyWith<dynamic, $Res>(_self.wordsLoadingStatus, (value) {
    return _then(_self.copyWith(wordsLoadingStatus: value));
  });
}/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlocStatusCopyWith<dynamic, $Res> get wordAnnouncingStatus {
  
  return $BlocStatusCopyWith<dynamic, $Res>(_self.wordAnnouncingStatus, (value) {
    return _then(_self.copyWith(wordAnnouncingStatus: value));
  });
}
}

// dart format on
