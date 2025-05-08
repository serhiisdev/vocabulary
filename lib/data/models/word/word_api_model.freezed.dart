// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordApiModel {

 String get id; String get word; String get transcription; String get definition; String get example;
/// Create a copy of WordApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordApiModelCopyWith<WordApiModel> get copyWith => _$WordApiModelCopyWithImpl<WordApiModel>(this as WordApiModel, _$identity);

  /// Serializes this WordApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.example, example) || other.example == example));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,transcription,definition,example);

@override
String toString() {
  return 'WordApiModel(id: $id, word: $word, transcription: $transcription, definition: $definition, example: $example)';
}


}

/// @nodoc
abstract mixin class $WordApiModelCopyWith<$Res>  {
  factory $WordApiModelCopyWith(WordApiModel value, $Res Function(WordApiModel) _then) = _$WordApiModelCopyWithImpl;
@useResult
$Res call({
 String id, String word, String transcription, String definition, String example
});




}
/// @nodoc
class _$WordApiModelCopyWithImpl<$Res>
    implements $WordApiModelCopyWith<$Res> {
  _$WordApiModelCopyWithImpl(this._self, this._then);

  final WordApiModel _self;
  final $Res Function(WordApiModel) _then;

/// Create a copy of WordApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? word = null,Object? transcription = null,Object? definition = null,Object? example = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,transcription: null == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WordApiModel implements WordApiModel {
  const _WordApiModel({required this.id, required this.word, required this.transcription, required this.definition, required this.example});
  factory _WordApiModel.fromJson(Map<String, dynamic> json) => _$WordApiModelFromJson(json);

@override final  String id;
@override final  String word;
@override final  String transcription;
@override final  String definition;
@override final  String example;

/// Create a copy of WordApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordApiModelCopyWith<_WordApiModel> get copyWith => __$WordApiModelCopyWithImpl<_WordApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.example, example) || other.example == example));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,transcription,definition,example);

@override
String toString() {
  return 'WordApiModel(id: $id, word: $word, transcription: $transcription, definition: $definition, example: $example)';
}


}

/// @nodoc
abstract mixin class _$WordApiModelCopyWith<$Res> implements $WordApiModelCopyWith<$Res> {
  factory _$WordApiModelCopyWith(_WordApiModel value, $Res Function(_WordApiModel) _then) = __$WordApiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String word, String transcription, String definition, String example
});




}
/// @nodoc
class __$WordApiModelCopyWithImpl<$Res>
    implements _$WordApiModelCopyWith<$Res> {
  __$WordApiModelCopyWithImpl(this._self, this._then);

  final _WordApiModel _self;
  final $Res Function(_WordApiModel) _then;

/// Create a copy of WordApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? word = null,Object? transcription = null,Object? definition = null,Object? example = null,}) {
  return _then(_WordApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,transcription: null == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
