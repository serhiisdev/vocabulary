import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/presentation/core/buttons/buttons.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/data/onboarding_step_ui.dart';

class ScaffoldWithNextButton extends StatelessWidget {
  final void Function(BuildContext)? onSkip;
  final OnboardingStepUi step;
  final Widget body;

  const ScaffoldWithNextButton({
    super.key,
    this.onSkip,
    required this.step,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: [
          Expanded(child: body),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: Buttons.elevatedButtonWithShadow(
              context,
              onPressed: () {
                final bloc = context.read<OnboardingBloc>();
                bloc.add(OnboardingEvent.markStepAsCompleted(step));
                bloc.add(const OnboardingEvent.goToNextStep());
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
