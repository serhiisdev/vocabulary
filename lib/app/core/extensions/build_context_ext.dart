import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary/app/l10n/generated/app_localizations.dart';

extension BuildContextExt on BuildContext {
  GoRouter get router => GoRouter.of(this);
  ThemeData get theme => Theme.of(this);
  AppLocalizations get localizations => AppLocalizations.of(this)!;

  Size get screenSize => MediaQuery.sizeOf(this);
 
  void showErrorSnackBar() {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          'Something went wrong. Please try again.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[600],
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void clearSnackBars() {
    ScaffoldMessenger.of(this).clearSnackBars();
  }
}
