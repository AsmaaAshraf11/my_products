// features/onboarding/presentation/views/onboarding_view.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/constants/constants.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/onboarding_view_item.dart';
import 'package:myproducts/features/onboarding/presentation/views/widgets/onboarding_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<BoardindModel> boarding = [
    BoardindModel(
        image: ImageAssets.onBoarding1,
        title: 'Your favorite ',
        description:
            'In our store you will find all kinds of products, electrical tools, home clothes online.',
        subTitle: 'products'),
    BoardindModel(
        image: ImageAssets.onBoarding2,
        title: 'Amazing ',
        description:
            'You will find all the products you want,  with good quality and at a cheap price',
        subTitle: 'discount'),
    BoardindModel(
        image: ImageAssets.onBoarding3,
        title: 'Fast ',
        description: 'Delivery is done safely and quickly within a few minutes',
        subTitle: 'delivery'),
  ];

  var boarderController = PageController();

  bool islast = false;

  AppPreferences appPreferences = getIt.get<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: boarderController,
              onPageChanged: (index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    islast = true;
                  });
                } else {
                  (' notlast');
                  setState(() {
                    islast = false;
                  });
                }
              },
              itemCount: boarding.length,
              // physics:BouncingScrollPhysics(),
              itemBuilder: ((BuildContext context, int index) {
                return OnboardingViewItem(model: boarding[index]);
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: boarderController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 7,
                    expansionFactor: 3,
                    dotWidth: 7,
                    spacing: 5,
                    activeDotColor: LightAppColors.primary400,
                  ),
                ),
                FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: LightAppColors.primary700,
                  onPressed: () {
                    if (islast) {
                      appPreferences.setOnBoardingScreenViewed();
                      pushAndRemoveRoute(context, Routes.start);
                    } else {
                      boarderController.nextPage(
                          duration: Duration(
                            milliseconds: obBoardingSpeed,
                          ),
                          curve: Curves.linear);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
