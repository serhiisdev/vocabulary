import 'package:flutter/material.dart';
import 'package:vocabulary/presentation/core/carousel_slider_widget.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';
import 'package:vocabulary/presentation/words_list/widgets/components/word_list_item_widget.dart';
import 'package:vocabulary/presentation/words_list/widgets/welcome_words_widget.dart';

class WordsListWidget extends StatelessWidget {
  final List<WordUiModel> words;
  const WordsListWidget({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    return _WordsListView(words: words);
  }
}

class _WordsListView extends StatefulWidget {
  final List<WordUiModel> words;
  const _WordsListView({required this.words});

  @override
  State<_WordsListView> createState() => _WordsListViewState();
}

class _WordsListViewState extends State<_WordsListView> {
  @override
  Widget build(BuildContext context) {
    return CarouselSliderWidget(
      itemCount: widget.words.length + 1,
      itemBuilder: (context, index, ___) {
        if (index == 0) {
          return const WelcomeWordsWidget();
        }
        final word = widget.words[index - 1];
        return WordListItemWidget(word: word);
      },
    );
  }
}
