import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/presentation/core/buttons/buttons.dart';
import 'package:vocabulary/presentation/core/checkbox_option_widget.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/widgets/onboarding_app_bar.dart';

class OnboardingQaOptionsScaffold<T extends Localized> extends StatelessWidget {
  final void Function(T) onSelected;
  final bool Function(T) isItemSelected;

  final VoidCallback onPop;
  final VoidCallback? onSelectedAnimationCompleted;
  final VoidCallback onSkip;

  /// If provided, this scaffold will show a floating action button.
  /// If not provided, the scaffold will not show a floating action button.
  final VoidCallback? onContinue;

  /// Delay before [onSelectedAnimationCompleted] will be invoked.
  /// If set, after animnation will be completed, this widget will wait
  /// additional [delayBeforeCompletedCallbackInvokation] before invoking
  /// [onSelectedAnimationCompleted].
  final Duration? delayBeforeCompletedCallbackInvokation;
  final String title;
  final String subtitle;
  final String? subtitle2;
  final List<T> items;
  const OnboardingQaOptionsScaffold({
    super.key,
    required this.onSelected,
    required this.isItemSelected,
    required this.onPop,
    this.onSelectedAnimationCompleted,
    required this.onSkip,
    this.onContinue,
    this.delayBeforeCompletedCallbackInvokation = const Duration(
      milliseconds: 150,
    ),
    required this.title,
    required this.subtitle,
    this.subtitle2,
    required this.items,
  });

  Future<void> _onSelectedAnimationCompleted(BuildContext context) async {
    if (delayBeforeCompletedCallbackInvokation != null) {
      await Future.delayed(delayBeforeCompletedCallbackInvokation!);
    }
    if (onSelectedAnimationCompleted == null || !context.mounted) return;
    onSelectedAnimationCompleted!();
  }

  @override
  Widget build(BuildContext context) {
    final isIos = Theme.of(context).platform == TargetPlatform.iOS;
    const buttonHeight = 48.0;
    const buttonVerticalPadding = 24.0;
    final buttonBottomSafeArea = MediaQuery.paddingOf(context).bottom;
    final bodyBottomPadding =
        buttonHeight + (buttonVerticalPadding * 2) + buttonBottomSafeArea + 16;

    Widget? floatingActionButtonWidget;

    if (onContinue != null) {
      floatingActionButtonWidget = SizedBox(
        width: double.infinity,
        height: buttonHeight,
        child: Buttons.elevatedButtonWithShadow(
          context,
          onPressed: onContinue!,
          child: Text(
            context.localizations.continueLocalized,
            style: context.theme.appTypography.labelLargeBold.copyWith(
              color: context.theme.appColors.black,
            ),
          ),
        ),
      );
    }

    final titleWidget = Text(
      title,
      textAlign: TextAlign.center,
      style: context.theme.appTypography.titleLargeBold.copyWith(
        color: context.theme.appColors.text,
      ),
    );
    final subtitleWidget = Text(
      subtitle,
      textAlign: TextAlign.center,
      style: context.theme.appTypography.bodyMedium.copyWith(
        color: context.theme.appColors.text,
      ),
    );
    final subtitle2Widget =
        subtitle2 != null
            ? Text(
              subtitle2!,
              textAlign: TextAlign.center,
              style: context.theme.appTypography.bodyMedium.copyWith(
                color: context.theme.appColors.text,
              ),
            )
            : null;

    final optionsWidget = SliverList.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CheckboxOptionWidget(
          key: ValueKey(item),
          onTap: () => onSelected(item),
          onSelectedAnimationCompleted:
              onSelectedAnimationCompleted != null
                  ? () {
                    _onSelectedAnimationCompleted(context);
                  }
                  : null,
          isSelected: isItemSelected(item),
          text: item.title(context),
          textStyle: context.theme.appTypography.bodyMedium,
          showCheckIconBorderWhenUnselected: isIos,
          checkIconColor: context.theme.appColors.white.withValues(alpha: 0.8),
          selectedBorderColor: context.theme.appColors.white.withValues(
            alpha: 0.8,
          ),
          unselectedBorderColor: context.theme.appColors.white.withValues(
            alpha: 0.5,
          ),
          selectedBorderWidth: 2,
          unselectedBorderWidth: 1,
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(height: 16);
      },
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: OnboardingAppBar.build(context, onPop: onPop, onSkip: onSkip),
      floatingActionButton:
          floatingActionButtonWidget != null
              ? SafeArea(
                minimum: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: buttonVerticalPadding,
                ),
                child: floatingActionButtonWidget,
              )
              : null,
      floatingActionButtonLocation:
          floatingActionButtonWidget != null
              ? FloatingActionButtonLocation.centerDocked
              : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(child: titleWidget),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(child: subtitleWidget),
              if (subtitle2Widget != null) ...[
                const SliverToBoxAdapter(child: SizedBox(height: 4)),
                SliverToBoxAdapter(child: subtitle2Widget),
              ],
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              optionsWidget,
              SliverToBoxAdapter(child: SizedBox(height: bodyBottomPadding)),
            ],
          ),
        ),
      ),
    );
  }
}
