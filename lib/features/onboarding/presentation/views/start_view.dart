// features/onboarding/presentation/views/start_view.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/button_sign_login.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/start_view_title_and_description.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: LightAppColors.green300!.withOpacity(0.6),
            ),
            backgroundColor: LightAppColors.green300,
          )),
      body: Stack(
        children: [
          Container(
            color: LightAppColors.green300,
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
                    onPressed: () {
                      pushRoute(context, Routes.newFeatur);
                    },
                    child: Center(
                      child: Text(
                        "OR Shopping as guest",
                        style: TextStyle(
                            color: LightAppColors.primary700,
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
      ),
    );
  }
}
