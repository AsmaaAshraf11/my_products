// features/component/text_form_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/resources/app_colors.dart';

Widget DefaultFormField({
  required TextEditingController Controller,
  TextInputType? Type,
  required Validator,
  onChange,
  onSubmit,
  onTap,
  bool? nonborder,
  bool isobscureText = false,
  bool IsClickable = true,
  Widget? Label,
  IconData? Prefix,
  Widget? suffix,
  String? hintText,
  double? fonthintText,
  double? width,
  List<TextInputFormatter>? inputFormatter,
  //Function? suffixprees,
}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 50.h,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: Controller,
        keyboardType: Type,
        obscureText: isobscureText,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        enabled: IsClickable,
        validator: Validator,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
            label: Label,
            labelStyle:
                TextStyle(fontSize: 18, color: LightAppColors.primary400),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: fonthintText ?? 13,
              color: LightAppColors.graycolor600,
            ),
            floatingLabelStyle: const TextStyle(fontSize: 18),
            prefixIcon: Icon(Prefix, color: LightAppColors.primary400),
            suffixIcon: suffix,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: LightAppColors.primary400,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  // BorderSide.none,
                  BorderSide(
                width: 1,
                color: LightAppColors.graycolor600,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true,
            fillColor: Colors.grey[100]),
      ),
    );
