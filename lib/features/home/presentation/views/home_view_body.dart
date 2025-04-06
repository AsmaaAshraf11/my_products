// features/home/presentation/views/home_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/constants/constants.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/list_view_categories.dart';
import 'package:myproducts/features/layout/presentation/views/widgets/custom_app_bar.dart';
import 'package:myproducts/generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  var Searchcontroller = TextEditingController();
  AppPreferences appPreferences = getIt.get<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    currentUserName = appPreferences.getUserName();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 30,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomAppBar(userName: currentUserName),

          InkWell(
            onTap: () {
              pushRoute(context, Routes.searchScreen);
            },
            child: Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(
                    color: LightAppColors.primary400,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search_rounded,
                        color: LightAppColors.primary400),
                  ),
                  TitleText(
                    text: 'what do you want?',
                    textColor: LightAppColors.graycolor400,
                  )
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadLine22(
                text: 'Sales',
              ),
              SmallHeader(
                text: 'See more >',
              )
            ],
          ),
          15.h.heightSizedBox,
          Container(
            height: context.screenHeight * .22,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleMedium(
                        text: 'Up to 25% offer!',
                        bold: true,
                        textColor: LightAppColors.primary400,
                      ),
                      4.h.heightSizedBox,
                      TitleText(
                        text: 'Hurry to catch this',
                        textColor: LightAppColors.primary400,
                      ),
                      5.h.heightSizedBox,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LightAppColors.primary400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Shop Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    ImageAssets.img2,
                    width: 155.w,
                    fit: BoxFit.cover,
                    // width: 175.w,
                  )
                ]),
          ),
          //  10.h.heightSizedBox,
          Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 10),
              child: HeadLine22(
                text: '${S.of(context).categories}',
                // 'Categories',
              )),
          ListViewCategories(),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadLine22(
                  text: 'Popular',
                ),
                InkWell(
                    child: const TitleMedium(
                      text: 'See all ',
                    ),
                    onTap: () {
                      pushRoute(context, Routes.allProductshScreen);
                    })
              ],
            ),
          ),
          const GridViewPopular()
        ]),
      ),
    );
  }
}
