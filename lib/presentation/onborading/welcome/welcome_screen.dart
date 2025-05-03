import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/app/gen/assets.gen.dart';
import 'package:vocabulary/presentation/core/buttons/buttons.dart';
import 'package:vocabulary/presentation/core/scaffold/scaffold_with_pinned_image.dart';
import 'package:vocabulary/presentation/core/starts_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 48.0;
    const buttonVerticalPadding = 24.0;
    const bodyBottomPadding = buttonHeight + (buttonVerticalPadding * 2) + 16;

    final floatingActionButton = SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: Buttons.elevatedButtonWithShadow(
        context,
        onPressed: () {},
        child: Text(
          context.localizations.getStarted,
          style: context.theme.appTypography.labelLargeBold.copyWith(
            color: context.theme.appColors.black,
          ),
        ),
      ),
    );

    final title = Text(
      context.localizations.expandYorVocabularyIn1MinuteADay,
      textAlign: TextAlign.center,
      style: context.theme.appTypography.titleLargeBold.copyWith(
        color: context.theme.appColors.text,
      ),
    );

    final subtitle = Text(
      context.localizations.learnNewWordsSubtitle,
      textAlign: TextAlign.center,
      style: context.theme.appTypography.bodyMedium.copyWith(
        color: context.theme.appColors.text,
      ),
    );

    return ScaffoldWithPinnedImage(
      assetImagePath: Assets.images.letters.path,
      imageHeightFactor: 0.5,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: buttonVerticalPadding,
        ),
        child: floatingActionButton,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 26, bottom: bodyBottomPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: title,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: subtitle,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: const _Bottom(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Flexible(
          child: _TitleWithSubtitle(
            title: Text(
              context.localizations.xMillion(350),
              textAlign: TextAlign.center,
              style: context.theme.appTypography.labelLargeBold.copyWith(
                color: context.theme.appColors.text,
              ),
            ),
            subtitle: Text(
              context.localizations.wordsLearned.toLowerCase(),
              textAlign: TextAlign.center,
              style: context.theme.appTypography.labelSmall.copyWith(
                color: context.theme.appColors.text,
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _TitleWithSubtitle(
              title: Text(
                '4.8',
                textAlign: TextAlign.center,
                style: context.theme.appTypography.bodyMedium.copyWith(
                  color: context.theme.appColors.text,
                ),
              ),
              subtitle: StartsWidget(
                count: 5,
                color: context.theme.appColors.starColor,
                size: 12,
              ),
            ),
          ),
        ),
        Flexible(
          child: _TitleWithSubtitle(
            title: Text(
              context.localizations.xMillion(10),
              textAlign: TextAlign.center,
              style: context.theme.appTypography.bodyMedium.copyWith(
                color: context.theme.appColors.text,
              ),
            ),
            subtitle: Text(
              context.localizations.downloads.toLowerCase(),
              textAlign: TextAlign.center,
              style: context.theme.appTypography.labelSmall.copyWith(
                color: context.theme.appColors.text,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TitleWithSubtitle extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  const _TitleWithSubtitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [title, subtitle],
    );
  }
}
