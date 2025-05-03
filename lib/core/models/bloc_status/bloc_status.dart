import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_status.freezed.dart';


@freezed
sealed class BlocStatus<T> with _$BlocStatus {
  const factory BlocStatus.initial() = BlocStatusInitial<T>;
  const factory BlocStatus.loading() = BlocStatusLoading<T>;
  const factory BlocStatus.success(T data) = BlocStatusSuccess<T>;
  const factory BlocStatus.error(Object? error) = BlocStatusError<T>;
}

extension BlocStatusX<T> on BlocStatus<T> {
  bool get isInitial => this is BlocStatusInitial;
  bool get isLoading => this is BlocStatusLoading;
  bool get isSuccess => this is BlocStatusSuccess;
  bool get isError => this is BlocStatusError;

  Object? get error => isError ? (this as BlocStatusError).error : null;
  T? get data => isSuccess ? (this as BlocStatusSuccess).data : null;
}
