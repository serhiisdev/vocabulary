import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:vocabulary/app/core/theme/app_system_ui_mode.dart';
import 'package:vocabulary/app/di/get_it.dart';
import 'package:vocabulary/app/main_app.dart';
import 'package:vocabulary/app/services/app_startup_manager.dart';

Future<void> bootstrap() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  AppSystemUiMode.setDefault();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await configureDependencies();
  await getIt<AppStartupManager>().initialize();
  runApp(const MainApp());
}
