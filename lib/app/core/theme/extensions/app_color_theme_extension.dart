import 'package:flutter/material.dart';

/// Theme extension for custom colors
class AppColorThemeExtension extends ThemeExtension<AppColorThemeExtension> {
  final Color white;
  final Color black;
  final Color text;

  const AppColorThemeExtension({
    required this.white,
    required this.black,
    required this.text,
  });

  @override
  ThemeExtension<AppColorThemeExtension> copyWith({
    Color? white,
    Color? black,
    Color? text,
  }) {
    return AppColorThemeExtension(
      white: white ?? this.white,
      black: black ?? this.black,
      text: text ?? this.text,
    );
  }

  @override
  ThemeExtension<AppColorThemeExtension> lerp(
    covariant ThemeExtension<AppColorThemeExtension>? other,
    double t,
  ) {
    if (other is! AppColorThemeExtension) return this;
    return AppColorThemeExtension(
      white: white.lerp(other.white, t),
      black: black.lerp(other.black, t),
      text: text.lerp(other.text, t),
    );
  }
}

extension _ColorExtension on Color {
  Color lerp(Color? other, double t) {
    return Color.lerp(this, other, t) ?? this;
  }
}
