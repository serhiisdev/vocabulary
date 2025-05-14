import 'package:vocabulary/app/core/theme/config/app_colors.dart';
import 'package:vocabulary/app/core/theme/config/app_typography.dart';
import 'package:vocabulary/app/core/theme/extensions/app_color_theme_extension.dart';
import 'package:vocabulary/app/core/theme/extensions/app_typography_theme_extension.dart';

abstract class AppThemeExtensions {
  static AppColorThemeExtension buildAppColors() => AppColorThemeExtension(
    white: AppColors.white,
    black: AppColors.black,
    blue: AppColors.blue,
    text: AppColors.text,
    textV2: AppColors.textV2,
    background: AppColors.background,
    backgroundV2: AppColors.backgroundV2,
    buttonBackground: AppColors.buttonBackground,
    buttonForeground: AppColors.buttonForeground,
    shadowColor: AppColors.black,
    starColor: AppColors.starColor,
    error: AppColors.error,
  );
  static AppTypographyThemeExtension buildAppTypography() =>
      AppTypographyThemeExtension(
        titleLarge: AppTypography.titleLarge,
        titleLargeBold: AppTypography.titleLargeBold,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        bodyLargeBold: AppTypography.bodyLargeBold,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLargeBold: AppTypography.labelLargeBold,
        labelSmall: AppTypography.labelSmall,
      );
}
