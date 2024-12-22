// features/onboarding/presentation/views/onboarding_view.dart
import 'package:flutter/material.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingViewbody(),
    );
  }
}
