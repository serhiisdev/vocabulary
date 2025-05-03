import 'package:flutter/material.dart';
import 'package:vocabulary/presentation/core/buttons/buttons/elevated_button_with_shadow.dart';

abstract class Buttons {
  static Widget elevatedButtonWithShadow(
    BuildContext context, {
    required void Function() onPressed,
    double borderRadius = 24,
    Color? backgroundColor,
    Color? shadowColor,
    required Widget child,
  }) {
    return ElevatedButtonWithShadow(
      onPressed: onPressed,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      child: child,
    );
  }
}
