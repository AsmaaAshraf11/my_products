// features/layout/presentation/views/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
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
          const Column(
            children: [
              TitleMedium(
                text: 'welcome!',
              ),
              HeadLine22(
                text: 'Aml Kamal',
              ),
            ],
          ),
          90.w.widthSizedBox,
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: LightAppColors.maincolorgreen700,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  icon:
                      Icon(size: 27, Icons.shopping_cart, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              7.w.widthSizedBox,
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: LightAppColors.maincolorgreen700,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  icon:
                      Icon(size: 27, Icons.notifications, color: Colors.white),
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
