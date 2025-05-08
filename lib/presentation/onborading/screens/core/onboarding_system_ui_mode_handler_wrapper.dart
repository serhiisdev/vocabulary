import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/theme/app_system_ui_mode.dart';

class OnboardingSystemUiModeHandlerWrapper extends StatefulWidget {
  final Widget child;
  const OnboardingSystemUiModeHandlerWrapper({super.key, required this.child});

  @override
  State<OnboardingSystemUiModeHandlerWrapper> createState() => _OnboardingSystemUiModeHandlerWrapperState();
}

class _OnboardingSystemUiModeHandlerWrapperState extends State<OnboardingSystemUiModeHandlerWrapper> {
  @override
  void initState() {
    super.initState();
    AppSystemUiMode.setImmersiveSticky();
  }

  @override
  void dispose() {
    AppSystemUiMode.setDefault();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}