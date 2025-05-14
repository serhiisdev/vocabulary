import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';

class SkipButtonWidget extends StatelessWidget {
  final VoidCallback onSkip;
  final String? title;
  final TextStyle textStyle;
  const SkipButtonWidget({
    super.key,
    required this.onSkip,
    this.title,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onSkip,
      child: Text(
        title ?? context.localizations.skip,
        style: textStyle,
      ),
    );
  }
}
