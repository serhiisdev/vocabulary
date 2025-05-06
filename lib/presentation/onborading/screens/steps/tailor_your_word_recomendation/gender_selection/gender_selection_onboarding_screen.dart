import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/presentation/core/buttons/buttons.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';

class ScaffoldWithNextButton extends StatelessWidget {
  final Widget body;

  const ScaffoldWithNextButton({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
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
                context.read<OnboardingBloc>().add(const OnboardingEvent.goToNextStep());
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderSelectionOnboardingScreen extends StatelessWidget {
  const GenderSelectionOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNextButton(
      body: Column(
        children: [
          Text('Gender selection'),
         
        ],
      ),
    );
  }
}
