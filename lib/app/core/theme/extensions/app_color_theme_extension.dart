import 'package:flutter/material.dart';

/// Theme extension for custom colors
class AppColorThemeExtension extends ThemeExtension<AppColorThemeExtension> {
  final Color white;
  final Color black;
  final Color text;
  final Color background;
  final Color buttonBackground;
  final Color buttonForeground;
  final Color shadowColor;
  final Color starColor;

  const AppColorThemeExtension({
    required this.white,
    required this.black,
    required this.text,
    required this.background,
    required this.buttonBackground,
    required this.buttonForeground,
    required this.shadowColor,
    required this.starColor,
  });

  @override
  ThemeExtension<AppColorThemeExtension> copyWith({
    Color? white,
    Color? black,
    Color? text,
    Color? background,
    Color? buttonBackground,
    Color? buttonForeground,
    Color? shadowColor,
    Color? starColor,
  }) {
    return AppColorThemeExtension(
      white: white ?? this.white,
      black: black ?? this.black,
      text: text ?? this.text,
      background: background ?? this.background,
      buttonBackground: buttonBackground ?? this.buttonBackground,
      buttonForeground: buttonForeground ?? this.buttonForeground,
      shadowColor: shadowColor ?? this.shadowColor,
      starColor: starColor ?? this.starColor,
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
      background: background.lerp(other.background, t),
      buttonBackground: buttonBackground.lerp(other.buttonBackground, t),
      buttonForeground: buttonForeground.lerp(other.buttonForeground, t),
      shadowColor: shadowColor.lerp(other.shadowColor, t),
      starColor: starColor.lerp(other.starColor, t),
    );
  }
}

extension _ColorExtension on Color {
  Color lerp(Color? other, double t) {
    return Color.lerp(this, other, t) ?? this;
  }
}
