import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/presentation/core/arrow_up_widget.dart';

class WelcomeWordsWidget extends StatefulWidget {
  const WelcomeWordsWidget({super.key});

  @override
  State<WelcomeWordsWidget> createState() => _WelcomeWordsWidgetState();
}

class _WelcomeWordsWidgetState extends State<WelcomeWordsWidget>
    with TickerProviderStateMixin {
  late final AnimationController _textController;
  late final Animation<double> _textFadeAnimation;
  late final Animation<Offset> _textSlideAnimation;

  late final AnimationController _arrowFadeController;
  late final Animation<double> _arrowFadeAnimation;

  late final AnimationController _arrowBounceController;
  late final Animation<double> _arrowBounceAnimation;

  static const _textFadeDuration = Duration(milliseconds: 1000);
  static const _arrowFadeDuration = Duration(milliseconds: 800);
  static const _bounceDuration = Duration(milliseconds: 1300);
  static const _arrowHeight = 16.0;
  static const _arrowWidth = 32.0;
  static const _arrowStrokeWidth = 2.0;
  static const _arrowBounceOffset = -_arrowHeight * 0.85;

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      vsync: this,
      duration: _textFadeDuration,
    );
    _textFadeAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    );
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _arrowFadeController = AnimationController(
      vsync: this,
      duration: _arrowFadeDuration,
    );
    _arrowFadeAnimation = CurvedAnimation(
      parent: _arrowFadeController,
      curve: Curves.easeIn,
    );

    _arrowBounceController = AnimationController(
      vsync: this,
      duration: _bounceDuration,
    );
    _arrowBounceAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: _arrowBounceOffset,
        ).chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 20,
      ),
      TweenSequenceItem(tween: ConstantTween(_arrowBounceOffset), weight: 15),
      TweenSequenceItem(
        tween: Tween(
          begin: _arrowBounceOffset,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.decelerate)),
        weight: 20,
      ),
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 30),
    ]).animate(_arrowBounceController);

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _textController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _arrowFadeController.forward();
    _arrowBounceController.repeat();
  }

  @override
  void dispose() {
    _textController.dispose();
    _arrowFadeController.dispose();
    _arrowBounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          _AnimatedIntroText(
            fadeAnimation: _textFadeAnimation,
            slideAnimation: _textSlideAnimation,
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _arrowFadeAnimation,
              child: Column(
                children: [
                  _BouncingArrow(
                    animation: _arrowBounceAnimation,
                    width: _arrowWidth,
                    height: _arrowHeight,
                    strokeWidth: _arrowStrokeWidth,
                    color: context.theme.appColors.textV2,
                  ),
                  const SizedBox(height: 48),
                  Text(
                    context.localizations.swipeUp,
                    textAlign: TextAlign.center,
                    style: context.theme.appTypography.bodyMedium.copyWith(
                      color: context.theme.appColors.textV2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedIntroText extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const _AnimatedIntroText({
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Center(
          child: Text(
            context.localizations.welcomeToVocabulary,
            textAlign: TextAlign.center,
            style: context.theme.appTypography.titleLarge.copyWith(
              color: context.theme.appColors.textV2,
            ),
          ),
        ),
      ),
    );
  }
}

class _BouncingArrow extends StatelessWidget {
  final Animation<double> animation;
  final double width;
  final double height;
  final double strokeWidth;
  final Color color;

  const _BouncingArrow({
    required this.animation,
    required this.width,
    required this.height,
    required this.strokeWidth,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: child,
        );
      },
      child: ArrowUpWidget(
        width: width,
        height: height,
        strokeWidth: strokeWidth,
        color: color,
      ),
    );
  }
}
