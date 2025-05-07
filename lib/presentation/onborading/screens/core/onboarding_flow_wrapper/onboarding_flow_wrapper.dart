import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/router/screen.dart';
import 'package:vocabulary/core/models/bloc_status/bloc_status.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';

class OnboardingFlowWrapper extends StatelessWidget {
  final PageController pageController;
  final Widget child;

  const OnboardingFlowWrapper({
    super.key,
    required this.pageController,
    required this.child,
  });

  void _handleRedirect(
    BuildContext context, {
    required bool isOnboardingCompleted,
    required int currentStepIndex,
  }) {
    if (isOnboardingCompleted) {
      context.goNamed(Screen.home);
      return;
    }

    pageController.animateToPage(
      currentStepIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handleError(BuildContext context) {
    context.clearSnackBars();
    context.showErrorSnackBar();
  }

  void _handlePop(OnboardingBloc bloc) {
    bloc.add(OnboardingEvent.goToPreviousStep());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        /// Redirect handler
        BlocListener<OnboardingBloc, OnboardingState>(
          listenWhen:
              (a, b) =>
                  a.currentStepIndex != b.currentStepIndex ||
                  a.isOnboardingCompleted != b.isOnboardingCompleted,
          listener: (context, state) {
            _handleRedirect(
              context,
              isOnboardingCompleted: state.isOnboardingCompleted,
              currentStepIndex: state.currentStepIndex,
            );
          },
        ),

        /// Error handler
        BlocListener<OnboardingBloc, OnboardingState>(
          listenWhen: (a, b) => b.status.isError && a.status != b.status,
          listener: (context, _) {
            _handleError(context);
          },
        ),
      ],
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        buildWhen: (a, b) => a.hasPreviousStep != b.hasPreviousStep,
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();
          Widget childResolved = child;
          childResolved = PopScope(
            canPop: !state.hasPreviousStep,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;
              _handlePop(bloc);
            },
            child: childResolved,
          );
          return childResolved;
        },
      ),
    );
  }
}
