import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/presentation/core/carousel_slider_widget.dart';
import 'package:vocabulary/presentation/core/overscroll_listener_widget.dart';
import 'package:vocabulary/presentation/words_list/data/word_ui_model.dart';
import 'package:vocabulary/presentation/words_list/widgets/components/word_list_item_widget.dart';
import 'package:vocabulary/presentation/words_list/widgets/welcome_words_widget.dart';

class WordsListWidget extends StatelessWidget {
  final VoidCallback onWordsWelcomeWidgetShown;
  final void Function(WordUiModel word) onAnnounceWord;
  final bool showWelcomeWidget;
  final List<WordUiModel> words;
  const WordsListWidget({
    super.key,
    required this.onWordsWelcomeWidgetShown,
    required this.onAnnounceWord,
    required this.showWelcomeWidget,
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    return _WordsListView(
      onWordsWelcomeWidgetShown: onWordsWelcomeWidgetShown,
      onAnnounceWord: onAnnounceWord,
      showWelcomeWidget: showWelcomeWidget,
      words: words,
    );
  }
}

class _WordsListView extends StatefulWidget {
  final VoidCallback onWordsWelcomeWidgetShown;
  final void Function(WordUiModel word) onAnnounceWord;
  final bool showWelcomeWidget;
  final List<WordUiModel> words;
  const _WordsListView({
    required this.onWordsWelcomeWidgetShown,
    required this.onAnnounceWord,
    required this.showWelcomeWidget,
    required this.words,
  });

  @override
  State<_WordsListView> createState() => _WordsListViewState();
}

class _WordsListViewState extends State<_WordsListView> {
  late CarouselSliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CarouselSliderController();
  }

  void _onWordsWelcomeWidgetShown() {
    widget.onWordsWelcomeWidgetShown();
  }

  void _onAnnounceWord(WordUiModel word) {
    widget.onAnnounceWord(word);
  }

  void _maybeAnnounceWordWithScreenReader(BuildContext context,WordUiModel word) {
    final isIos = Theme.of(context).platform == TargetPlatform.iOS;
    /// Due to behavioral differences between iOS VoiceOver and Android TalkBack,
    /// we need to use [SemanticsService] to announce words only on iOS.
    /// This ensures that, after scrolling to the next word, VoiceOver immediately announces the current word.
    /// Without this, VoiceOver may announce the previous word for a second or two before switching.
    /// On Android, TalkBack works as expected without using [SemanticsService].
    if(!isIos) return;
    SemanticsService.announce(
      _getSemanticsAnnounceString(word),
      TextDirection.ltr,
    );
  }

  String _getWelcomeScreenSemanticsValue(BuildContext context) {
    return '${context.localizations.welcomeToVocabulary}. ${context.localizations.doubleTapOrSwipeUpToStartExploringWordsWord}.';
  }

  /// Whenever add action button description for screen reader, i.e. that
  /// double tap will go to next word.
  ///
  /// To not irritate user, only first word will include that description.
  bool _shouldIncludeActionDescriptionSemanticsHint(int index) {
    return index == 0;
  }

  String _getActionDescriptionSemanticsHint(BuildContext context) {
    return '${context.localizations.doubleTapToGoToNextWord}. ${context.localizations.swipeUpToGoToNextWord}. ${context.localizations.swipeDownToGoToPreviousWord}.';
  }

  String _getSemanticsAnnounceString(WordUiModel word) {
    return '${word.word}. ${word.definition}. ${word.example}';
  }

  @override
  Widget build(BuildContext context) {
    final showWelcomeWidget = widget.showWelcomeWidget;
    final itemsCount =
        showWelcomeWidget ? widget.words.length + 1 : widget.words.length;

    return GestureDetector(
      onTap: () => _controller.nextPage(),
      excludeFromSemantics: true,
      child: CarouselSliderWidget(
        carouselController: _controller,
        onPageChanged: (index, __) {
          if (showWelcomeWidget && index == 0) {
            return;
          }
          final itemIndex = widget.showWelcomeWidget ? index - 1 : index;
          final item = widget.words[itemIndex];
          _maybeAnnounceWordWithScreenReader(context, item);
        },
        itemCount: itemsCount,
        itemBuilder: (context, index, ___) {
          if (showWelcomeWidget && index == 0) {
            return Semantics(
              button: true,
              value: _getWelcomeScreenSemanticsValue(context),
              onTap: () => _controller.nextPage(),
              onScrollUp: () => _controller.nextPage(),
              onScrollDown: () {},
              excludeSemantics: true,
              child: WelcomeWordsWidget(onShown: _onWordsWelcomeWidgetShown),
            );
          }
          final itemIndex = widget.showWelcomeWidget ? index - 1 : index;
          final item = widget.words[itemIndex];
          final hint =
              _shouldIncludeActionDescriptionSemanticsHint(itemIndex)
                  ? _getActionDescriptionSemanticsHint(context)
                  : null;
          return Semantics(
            button: true,
            value: _getSemanticsAnnounceString(item),
            hint: hint,
            onTap: () => _controller.nextPage(),
            onScrollUp: () => _controller.nextPage(),
            onScrollDown: () => _controller.previousPage(),
            child: OverscrollListenerWidget(
              onTopOverscroll: () => _controller.previousPage(),
              onBottomOverscroll: () => _controller.nextPage(),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: WordListItemWidget(
                    key: Key(item.id),
                    onAnnounceWord: () => _onAnnounceWord(item),
                    word: item,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
