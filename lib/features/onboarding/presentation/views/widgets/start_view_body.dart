// features/onboarding/presentation/views/widgets/start_view_body.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/button_sign_login.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/start_view_title_and_description.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.green.shade300,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            ImageAssets.start,
            width: double.infinity,
            fit: BoxFit.fill,
            //  color: Colors.green.shade100,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: context.screenHeight * .4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                StartViewTitleAndDescription(),
                ButtonSignLogin(),
                TextButton(
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "OR Shopping as guest",
                      style: TextStyle(
                          color: LightAppColors.maincolorgreen700,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
