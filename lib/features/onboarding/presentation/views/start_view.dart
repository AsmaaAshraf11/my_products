// features/onboarding/presentation/views/start_view.dart
import 'package:flutter/material.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StartViewBody(),
    );
  }
}
