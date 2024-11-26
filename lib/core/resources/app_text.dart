import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_fonts.dart';

class HeadLine24 extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;

  const HeadLine24(
      {super.key, required this.text, this.fontSize = FontSize.s24, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: textColor??AppColors.black,
            fontSize: fontSize,
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
      this.fontSize = FontSize.s16,
      this.textColor,this.inCenter=true});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //fontFamily: FontConstants.iBMFontFamily,
            fontSize: fontSize,
            color: textColor ?? LightAppColors.textBlueGrey,
          ),
      textAlign: inCenter == true ? TextAlign.center : null,
    );
  }
}

class TitleMedium extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;

  const TitleMedium(
      {super.key,
      required this.text,
      this.fontSize = FontSize.s16,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: FontConstants.tajawalFontFamily,
            fontSize: fontSize,
            color: textColor ?? AppColors.black,
          ),
    );
  }
}

class SmallHeader extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const SmallHeader(
      {super.key,
      required this.text,
      this.fontSize = FontSize.s16,
      this.color = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: fontSize,
            color: color,
          ),
      textAlign: TextAlign.left,
    );
  }
}
