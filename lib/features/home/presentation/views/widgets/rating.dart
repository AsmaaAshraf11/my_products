// features/home/presentation/views/widgets/rating.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';

class Rating extends StatelessWidget {
  Rating({super.key, this.siz, required this.rating});
  var siz;
  String rating;
  //Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star_rounded,
          size: siz ?? 19,
          color: const Color(0xffFFDD4F),
        ),
        SmallHeader(
          text: '$rating',
          color: LightAppColors.graycolor600,
        )
      ],
    );
  }
}
