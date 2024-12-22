// features/home/presentation/views/widgets/rating.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.star_rounded,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        SmallHeader(
          text: '3.99',
          color: LightAppColors.graycolor400,
        )
      ],
    );
  }
}
