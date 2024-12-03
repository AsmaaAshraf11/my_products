// features/login/presentation/views/widgets/images_google_apple_fece.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/features/login/presentation/views/widgets/logo_image.dart';

class ImagesGoogleAppleFece extends StatelessWidget {
  const ImagesGoogleAppleFece({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onDoubleTap: () {},
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: LightAppColors.pink50,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(ImageAssets.google)),
          ),
        ),
        GestureDetector(
          onDoubleTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: LightAppColors.blue50,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(ImageAssets.apple)),
          ),
        ),
        GestureDetector(
          onDoubleTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: LightAppColors.blue50,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(ImageAssets.face)),
          ),
        ),

        // LogoImage(
        // Image: ImageAssets.google,
        //  Color: LightAppColors.pink50,
        //  ),
        //  LogoImage(
        // Image: ImageAssets.apple,
        //  Color:LightAppColors.blue50,
        //  ),
        //  LogoImage(
        // Image: ImageAssets.face,
        //  Color: LightAppColors.blue50,
        //  ),
      ],
    );
  }
}
