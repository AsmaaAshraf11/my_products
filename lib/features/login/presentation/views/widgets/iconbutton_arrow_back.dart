// features/login/presentation/views/widgets/iconbutton_arrow_back.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';

class IconbuttonArrowBack extends StatelessWidget {
  final route;

  const IconbuttonArrowBack({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: IconButton(
          icon: Icon(
              size: 27,
              Icons.arrow_back_ios_new_rounded,
              color: LightAppColors.maincolorgreen700),
          onPressed: () {
            pushRoute(context, route);
          },
        ),
      ),
    );
  }
}
