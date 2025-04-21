// features/component/iconbutton_arrow_back.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';

class IconbuttonArrowBack extends StatelessWidget {
  final route;
  final arguments;
  Color iconColor;
  Color buttonColor;
  var padding;
  final onPressed;
  IconData? icon;
  IconbuttonArrowBack(
      {super.key,
      this.route,
      this.arguments,
      required this.iconColor,
      this.onPressed,
      this.icon,
      required this.buttonColor,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(12)),
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(
              size: 27,
              icon ?? Icons.arrow_back_ios_new_rounded,
              color: iconColor),
          onPressed: onPressed ??
              () {
                pushAndRemoveRoute(context, route,arguments:arguments );
              },
        ),
      ),
    );
  }
}
