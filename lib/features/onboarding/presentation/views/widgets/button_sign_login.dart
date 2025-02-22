// features/onboarding/presentation/views/widgets/button_sign_login.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';

class ButtonSignLogin extends StatelessWidget {
  const ButtonSignLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.green),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
          ),
          onPressed: () {
            pushAndRemoveRoute(context, Routes.loginScreen);
          },
          child: Text('Log In',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: LightAppColors.primary700,
              )),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: LightAppColors.primary700,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
          ),
          onPressed: () {
            pushAndRemoveRoute(context, Routes.signUpScreen);
          },
          child: const Text('Sign Up',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
