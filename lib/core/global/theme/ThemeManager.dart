import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ColorManager.dart';
import 'FontManager.dart';
import 'StylesManager.dart';
import 'ValuesManager.dart';

ThemeData getApplicationThemData() {
  return ThemeData().copyWith(

      //main colors
      highlightColor: ColorManager.primary.withOpacity(0.1),
      canvasColor: Colors.transparent,
      //primaryIconTheme: IconThemeData(color: ColorManager.grayColor),
      colorScheme: const ColorScheme.light().copyWith(
          primary: ColorManager.primary, secondary: ColorManager.primary),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: ColorManager.primary),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.lightSecondary,
      //cardview theme
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: ColorManager.shadowColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
      //app bar theme
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorManager.lightIconColor),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark),
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle:
              getTitleSemiBoldStyle(color: ColorManager.lightIconColor)),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      //button theme
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          disabledColor: ColorManager.lightSecondary,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.lightPrimary),
      //elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: getBoldTextStyle(color: Colors.white),
        backgroundColor: ColorManager.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      )),

      //input theme

      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: ColorManager.lightBackGround,
        contentPadding: const EdgeInsets.all(AppPadding.p18),
        hintStyle: getTitleSemiBoldStyle(
            fontSize: FontSize.s16,
            color: ColorManager.lightTextColor.withOpacity(0.62)),
        labelStyle: getRegularTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.lightTextColor,
            line: false),
        errorStyle: getTitleSemiBoldStyle(
            fontSize: FontSize.s14, color: ColorManager.cancel),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightBackGround, width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.cancel, width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.cancel, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
      ));
}
