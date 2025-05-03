import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocabulary/app/core/theme/app_theme_extensions.dart';

final _appColorsScheme = AppThemeExtensions.buildAppColors();
final _appTypography = AppThemeExtensions.buildAppTypography();

abstract class AppTheme {
  static ThemeData build() {
    return ThemeData(
      brightness: Brightness.dark,
      extensions: [_appColorsScheme, _appTypography],
      scaffoldBackgroundColor: _appColorsScheme.background,
      textTheme: GoogleFonts.noticiaTextTextTheme(
        _textTheme.apply(
          bodyColor: _appColorsScheme.text,
          displayColor: _appColorsScheme.text,
        ),
      ),
      colorScheme: _colorScheme,
    );
  }
}

final _colorScheme = ColorScheme.fromSwatch(
  backgroundColor: _appColorsScheme.background,
  brightness: Brightness.dark,
);

final _textTheme = TextTheme(
  titleLarge: _appTypography.titleLarge,
  bodyMedium: _appTypography.bodyMedium,
  labelLarge: _appTypography.labelLargeBold,
);
