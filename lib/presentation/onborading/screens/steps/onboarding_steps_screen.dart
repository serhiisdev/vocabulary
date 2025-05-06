import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary/app/di/get_it.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';
import 'package:vocabulary/presentation/onborading/config/onboarding_screen_resolver.dart';
import 'package:vocabulary/presentation/onborading/screens/core/onboarding_flow_wrapper/onboarding_flow_wrapper.dart';

class OnboardingStepsScreen extends StatelessWidget {
  const OnboardingStepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (_) => getIt<OnboardingBloc>(),
      child: const _OnboardingStepsScreenView(),
    );
  }
}

class _OnboardingStepsScreenView extends StatefulWidget {
  const _OnboardingStepsScreenView();

  @override
  State<_OnboardingStepsScreenView> createState() => _OnboardingStepsScreenViewState();
}

class _OnboardingStepsScreenViewState extends State<_OnboardingStepsScreenView> {
  late final PageController _pageController;
  
  void _onPageChanged({required int index, required OnboardingBloc bloc}) {
    bloc.add(OnboardingEvent.stepChanged(index));
  }
  
  @override
  void initState() {
    super.initState();
    final onboardingBloc = context.read<OnboardingBloc>();
    final currentStepIndex = onboardingBloc.state.currentStepIndex;
    _pageController = PageController(initialPage: currentStepIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<OnboardingBloc>();
    final state = bloc.state;
    final steps = state.steps;
  
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      itemCount: state.steps.length,
      onPageChanged: (index) => _onPageChanged(index: index, bloc: bloc),
      itemBuilder: (context, index) {
        final step = steps.elementAt(index);
        return OnboardingFlowWrapper(
          pageController: _pageController,
          child: OnboardingScreenResolver.resolve(step),
        );
      },
    );
  }
}