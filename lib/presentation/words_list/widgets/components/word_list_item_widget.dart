import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';

class WordListItemWidget extends StatelessWidget {
  final VoidCallback onAnnounceWord;
  final WordUiModel word;
  const WordListItemWidget({
    super.key,
    required this.onAnnounceWord,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    final wordWidget = Semantics(
      onTap: () {},
      label: context.localizations.word,
      child: Text(
        word.word,
        textAlign: TextAlign.center,
        style: context.theme.appTypography.titleLarge.copyWith(
          color: context.theme.appColors.textV2,
        ),
      ),
    );
    final transcriptionTextWidget = Text(
      word.transcription,
      textAlign: TextAlign.center,
      style: context.theme.appTypography.bodySmall.copyWith(
        color: context.theme.appColors.textV2,
      ),
    );

    final announceIconWidget = Icon(
      Icons.volume_up_outlined,
      size: 16,
      color: context.theme.appColors.textV2,
    );

    Widget transcriptionWidget = Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [Flexible(child: transcriptionTextWidget), announceIconWidget],
    );
    transcriptionWidget = Container(
      decoration: BoxDecoration(
        color: context.theme.appColors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: transcriptionWidget,
    );

    transcriptionWidget = Semantics(
      container: true,
      button: true,
      onTap: onAnnounceWord,
      excludeSemantics: true,
      onDidGainAccessibilityFocus: () {
        SemanticsService.announce(
          '${context.localizations.transcription}: ${word.transcription}. ${context.localizations.announceWord}. Button.',
          TextDirection.ltr,
        );
      },
      child: InkWell(onTap: onAnnounceWord, child: transcriptionWidget),
    );

    final definitionWidget = Semantics(
      onTap: () {},
      label: context.localizations.definition,
      child: Text(
        word.definition,
        textAlign: TextAlign.center,
        style: context.theme.appTypography.bodyMedium.copyWith(
          color: context.theme.appColors.textV2,
        ),
      ),
    );

    final exampleWidget = Semantics(
      onTap: () {},
      label: context.localizations.example,
      child: Text(
        '(${word.example})',
        textAlign: TextAlign.center,
        style: context.theme.appTypography.bodySmall.copyWith(
          color: context.theme.appColors.textV2,
        ),
      ),
    );

    return Semantics(
      explicitChildNodes: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wordWidget,
          const SizedBox(height: 10),
          transcriptionWidget,
          const SizedBox(height: 10),
          definitionWidget,
          const SizedBox(height: 10),
          exampleWidget,
        ],
      ),
    );
  }
}
