// features/profile/presentation/views/widgets/image_profile.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Stack(children: [
            SizedBox(
              // width: 120.w,
              //  height: 120.h,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(ImageAssets.profile),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: LightAppColors.maincolorgreen400,
                    radius: 17,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_enhance,
                          size: 19,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}