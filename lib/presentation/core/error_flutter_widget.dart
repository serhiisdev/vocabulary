import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';

class ErrorFlutterWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String message;
  final Color? iconColor;
  final TextStyle? messageStyle;
  final TextStyle? retryButtonTextStyle;
  const ErrorFlutterWidget({
    super.key,
    required this.onRetry,
    required this.message,
    this.iconColor,
    this.messageStyle,
    this.retryButtonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 48,
          color: iconColor ?? context.theme.appColors.error,
        ),
        const SizedBox(height: 8),
        Text(
          message,
          style:
              messageStyle ??
              context.theme.appTypography.titleMedium.copyWith(
                color: context.theme.appColors.textV2,
              ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: onRetry,
          child: Text(
            context.localizations.retry,
            style:
                retryButtonTextStyle ??
                context.theme.appTypography.titleLargeBold.copyWith(
                  color: context.theme.appColors.blue,
                ),
          ),
        ),
      ],
    );
  }
}
