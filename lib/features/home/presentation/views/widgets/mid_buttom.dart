// features/home/presentation/views/widgets/mid_buttom.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/resources/app_colors.dart';

class MidButtom extends StatelessWidget {
  const MidButtom({super.key, required this.text, required this.onPressed});
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 140.w,
        color: LightAppColors.maincolorgreen700,
        height: 42,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        onPressed: () {
          onPressed();
        });
  }
}
