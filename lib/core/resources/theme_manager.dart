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







  primarySwatch: LightAppColors.primarySwatch,
  primaryColor: LightAppColors.primary,
  primaryColorLight: LightAppColors.primaryTextColor,
  primaryColorDark: LightAppColors.secondaryTextColor,
  canvasColor: LightAppColors.background2,
  secondaryHeaderColor: LightAppColors.secondary,
  disabledColor: LightAppColors.disabled,
  indicatorColor: LightAppColors.inactive,
  cardColor: LightAppColors.card,
  // highlightColor: LightAppColors.primary,
  // splashColor: LightAppColors.primary,
  splashColor: AppColors.transparentColor,
  highlightColor: AppColors.transparentColor,
  hoverColor: LightAppColors.secondaryTextColor,
  hintColor: LightAppColors.background2,
  focusColor: LightAppColors.background2,
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
      systemNavigationBarColor: LightAppColors.primary,
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
  buttonTheme: ButtonThemeData(
    shape: StadiumBorder(),
    disabledColor: LightAppColors.disabled,
    buttonColor: LightAppColors.primary,
    splashColor: LightAppColors.splash,
  ),

  // elevated button them
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(
          color: LightAppColors.primaryTextColor, fontSize: FontSize.s22),
      backgroundColor: LightAppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      disabledBackgroundColor: LightAppColors.disabled,
    ),
  ),
  // text theme
  textTheme: TextTheme(
    headlineLarge: getBoldStyle(color: AppColors.white, fontSize: FontSize.s30),
    headlineSmall: getBoldStyle(color: AppColors.white, fontSize: FontSize.s16),
    displaySmall:
        getSemiBoldStyle(color: AppColors.white, fontSize: FontSize.s16),
    labelMedium:
        getRegularStyle(color: AppColors.white, fontSize: FontSize.s18),
    displayLarge:
        getBoldStyle(color: LightAppColors.textGrey, fontSize: FontSize.s30),
    bodyMedium: getRegularStyle(
      color: LightAppColors.textBlueGrey,
      fontSize: FontSize.s16,
    ),
    titleMedium: getMediumStyle(color: AppColors.black, fontSize: FontSize.s16),
    // headlineMedium: getMediumStyle(
    //   color: AppColors.black,
    //   fontSize: FontSize.s16,
    // ),

    labelSmall: getRegularStyle(
        color: LightAppColors.primaryTextColor, fontSize: FontSize.s12),
    labelLarge: getBoldStyle(
        color: LightAppColors.primaryTextColor, fontSize: FontSize.s24),
    displayMedium:
        getMediumStyle(color: AppColors.black, fontSize: FontSize.s18),
    titleSmall: getMediumStyle(color: AppColors.black, fontSize: FontSize.s16),
  ),
  // input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(
    // prefixIconColor
    prefixIconColor: LightAppColors.iconColor,
    // content padding
    contentPadding: const EdgeInsets.all(AppPadding.p8),
    // hint style
    hintStyle: getRegularStyle(color: AppColors.grey, fontSize: FontSize.s14),
    labelStyle: getMediumStyle(color: AppColors.grey, fontSize: FontSize.s14),
    errorStyle: getRegularStyle(color: AppColors.reset),
    // enabled border style
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // focused border style
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // error border style
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.reset, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // focused border style
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
  ),
  fontFamily: FontConstants.tajawalFontFamily,
);

//
ThemeData darkTheme = ThemeData(
  primarySwatch: DarkAppColors.primarySwatch,
  primaryColor: DarkAppColors.primary,
  primaryColorLight: DarkAppColors.primaryTextColor,
  primaryColorDark: DarkAppColors.secondaryTextColor,
  canvasColor: DarkAppColors.background,
  secondaryHeaderColor: DarkAppColors.secondary,
  disabledColor: DarkAppColors.disabled,
  indicatorColor: DarkAppColors.inactive,
  cardColor: DarkAppColors.card,
  highlightColor: DarkAppColors.primary2,
  splashColor: DarkAppColors.primary2,
  hoverColor: DarkAppColors.background,
  hintColor: DarkAppColors.primary2,
  focusColor: DarkAppColors.box,
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
      systemNavigationBarColor: DarkAppColors.primary2,
      statusBarColor: DarkAppColors.background,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: AppColors.transparentColor,
    ),
  ),
  // button theme
  buttonTheme: ButtonThemeData(
    shape: StadiumBorder(),
    disabledColor: LightAppColors.disabled,
    buttonColor: LightAppColors.primary,
    splashColor: LightAppColors.splash,
  ),
  // elevated button them
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(
          color: DarkAppColors.primaryTextColor, fontSize: FontSize.s22),
      backgroundColor: DarkAppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      disabledBackgroundColor: DarkAppColors.disabled,
    ),
  ),
  // text theme
  textTheme: TextTheme(
    headlineSmall: getSemiBoldStyle(color: DarkAppColors.skipColor),
    headlineLarge:
        getBoldStyle(color: DarkAppColors.primary, fontSize: FontSize.s30),
    labelMedium: getRegularStyle(
        color: DarkAppColors.primaryTextColor, fontSize: FontSize.s16),
    bodyMedium:
        getRegularStyle(color: DarkAppColors.inputHint, fontSize: FontSize.s16),
    titleMedium: getMediumStyle(
        color: DarkAppColors.primaryTextColor, fontSize: FontSize.s15),
    labelSmall: getRegularStyle(
        color: DarkAppColors.primaryTextColor, fontSize: FontSize.s12),
    displayLarge: getSemiBoldStyle(
        color: DarkAppColors.primaryTextColor, fontSize: FontSize.s15),
    labelLarge: getBoldStyle(
        color: DarkAppColors.primaryTextColor, fontSize: FontSize.s24),
    headlineMedium: getRegularStyle(
      color: AppColors.black,
      fontSize: FontSize.s18,
    ),
    displayMedium:
        getMediumStyle(color: AppColors.white, fontSize: FontSize.s18),
    titleSmall: getMediumStyle(color: AppColors.white, fontSize: FontSize.s16),
  ),
  // input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(
    // prefixIconColor
    prefixIconColor: LightAppColors.iconColor,
    // content padding
    contentPadding: const EdgeInsets.all(AppPadding.p8),
    // hint style
    hintStyle: getRegularStyle(color: AppColors.grey, fontSize: FontSize.s14),
    labelStyle: getMediumStyle(color: AppColors.grey, fontSize: FontSize.s14),
    errorStyle: getRegularStyle(color: AppColors.reset),
    // enabled border style
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // focused border style
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // error border style
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.reset, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // focused border style
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
  ),
  fontFamily: FontConstants.tajawalFontFamily,
);