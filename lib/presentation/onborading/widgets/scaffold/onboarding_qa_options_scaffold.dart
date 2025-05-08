import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/presentation/core/checkbox_option_widget.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';
import 'package:vocabulary/presentation/onborading/widgets/onboarding_app_bar.dart';

class OnboardingQaOptionsScaffold<T extends Localized> extends StatelessWidget {
  final void Function(T) onSelected;
  final VoidCallback onPop;
  final VoidCallback onSelectedAnimationCompleted;
  final VoidCallback onSkip;

  /// Delay before [onSelectedAnimationCompleted] will be invoked.
  /// If set, after animnation will be completed, this widget will wait
  /// additional [delayBeforeCompletedCallbackInvokation] before invoking
  /// [onSelectedAnimationCompleted].
  final Duration? delayBeforeCompletedCallbackInvokation;
  final String title;
  final String subtitle;
  final T? selectedItem;
  final List<T> items;
  const OnboardingQaOptionsScaffold({
    super.key,
    required this.onSelected,
    required this.onPop,
    required this.onSelectedAnimationCompleted,
    required this.onSkip,
    this.delayBeforeCompletedCallbackInvokation = const Duration(
      milliseconds: 150,
    ),
    required this.title,
    required this.subtitle,
    required this.selectedItem,
    required this.items,
  });

  Future<void> _onSelectedAnimationCompleted(BuildContext context) async {
    if (delayBeforeCompletedCallbackInvokation != null) {
      await Future.delayed(delayBeforeCompletedCallbackInvokation!);
    }
    if (!context.mounted) return;
    onSelectedAnimationCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final titleWidget = Text(
      title,
      textAlign: TextAlign.center,
      style: context.theme.appTypography.titleLargeBold,
    );
    final subtitleWidget = Text(
      subtitle,
      textAlign: TextAlign.center,
      style: context.theme.appTypography.bodyMedium,
    );

    final optionsWidget = SliverList.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CheckboxOptionWidget(
          key: ValueKey(item),
          onTap: () => onSelected(item),
          onSelectedAnimationCompleted: () {
            _onSelectedAnimationCompleted(context);
          },
          isSelected: selectedItem == item,
          text: item.title(context),
          textStyle: context.theme.appTypography.bodyMedium,
          checkIconColor: context.theme.appColors.white,
          selectedBorderColor: context.theme.appColors.white,
          unselectedBorderColor: context.theme.appColors.white.withValues(
            alpha: 0.5,
          ),
          selectedBorderWidth: 1.5,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: titleWidget),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(child: subtitleWidget),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              optionsWidget,
            ],
          ),
        ),
      ),
    );
  }
}
