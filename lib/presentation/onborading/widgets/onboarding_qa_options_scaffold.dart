import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/presentation/core/checkbox_option_widget.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_enums.dart';

class OnboardingQaOptionsScaffold<T extends Localized> extends StatelessWidget {
  final void Function(T) onSelected;
  final VoidCallback onSelectedAnimationCompleted;
  final void Function(BuildContext)? onSkip;
  final T? selectedItem;
  final List<T> items;
  const OnboardingQaOptionsScaffold({
    super.key,
    required this.onSelected,
    required this.onSelectedAnimationCompleted,
    this.onSkip,
    required this.selectedItem,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem?.title(context) ?? ''),
        actions:
            onSkip != null
                ? [
                  TextButton(
                    onPressed: () => onSkip!(context),
                    child: const Text('Skip'),
                  ),
                ]
                : null,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CheckboxOptionWidget(
            key: ValueKey(item),
            onTap: () {
              onSelected(item);
            },
            onSelectedAnimationCompleted: onSelectedAnimationCompleted,
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
      ),
    );
  }
}
