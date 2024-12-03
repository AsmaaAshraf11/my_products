// features/login/presentation/views/widgets/logo_image.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key, required this.Image, required this.Color});

  final Image;
  final Color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {},
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Color, borderRadius: BorderRadius.circular(10)),
          child: Image.asset(Image)),
    );
  }
}
