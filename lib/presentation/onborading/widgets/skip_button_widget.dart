import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';

class SkipButtonWidget extends StatelessWidget {
  final VoidCallback onSkip;
  final TextStyle textStyle;
  const SkipButtonWidget({
    super.key,
    required this.onSkip,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onSkip,
      child: Text(
        context.localizations.skip,
        style: textStyle,
      ),
    );
  }
}
