import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/theme/app_theme.dart';
import 'package:vocabulary/app/l10n/generated/app_localizations.dart';
import 'package:vocabulary/app/router/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.build(),
      routerConfig: AppRouterProvider.router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
