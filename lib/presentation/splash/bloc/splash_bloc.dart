import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Logger _log;
  SplashBloc(
    this._log,
  ) : super(const SplashState()) {
    on<_Started>(_onStarted, transformer: droppable());
  }


  Future<void> _onStarted(_Started event, Emitter<SplashState> emit) async {
    try {
      emit(state.copyWith(status: const BlocStatus.loading()));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: const BlocStatus.success(null)));
    } catch (error, stackTrace) {
      _log.e(runtimeType.toString(), error: error, stackTrace: stackTrace);
    }
  }
}