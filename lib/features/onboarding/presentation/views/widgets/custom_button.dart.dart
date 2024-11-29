// features/onboarding/presentation/views/widgets/custom_button.dart.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.onPressed,
    required this.borderColor,
    required this.roundedRectangleBorder,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final RoundedRectangleBorder roundedRectangleBorder;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        shape: roundedRectangleBorder,
      ),
      onPressed: onPressed,
      child: Text(text,
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: textColor,
          )),
    );
  }
}
