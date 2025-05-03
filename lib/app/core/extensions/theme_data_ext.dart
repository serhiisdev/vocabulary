import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/theme/extensions/app_color_theme_extension.dart';
import 'package:vocabulary/app/core/theme/extensions/app_typography_theme_extension.dart';

extension ThemeDataExtension on ThemeData {
  AppColorThemeExtension get appColors => extension<AppColorThemeExtension>()!;

  AppTypographyThemeExtension get appTypography =>
      extension<AppTypographyThemeExtension>()!;
}
