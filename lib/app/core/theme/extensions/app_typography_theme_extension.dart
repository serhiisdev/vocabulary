import 'package:flutter/material.dart';

/// Theme extension for custom text styles
class AppTypographyThemeExtension
    extends ThemeExtension<AppTypographyThemeExtension> {
  final TextStyle displayLarge;
  final TextStyle titleLarge;
  final TextStyle bodyLarge;
  final TextStyle labelLarge;

  const AppTypographyThemeExtension({
    required this.displayLarge,
    required this.titleLarge,
    required this.bodyLarge,
    required this.labelLarge,
  });

  @override
  ThemeExtension<AppTypographyThemeExtension> copyWith({
    TextStyle? displayLarge,
    TextStyle? titleLarge,
    TextStyle? bodyLarge,
    TextStyle? labelLarge,
  }) {
    return AppTypographyThemeExtension(
      displayLarge: displayLarge ?? this.displayLarge,
      titleLarge: titleLarge ?? this.titleLarge,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      labelLarge: labelLarge ?? this.labelLarge,
    );
  }

  @override
  ThemeExtension<AppTypographyThemeExtension> lerp(
    covariant ThemeExtension<AppTypographyThemeExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyThemeExtension) return this;
    return AppTypographyThemeExtension(
      displayLarge: displayLarge.lerp(other.displayLarge, t),
      titleLarge: titleLarge.lerp(other.titleLarge, t),
      bodyLarge: bodyLarge.lerp(other.bodyLarge, t),
      labelLarge: labelLarge.lerp(other.labelLarge, t),
    );
  }
}

extension _TextStyleExtension on TextStyle {
  TextStyle lerp(TextStyle? other, double t) {
    return TextStyle.lerp(this, other, t) ?? this;
  }
}
