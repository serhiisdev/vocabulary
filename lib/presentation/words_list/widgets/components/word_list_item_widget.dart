import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';

class WordListItemWidget extends StatelessWidget {
  final WordUiModel word;
  const WordListItemWidget({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          word.word,
          textAlign: TextAlign.center,
          style: context.theme.appTypography.titleLarge.copyWith(
            color: context.theme.appColors.textV2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          word.transcription,
          textAlign: TextAlign.center,
          style: context.theme.appTypography.bodySmall.copyWith(
            color: context.theme.appColors.textV2,
          ),
        ),
        const SizedBox(height: 10),

        Text(
          '(${context.localizations.definitionLabel}) ${word.definition}',
          textAlign: TextAlign.center,
          style: context.theme.appTypography.bodyMedium.copyWith(
            color: context.theme.appColors.textV2,
          ),
        ),
        const SizedBox(height: 10),

        Text(
          '(${word.example})',
          textAlign: TextAlign.center,
          style: context.theme.appTypography.bodySmall.copyWith(
            color: context.theme.appColors.textV2,
          ),
        ),
      ],
    );
  }
}
