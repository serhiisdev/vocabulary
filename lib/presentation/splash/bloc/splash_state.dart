part of 'splash_bloc.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState({
    @Default(BlocStatus.initial()) BlocStatus status,
  }) = _SplashState;
}
