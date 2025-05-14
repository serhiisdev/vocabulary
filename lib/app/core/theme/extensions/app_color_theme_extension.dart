import 'package:flutter/material.dart';

/// Theme extension for custom colors
class AppColorThemeExtension extends ThemeExtension<AppColorThemeExtension> {
  final Color white;
  final Color black;
  final Color blue;
  final Color text;
  final Color textV2;
  final Color background;
  final Color backgroundV2;
  final Color buttonBackground;
  final Color buttonForeground;
  final Color shadowColor;
  final Color starColor;
  final Color error;

  const AppColorThemeExtension({
    required this.white,
    required this.black,
    required this.blue,
    required this.text,
    required this.textV2,
    required this.background,
    required this.backgroundV2,
    required this.buttonBackground,
    required this.buttonForeground,
    required this.shadowColor,
    required this.starColor,
    required this.error,
  });

  @override
  ThemeExtension<AppColorThemeExtension> copyWith({
    Color? white,
    Color? black,
    Color? blue,
    Color? text,
    Color? textV2,
    Color? background,
    Color? backgroundV2,
    Color? buttonBackground,
    Color? buttonForeground,
    Color? shadowColor,
    Color? starColor,
    Color? error,
  }) {
    return AppColorThemeExtension(
      white: white ?? this.white,
      black: black ?? this.black,
      blue: blue ?? this.blue,
      text: text ?? this.text,
      textV2: textV2 ?? this.textV2,
      background: background ?? this.background,
      backgroundV2: backgroundV2 ?? this.backgroundV2,
      buttonBackground: buttonBackground ?? this.buttonBackground,
      buttonForeground: buttonForeground ?? this.buttonForeground,
      shadowColor: shadowColor ?? this.shadowColor,
      starColor: starColor ?? this.starColor,
      error: error ?? this.error,
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
      blue: blue.lerp(other.blue, t),
      text: text.lerp(other.text, t),
      textV2: textV2.lerp(other.textV2, t),
      background: background.lerp(other.background, t),
      backgroundV2: backgroundV2.lerp(other.backgroundV2, t),
      buttonBackground: buttonBackground.lerp(other.buttonBackground, t),
      buttonForeground: buttonForeground.lerp(other.buttonForeground, t),
      shadowColor: shadowColor.lerp(other.shadowColor, t),
      starColor: starColor.lerp(other.starColor, t),
      error: error.lerp(other.error, t),
    );
  }
}

extension _ColorExtension on Color {
  Color lerp(Color? other, double t) {
    return Color.lerp(this, other, t) ?? this;
  }
}
