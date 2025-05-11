import 'package:flutter/material.dart';
import 'package:vocabulary/presentation/core/carousel_slider_widget.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';
import 'package:vocabulary/presentation/words_list/widgets/components/word_list_item_widget.dart';
import 'package:vocabulary/presentation/words_list/widgets/welcome_words_widget.dart';

class WordsListWidget extends StatelessWidget {
  final bool showWelcomeWidget;
  final List<WordUiModel> words;
  const WordsListWidget({
    super.key,
    required this.showWelcomeWidget,
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    return _WordsListView(showWelcomeWidget: showWelcomeWidget, words: words);
  }
}

class _WordsListView extends StatefulWidget {
  final bool showWelcomeWidget;
  final List<WordUiModel> words;
  const _WordsListView({required this.showWelcomeWidget, required this.words});

  @override
  State<_WordsListView> createState() => _WordsListViewState();
}

class _WordsListViewState extends State<_WordsListView> {
  @override
  Widget build(BuildContext context) {
    final showWelcomeWidget = widget.showWelcomeWidget;
    final itemsCount =
        showWelcomeWidget ? widget.words.length + 1 : widget.words.length;

    return CarouselSliderWidget(
      itemCount: itemsCount,
      itemBuilder: (context, index, ___) {
        if (showWelcomeWidget && index == 0) {
          return const WelcomeWordsWidget();
        }
        final itemIndex = widget.showWelcomeWidget ? index - 1 : index;
        final item = widget.words[itemIndex];
        return WordListItemWidget(key: Key(item.id), word: item);
      },
    );
  }
}
