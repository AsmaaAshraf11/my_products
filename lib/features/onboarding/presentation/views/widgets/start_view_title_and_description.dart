// features/onboarding/presentation/views/widgets/start_view_title_and_description.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';

class StartViewTitleAndDescription extends StatelessWidget {
  const StartViewTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadLine22(
            text: 'Online Shopping ',
            fontSize: 24,
          ),
          //
          const SizedBox(
            height: 10,
          ),
          const TitleMedium(
            text: 'find your products with high quality and reasonable prices',
            inCenter: true,
          )
        ],
      ),
    );
  }
}
