import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/presentation/core/buttons/buttons/back_button_widget.dart';
import 'package:vocabulary/presentation/onborading/widgets/skip_button_widget.dart';

abstract class OnboardingAppBar {
  static PreferredSizeWidget build(
    BuildContext context, {
    required VoidCallback onPop,
    required VoidCallback onSkip,
    /// If provided, this text will replace default skip button title.
    String? skipButtonTitle,
  }) {
    final isIos = Theme.of(context).platform == TargetPlatform.iOS;
    final skipButtonTextStyle = context.theme.appTypography.titleMedium
        .copyWith(color: context.theme.appColors.white);
    final backButtonSize = skipButtonTextStyle.fontSize ?? 20.0;

    /// If it's iOS then app bar will be wrapped in SafeArea, so additional vertical
    /// padding is not needed.
    final appBarVerticalPadding = isIos ? 0.0 : 16.0;

    Widget appBar = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: appBarVerticalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: BackButtonWidget(
              size: backButtonSize,
              onPressed: onPop,
            ),
          ),
          SkipButtonWidget(
            onSkip: onSkip,
            title: skipButtonTitle,
            textStyle: skipButtonTextStyle,
          ),
        ],
      ),
    );

    /// On iOS system prevents clicks on widgets that are placed in the area of system status bar,
    /// so we need to use SafeArea.
    if (isIos) {
      appBar = SafeArea(child: appBar);
    }

    return PreferredSize(preferredSize: Size.fromHeight(80), child: appBar);
  }
}
