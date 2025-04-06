// features/profile/presentation/views/widgets/min_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/resources/app_colors.dart';

class MinButton extends StatelessWidget {
  MinButton({super.key, required this.text, required this.onPressed});
  String text;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 100.w,
        color: LightAppColors.primary700,
        height: 35,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        onPressed: () {
          onPressed();
        });
  }
}
