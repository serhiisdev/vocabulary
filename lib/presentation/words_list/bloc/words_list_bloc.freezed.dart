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
mixin _$WordsListState {

 BlocStatus get status; List<WordUiModel> get words;
/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordsListStateCopyWith<WordsListState> get copyWith => _$WordsListStateCopyWithImpl<WordsListState>(this as WordsListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordsListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.words, words));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(words));

@override
String toString() {
  return 'WordsListState(status: $status, words: $words)';
}


}

/// @nodoc
abstract mixin class $WordsListStateCopyWith<$Res>  {
  factory $WordsListStateCopyWith(WordsListState value, $Res Function(WordsListState) _then) = _$WordsListStateCopyWithImpl;
@useResult
$Res call({
 BlocStatus status, List<WordUiModel> words
});


$BlocStatusCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class _$WordsListStateCopyWithImpl<$Res>
    implements $WordsListStateCopyWith<$Res> {
  _$WordsListStateCopyWithImpl(this._self, this._then);

  final WordsListState _self;
  final $Res Function(WordsListState) _then;

/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? words = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BlocStatus,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<WordUiModel>,
  ));
}
/// Create a copy of WordsListState
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


class _WordsListState implements WordsListState {
  const _WordsListState({this.status = const BlocStatus.initial(), final  List<WordUiModel> words = const []}): _words = words;
  

@override@JsonKey() final  BlocStatus status;
 final  List<WordUiModel> _words;
@override@JsonKey() List<WordUiModel> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}


/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordsListStateCopyWith<_WordsListState> get copyWith => __$WordsListStateCopyWithImpl<_WordsListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordsListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._words, _words));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_words));

@override
String toString() {
  return 'WordsListState(status: $status, words: $words)';
}


}

/// @nodoc
abstract mixin class _$WordsListStateCopyWith<$Res> implements $WordsListStateCopyWith<$Res> {
  factory _$WordsListStateCopyWith(_WordsListState value, $Res Function(_WordsListState) _then) = __$WordsListStateCopyWithImpl;
@override @useResult
$Res call({
 BlocStatus status, List<WordUiModel> words
});


@override $BlocStatusCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class __$WordsListStateCopyWithImpl<$Res>
    implements _$WordsListStateCopyWith<$Res> {
  __$WordsListStateCopyWithImpl(this._self, this._then);

  final _WordsListState _self;
  final $Res Function(_WordsListState) _then;

/// Create a copy of WordsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? words = null,}) {
  return _then(_WordsListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BlocStatus,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<WordUiModel>,
  ));
}

/// Create a copy of WordsListState
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
