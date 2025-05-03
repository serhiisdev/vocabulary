// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlocStatus<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlocStatus<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlocStatus<$T>()';
}


}

/// @nodoc
class $BlocStatusCopyWith<T,$Res>  {
$BlocStatusCopyWith(BlocStatus<T> _, $Res Function(BlocStatus<T>) __);
}


/// @nodoc


class BlocStatusInitial<T> implements BlocStatus<T> {
  const BlocStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlocStatusInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlocStatus<$T>.initial()';
}


}




/// @nodoc


class BlocStatusLoading<T> implements BlocStatus<T> {
  const BlocStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlocStatusLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlocStatus<$T>.loading()';
}


}




/// @nodoc


class BlocStatusSuccess<T> implements BlocStatus<T> {
  const BlocStatusSuccess(this.data);
  

 final  T data;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlocStatusSuccessCopyWith<T, BlocStatusSuccess<T>> get copyWith => _$BlocStatusSuccessCopyWithImpl<T, BlocStatusSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlocStatusSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BlocStatus<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $BlocStatusSuccessCopyWith<T,$Res> implements $BlocStatusCopyWith<T, $Res> {
  factory $BlocStatusSuccessCopyWith(BlocStatusSuccess<T> value, $Res Function(BlocStatusSuccess<T>) _then) = _$BlocStatusSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$BlocStatusSuccessCopyWithImpl<T,$Res>
    implements $BlocStatusSuccessCopyWith<T, $Res> {
  _$BlocStatusSuccessCopyWithImpl(this._self, this._then);

  final BlocStatusSuccess<T> _self;
  final $Res Function(BlocStatusSuccess<T>) _then;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(BlocStatusSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class BlocStatusError<T> implements BlocStatus<T> {
  const BlocStatusError(this.error);
  

 final  Object? error;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlocStatusErrorCopyWith<T, BlocStatusError<T>> get copyWith => _$BlocStatusErrorCopyWithImpl<T, BlocStatusError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlocStatusError<T>&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'BlocStatus<$T>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $BlocStatusErrorCopyWith<T,$Res> implements $BlocStatusCopyWith<T, $Res> {
  factory $BlocStatusErrorCopyWith(BlocStatusError<T> value, $Res Function(BlocStatusError<T>) _then) = _$BlocStatusErrorCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$BlocStatusErrorCopyWithImpl<T,$Res>
    implements $BlocStatusErrorCopyWith<T, $Res> {
  _$BlocStatusErrorCopyWithImpl(this._self, this._then);

  final BlocStatusError<T> _self;
  final $Res Function(BlocStatusError<T>) _then;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(BlocStatusError<T>(
freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
