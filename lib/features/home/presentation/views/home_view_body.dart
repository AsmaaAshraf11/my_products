// features/home/presentation/views/home_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/list_view_categories.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_form_field.dart';

class HomeViewBody extends StatefulWidget {
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  var Searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        DefaultFormField(
            Controller: Searchcontroller,
            hintText: 'what do you want?',
            Validator: null,
            Prefix: Icons.search_rounded),
        Row(
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleMedium(
                  text: 'Up to 25% offer!',
                  bold: true,
                  textColor: LightAppColors.maincolorgreen400,
                ),
                4.h.heightSizedBox,
                TitleText(
                  text: 'Hurry to catch this',
                  textColor: LightAppColors.maincolorgreen400,
                ),
                5.h.heightSizedBox,
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightAppColors.maincolorgreen400,
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
              width: 180,
              // width: 175.w,
            )
          ]),
        ),
        //  10.h.heightSizedBox,
        const Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 10),
            child: HeadLine22(
              text: 'Categories',
            )),
        ListViewCategories(),
        const Padding(
          padding: EdgeInsetsDirectional.only(
            top: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadLine22(
                text: 'Popular',
              ),
              SmallHeader(
                text: 'See all >',
              )
            ],
          ),
        ),
        const GridViewPopular()
      ]),
    );
  }
}
