import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/go_router_ext.dart';
import 'package:vocabulary/presentation/onborading/bloc/onboarding_bloc.dart';

abstract class OnboardingPopScreenHandler {
  static void onPop(BuildContext context, OnboardingBloc bloc) {
    if (bloc.state.hasPreviousStep) {
      bloc.add(const OnboardingEvent.goToPreviousStep());
    } else {
      context.router.maybePop();
    }
  }
}
