import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary/app/di/get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
)
void configureDependencies() => getIt.init();
