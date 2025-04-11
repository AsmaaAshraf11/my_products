// core/resources/theme_manager.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_fonts.dart';
import 'package:myproducts/core/resources/text_styles_manager.dart';
import 'package:myproducts/core/resources/values_manager.dart';
//import 'package:myproducts/features/business_logic/theme/theme_cubit.dart';

// ThemeData getApplicationTheme(themeMode) {
//   return themeMode == MyThemeMode.light ? lightTheme : darkTheme;
// }

ThemeData lightTheme = ThemeData(
  disabledColor: LightAppColors.iconListTil,
  focusColor: LightAppColors.textcolor,
  unselectedWidgetColor: LightAppColors.unselecteColor,

  primarySwatch: LightAppColors.primarySwatch,
  primaryColor: LightAppColors.primary,
  primaryColorLight: LightAppColors.primaryTextColor,
  primaryColorDark: LightAppColors.secondaryTextColor,
  canvasColor: LightAppColors.background2,
  secondaryHeaderColor: LightAppColors.secondary,

  indicatorColor: LightAppColors.inactive,
  cardColor: LightAppColors.card,
  // highlightColor: LightAppColors.primary,
  // splashColor: LightAppColors.primary,
  splashColor: AppColors.transparentColor,
  highlightColor: AppColors.transparentColor,
  hoverColor: LightAppColors.secondaryTextColor,
  hintColor: LightAppColors.background2,
  dividerColor: LightAppColors.selectedItem,

  shadowColor: LightAppColors.secondaryTextColor,
  // colorScheme: const ColorScheme.light( //use this for dark and light mode
  //   onPrimary: Colors.white,
  //   secondary: Colors.blueAccent,
  // ),

  // app bar theme
  appBarTheme: AppBarTheme(
    //centerTitle: false,
    // color: LightAppColors.secondaryTextColor,
    elevation: AppSize.s0,
    surfaceTintColor: LightAppColors.card,
    //shadowColor: LightAppColors.secondaryTextColor,
    backgroundColor: LightAppColors.background2,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: LightAppColors.background2,
      // top bg color
      systemNavigationBarColor: Colors.black,
      // bottom bg color
      statusBarBrightness: Brightness.light,
      // top text color  // make this light
      systemNavigationBarIconBrightness: Brightness.light,
      // bottom text color
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: AppColors.transparentColor,
    ),
  ),
  // button theme
);

//
ThemeData darkTheme = ThemeData(
  disabledColor: DarkAppColors.iconListTil,
  focusColor: DarkAppColors.textcolor,
  unselectedWidgetColor: DarkAppColors.unselecteColor,

  primarySwatch: DarkAppColors.primarySwatch,
  primaryColor: DarkAppColors.primary,
   primaryColorLight:LightAppColors.primaryTextColor,
  primaryColorDark: DarkAppColors.textcolor,
  canvasColor: DarkAppColors.background,
  secondaryHeaderColor: DarkAppColors.secondary,

  indicatorColor: DarkAppColors.inactive,
  cardColor: DarkAppColors.card,
  highlightColor: DarkAppColors.primary2,
  splashColor: DarkAppColors.primary2,
  hoverColor: DarkAppColors.background,
  hintColor: DarkAppColors.primary2,
  dividerColor: DarkAppColors.selectedItem,

  shadowColor: DarkAppColors.primary2,
  // app bar theme
  appBarTheme: const AppBarTheme(
    //centerTitle: false,
    // color: LightAppColors.secondaryTextColor,
    elevation: AppSize.s0,
    //shadowColor: LightAppColors.secondaryTextColor,
    surfaceTintColor: DarkAppColors.background,
    backgroundColor: DarkAppColors.background,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: DarkAppColors.background,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: AppColors.transparentColor,
    ),
  ),
  // button theme

  // elevated button them

  // text theme
);
