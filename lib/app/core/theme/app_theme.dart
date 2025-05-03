import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/theme/app_theme_extensions.dart';

final _appColorsScheme = AppThemeExtensions.buildAppColors();
final _appTypography = AppThemeExtensions.buildAppTypography();

abstract class AppTheme {
  static ThemeData build() {
    return ThemeData(
      brightness: Brightness.light,
      extensions: [_appColorsScheme, _appTypography],
      scaffoldBackgroundColor: _appColorsScheme.white,
      textTheme: _textTheme.apply(
        bodyColor: _appColorsScheme.text,
        displayColor: _appColorsScheme.text,
      ),
      colorScheme: _colorScheme,
    );
  }
}

final _colorScheme = ColorScheme.fromSwatch(
  backgroundColor: _appColorsScheme.white,
);

final _textTheme = TextTheme(
  displayLarge: _appTypography.displayLarge,
  titleLarge: _appTypography.titleLarge,
  bodyLarge: _appTypography.bodyLarge,
  labelLarge: _appTypography.labelLarge,
);
