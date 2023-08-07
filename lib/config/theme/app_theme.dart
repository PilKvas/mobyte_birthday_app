import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/constants/app_colors.dart';

ThemeData birthdayTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      labelLarge: TextStyle(
        color: AppColors.sliderText,
        fontSize: 24.sp,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: AppColors.headlineText,
        fontSize: 14.sp,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 24.sp,
        fontFamily: 'YesevaOne',
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: AppColors.titleSmall,
        fontSize: 14.sp,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: AppColors.collapse,
        fontSize: 14.sp,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w400,
      ),
    ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder:  OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(71, 128, 42, 1),
      ),
    ),
    labelStyle:  TextStyle(
      color: Color(0xFF4E4343),
    ),
    suffixIconColor:  Color.fromRGBO(71, 128, 42, 1),
    fillColor:  Color.fromRGBO(242, 248, 239, 1),
    border:  OutlineInputBorder(borderSide: BorderSide.none),
    filled: true,
    focusColor: Colors.black,
  ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 17.h,
        ),
        backgroundColor: AppColors.homePageButton,
      ),
    ),
  );
  
}

class ListTileCustomTheme {
  static TextStyle listTileStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        );
  }

  static TextStyle caption(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          color: AppColors.listTileCaption,
          decoration: TextDecoration.none,
        );
  }
}

