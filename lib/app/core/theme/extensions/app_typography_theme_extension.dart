import 'package:flutter/material.dart';

/// Theme extension for custom text styles
class AppTypographyThemeExtension
    extends ThemeExtension<AppTypographyThemeExtension> {
  final TextStyle titleLarge;
  final TextStyle titleLargeBold;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLargeBold;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLargeBold;
  final TextStyle labelSmall;

  const AppTypographyThemeExtension({
    required this.titleLarge,
    required this.titleLargeBold,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLargeBold,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLargeBold,
    required this.labelSmall,
  });

  @override
  ThemeExtension<AppTypographyThemeExtension> copyWith({
    TextStyle? titleLarge,
    TextStyle? titleLargeBold,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLargeBold,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLargeBold,
    TextStyle? labelSmall,
  }) {
    return AppTypographyThemeExtension(
      titleLarge: titleLarge ?? this.titleLarge,
      titleLargeBold: titleLargeBold ?? this.titleLargeBold,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLargeBold: bodyLargeBold ?? this.bodyLargeBold,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLargeBold: labelLargeBold ?? this.labelLargeBold,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  @override
  ThemeExtension<AppTypographyThemeExtension> lerp(
    covariant ThemeExtension<AppTypographyThemeExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyThemeExtension) return this;
    return AppTypographyThemeExtension(
      titleLarge: titleLarge.lerp(other.titleLarge, t),
      titleLargeBold: titleLargeBold.lerp(other.titleLargeBold, t),
      titleMedium: titleMedium.lerp(other.titleMedium, t),
      titleSmall: titleSmall.lerp(other.titleSmall, t),
      bodyLargeBold: bodyLargeBold.lerp(other.bodyLargeBold, t),
      bodyMedium: bodyMedium.lerp(other.bodyMedium, t),
      bodySmall: bodySmall.lerp(other.bodySmall, t),
      labelLargeBold: labelLargeBold.lerp(other.labelLargeBold, t),
      labelSmall: labelSmall.lerp(other.labelSmall, t),
    );
  }
}

extension _TextStyleExtension on TextStyle {
  TextStyle lerp(TextStyle? other, double t) {
    return TextStyle.lerp(this, other, t) ?? this;
  }
}
