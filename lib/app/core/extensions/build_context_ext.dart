import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary/app/l10n/generated/app_localizations.dart';

extension BuildContextExt on BuildContext {
  GoRouter get router => GoRouter.of(this);
  ThemeData get theme => Theme.of(this);
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
