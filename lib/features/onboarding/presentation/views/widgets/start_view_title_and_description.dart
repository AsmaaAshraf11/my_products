// features/onboarding/presentation/views/widgets/start_view_title_and_description.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';

class StartViewTitleAndDescription extends StatelessWidget {
  const StartViewTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Online Shopping ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'find your products with high quality and reasonable prices',
            style: TextStyle(fontSize: 17, color: LightAppColors.graycolor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
