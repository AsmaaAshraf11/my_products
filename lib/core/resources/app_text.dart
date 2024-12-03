// core/resources/app_text.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_fonts.dart';

class HeadLine21 extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;

  const HeadLine21(
      {super.key, required this.text, this.fontSize = FontSize.s21, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: textColor??AppColors.black,
            fontSize: fontSize,
             fontWeight:FontWeight.bold 
          ),
    );
  }
}

/////
class HeadLineText extends StatelessWidget {
  final String text;

  const HeadLineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;
  final bool? inCenter;

  const TitleText(
      {super.key,
      required this.text,
      this.fontSize = FontSize.s14,
      this.textColor,this.inCenter=true});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
            //fontFamily: FontConstants.iBMFontFamily,
            fontSize: fontSize,
            color: textColor ?? LightAppColors.black,
            fontWeight:FontWeight.w500, 
          ),
      textAlign: inCenter == true ? TextAlign.center : null,
    );
  }
}

class TitleMedium extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;
    final bool? inCenter;

  const TitleMedium(
      {super.key,
      required this.text,
      this.fontSize = FontSize.s17,
      this.textColor, this.inCenter, 
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
        textAlign: inCenter == true ? TextAlign.center : null,  
            style: TextStyle(
           
            fontSize: fontSize,
            color: textColor ??LightAppColors.graycolor700,
          ),
    );
  }
}

class SmallHeader extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;

   const SmallHeader(
      {super.key,
      required this.text,
      this.fontSize = FontSize.s13,
      this.color ,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        //fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color:color??  LightAppColors.graycolor600,
          ),
   //   textAlign: TextAlign.left,
    );
  }
}
