// features/home/presentation/views/widgets/review_and_rating.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/views/widgets/rating.dart';

class ReviewAndRating extends StatelessWidget {
  ReviewAndRating({super.key, required this.numReview, required this.rating});
  int numReview;
  num? rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(
            Icons.watch_later_rounded,
            color: LightAppColors.maincolorgreen400,
            size: 25,
          ),
          TitleText(
            fontWeight: FontWeight.normal,
            text: ' 40min  (${numReview} reviews)',
            textColor: LightAppColors.graycolor600,
          ),
          100.w.widthSizedBox,
          Rating(
            siz: 25.0,
            rating: '$rating',
          )
        ],
      ),
    );
  }
}
