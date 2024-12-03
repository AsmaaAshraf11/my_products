// features/login/presentation/views/widgets/background_image.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade300,
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        ImageAssets.start,
        width: double.infinity,
        fit: BoxFit.fill,
        //  color: Colors.green.shade100,
      ),
    );
  }
}
