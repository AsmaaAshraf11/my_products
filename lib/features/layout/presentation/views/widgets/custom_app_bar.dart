// features/layout/presentation/views/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(ImageAssets.profile),
          ),
          15.w.widthSizedBox,
          Column(
            children: [
              const TitleMedium(
                text: 'welcome!',
              ),
              HeadLine22(
                text: 'Aml Kamal',
              ),
            ],
          ),
          SizedBox(
            width: context.screenWidth *0.25,
          ),
          Row(
            children: [
              Container(
                height: 35.h,
                width: 35.w,
                decoration: BoxDecoration(
                    color: LightAppColors.maincolorgreen700,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  padding:EdgeInsets.all(0),
                  icon:
                      Icon(size: 26, Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    pushRoute(context, Routes.cart);
                  },
                ),
              ),
              7.w.widthSizedBox,
              Container(
                height: 35.h,
                width: 35.w,
                decoration: BoxDecoration(
                    color: LightAppColors.maincolorgreen700,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  padding:EdgeInsets.all(0),
                  icon:
                      Icon(size: 26, Icons.notifications, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
