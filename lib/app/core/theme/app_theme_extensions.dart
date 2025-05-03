import 'package:vocabulary/app/core/theme/config/app_colors.dart';
import 'package:vocabulary/app/core/theme/config/app_typography.dart';
import 'package:vocabulary/app/core/theme/extensions/app_color_theme_extension.dart';
import 'package:vocabulary/app/core/theme/extensions/app_typography_theme_extension.dart';

abstract class AppThemeExtensions {
  static AppColorThemeExtension buildAppColors() => AppColorThemeExtension(
    white: AppColors.white,
    black: AppColors.black,
    text: AppColors.text,
  );
  static AppTypographyThemeExtension buildAppTypography() =>
      AppTypographyThemeExtension(
        displayLarge: AppTypography.displayLarge,
        titleLarge: AppTypography.titleLarge,
        bodyLarge: AppTypography.bodyLarge,
        labelLarge: AppTypography.labelLarge,
      );
}
