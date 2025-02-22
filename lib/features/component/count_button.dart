// features/component/count_button.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';

class CountButton extends StatelessWidget {
  IconData icons;
  double size;
  //double radius;
  Function onPressed;
  CountButton(
      {required this.icons,
      required this.onPressed,
     // required this.radius,
      required this.size,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: LightAppColors.primary700,
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed(),
              icon: Icon(
                icons,
                color: Colors.white,
                size: size,
              )),
        ),
      ],
    );
  }
}
