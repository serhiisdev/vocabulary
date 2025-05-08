import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/presentation/core/buttons/buttons.dart';
import 'package:vocabulary/presentation/onborading/widgets/onboarding_app_bar.dart';

class OnboardingIntroScaffold extends StatelessWidget {
  final VoidCallback onPop;
  final VoidCallback onContinue;
  final VoidCallback onSkip;
  final String title;
  const OnboardingIntroScaffold({
    super.key,
    required this.onPop,
    required this.onContinue,
    required this.onSkip,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 48.0;
    const buttonVerticalPadding = 24.0;
    final buttonBottomSafeArea = MediaQuery.paddingOf(context).bottom;
    final bodyBottomPadding =
        buttonHeight + (buttonVerticalPadding * 2) + buttonBottomSafeArea + 16;
    final titleWidget = Text(
      title,
      textAlign: TextAlign.center,
      style: context.theme.appTypography.titleLargeBold,
    );

    final continueButton = SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: Buttons.elevatedButtonWithShadow(
        context,
        onPressed: onContinue,
        child: Text(
          context.localizations.continueLocalized,
          style: context.theme.appTypography.labelLargeBold.copyWith(
            color: context.theme.appColors.black,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: OnboardingAppBar.build(context, onPop: onPop, onSkip: onSkip),
      floatingActionButton: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: buttonVerticalPadding,
        ),
        child: continueButton,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 32,
            right: 32,
            top: 16,
            bottom: bodyBottomPadding,
          ),
          child: titleWidget,
        ),
      ),
    );
  }
}
