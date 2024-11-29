// features/onboarding/presentation/views/widgets/onboarding_view_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/onboarding_view_model.dart';
import 'package:myproducts/main.dart';

class OnboardingViewItem extends StatelessWidget {
  BoardindModel model;

  OnboardingViewItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300.w,
          height: 300.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.shade200,
          ),
          child: Image(
            image: AssetImage('${model.image}'),
            // width: double.infinity,
            // height:400,
            // fit: BoxFit.fitHeight,
          ),
        ),
        30.h.heightSizedBox,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '${model.title}' + ' ',
            style:TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(
                text: '${model.subTitle}',
                style: TextStyle(color: LightAppColors.maincolorgreen400),
              ),
            ],
          ),
        ),
        10.h.heightSizedBox,
        Center(
          child: Text(
            '${model.description}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: LightAppColors.graycolor,
              // letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
