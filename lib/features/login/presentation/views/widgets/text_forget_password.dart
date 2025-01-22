// features/login/presentation/views/widgets/text_forget_password.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';

class TextAndTextButton extends StatelessWidget {
  final text1;
  final text2;
  final Route;

  const TextAndTextButton(
      {super.key,
      required this.text1,
      required this.text2,
      required this.Route});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          // bottom: 30
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: LightAppColors.graycolor600),
            ),
            InkWell(
              onTap: () {
                pushAndRemoveRoute(context, Route);
              },
              //onPressed: () {  },
              child: Text(
                text2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: LightAppColors.maincolorgreen700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
