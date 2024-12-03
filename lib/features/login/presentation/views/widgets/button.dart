// features/login/presentation/views/widgets/button.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';

Widget defaultButton({required String text, required Function onPressed}) {
  return MaterialButton(
      minWidth: double.infinity,
      color: LightAppColors.maincolorgreen700,
      // const Color.fromARGB(255, 76, 144, 175),
      height: 50,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        onPressed();
      });
}
