import 'package:vocabulary/app/core/theme/config/app_colors.dart';
import 'package:vocabulary/app/core/theme/config/app_typography.dart';
import 'package:vocabulary/app/core/theme/extensions/app_color_theme_extension.dart';
import 'package:vocabulary/app/core/theme/extensions/app_typography_theme_extension.dart';

abstract class AppThemeExtensions {
  static AppColorThemeExtension buildAppColors() => AppColorThemeExtension(
    white: AppColors.white,
    black: AppColors.black,
    text: AppColors.text,
    background: AppColors.background,
    buttonBackground: AppColors.buttonBackground,
    buttonForeground: AppColors.buttonForeground,
    shadowColor: AppColors.black,
    starColor: AppColors.starColor,
  );
  static AppTypographyThemeExtension buildAppTypography() =>
      AppTypographyThemeExtension(
        titleLarge: AppTypography.titleLarge,
        titleLargeBold: AppTypography.titleLargeBold,
        bodyLargeBold: AppTypography.bodyLargeBold,
        bodyMedium: AppTypography.bodyMedium,
        labelLargeBold: AppTypography.labelLargeBold,
        labelSmall: AppTypography.labelSmall,
      );
}
