import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';

class ElevatedButtonWithShadow extends StatelessWidget {
  final void Function() onPressed;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Widget child;
  const ElevatedButtonWithShadow({
    super.key,
    required this.onPressed,
    this.borderRadius = 24,
    this.backgroundColor,
    this.shadowColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColorResolved =
        backgroundColor ?? context.theme.appColors.buttonBackground;
    final shadowColorResolved =
        shadowColor ?? context.theme.appColors.shadowColor;
    Widget button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColorResolved,
        shadowColor: shadowColorResolved,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.5, color: shadowColorResolved),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 0,
      ),
      child: child,
    );
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: button,
      ),
    );
  }
}
